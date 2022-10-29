import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/constant/app_text.dart';
import 'package:bank_sampah/feature/onboard/screen/section/onboard_indicator.dart';
import 'package:bank_sampah/widget/button/default_button.dart';
import 'package:flutter/material.dart';

class OnboardActionButton extends StatelessWidget {
  const OnboardActionButton(
    this.contentLength,
    this.scrollIndex,
    this.onPressedSkip,
    this.onPressedNext,
    this.onPressedFinish, {
    Key? key,
  }) : super(key: key);

  final int contentLength;
  final int scrollIndex;
  final void Function() onPressedSkip;
  final void Function() onPressedNext;
  final void Function() onPressedFinish;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          OnboardIndicator(
            contentLength,
            scrollIndex,
          ),
          scrollIndex == (contentLength - 1)
              ? ButtonDefault(
                  text: 'Masuk',
                  onPressed: onPressedFinish,
                  isBlockSize: true,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: onPressedSkip,
                        child: Text(
                          "Lewati",
                          style: AppText.text14.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightGrey,
                          ),
                        )),
                    ButtonDefault(
                      text: "Selanjutnya",
                      onPressed: onPressedNext,
                      isBlockSize: false,
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
