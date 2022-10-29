import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/constant/app_text.dart';
import 'package:bank_sampah/feature/onboard/screen/onboard_page.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  timer() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        OnboardPage.route(),
      );
    });
  }

  @override
  void initState() {
    timer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Bank",
                      style: AppText.secondaryText16.copyWith(
                        color: AppColors.salmon,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "Sampah",
                      style: AppText.secondaryText16.copyWith(
                        color: AppColors.greenSheen,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                "RW 06 Umbulharjo",
                textAlign: TextAlign.center,
                style: AppText.secondaryText12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
