import 'package:bank_sampah/feature/login/screen/login_page.dart';
import 'package:bank_sampah/feature/onboard/domain/onboard_item.dart';
import 'package:bank_sampah/feature/onboard/screen/section/onboard_action_button.dart';
import 'package:bank_sampah/feature/onboard/screen/section/onboard_content.dart';
import 'package:flutter/material.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const OnboardPage());
  }

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  int _scrollIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_scrollIndex != 0) {
          _pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          setState(() {
            _scrollIndex--;
          });
        }
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              OnboardContent(
                _pageController,
                (page) {
                  setState(() {
                    _scrollIndex = page;
                  });
                },
                dummyOnboard,
              ),
              OnboardActionButton(
                dummyOnboard.length,
                _scrollIndex,
                () {
                  _pageController.jumpToPage(dummyOnboard.length - 1);
                  setState(() {
                    _scrollIndex = dummyOnboard.length - 1;
                  });
                },
                () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                  setState(() {
                    _scrollIndex++;
                  });
                },
                () {
                  Navigator.of(context).pushReplacement(LoginPage.route());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
