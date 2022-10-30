import 'package:bank_sampah/constant/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constant/app_colors.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem(this.callback, this.active, this.svgSource, this.label,
      {Key? key})
      : super(key: key);

  final VoidCallback callback;
  final bool active;
  final String svgSource;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: callback,
          iconSize: 24.0,
          icon: SvgPicture.asset(
            svgSource,
            color: active ? AppColors.greenSheen : AppColors.sonicSilver,
          ),
        ),
        Text(
          label,
          style: AppText.text12.copyWith(
            color: active ? AppColors.greenSheen : AppColors.sonicSilver,
            height: 0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
