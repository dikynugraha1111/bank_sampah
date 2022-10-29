import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/constant/app_text.dart';
import 'package:bank_sampah/widget/misc/default_circular_progress.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.isBlockSize = true,
    this.outlined = false,
    this.isFullWidth = false,
    this.trailingIcon,
    this.needBorderSide = true,
  }) : super(key: key);

  final String text;

  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final bool isBlockSize;
  final bool outlined;
  final bool isFullWidth;
  final Widget? trailingIcon;
  final bool needBorderSide;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: (isBlockSize)
            ? Size(
                MediaQuery.of(context).size.width - (isFullWidth ? 0 : 48),
                50.0,
              )
            : null,
        minimumSize: const Size(40, 40),
        primary: (outlined) ? Colors.white : AppColors.greenSheen,
        onPrimary: (outlined) ? AppColors.greenSheen : Colors.white,
        side: needBorderSide
            ? const BorderSide(
                color: AppColors.greenSheen,
                width: 1,
              )
            : const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 0,
      ),
      onPressed: (isDisabled || isLoading) ? null : onPressed,
      child: (!isLoading)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                trailingIcon ?? const SizedBox(),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppText.text14.copyWith(
                    color: (outlined) ? AppColors.greenSheen : Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          : DefaultCircularProgress(
              color: (outlined) ? AppColors.greenSheen : Colors.white,
            ),
    );
  }
}
