import 'package:bank_sampah/constant/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardIndicator extends StatelessWidget {
  const OnboardIndicator(
    this.contentLength,
    this.scrollIndex, {
    Key? key,
  }) : super(key: key);
  final int contentLength;
  final int scrollIndex;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 35.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            contentLength,
            (index) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                width: 16.0,
                height: 16.0,
                decoration: BoxDecoration(
                  color: scrollIndex == index
                      ? AppColors.spanishYellow
                      : AppColors.lightGrey,
                  shape: BoxShape.circle,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
