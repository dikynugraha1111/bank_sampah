import 'package:bank_sampah/constant/app_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OverflowLoadingPage extends StatelessWidget {
  const OverflowLoadingPage({
    required this.body,
    required this.visibility,
    Key? key,
  }) : super(key: key);

  final Widget body;
  final bool visibility;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        body,
        Visibility(
          visible: visibility,
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    "assets/icons/loading.json",
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 72),
                    child: Text(
                      "Loading ....",
                      style: AppText.text16.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
