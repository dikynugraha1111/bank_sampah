import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/constant/app_text.dart';
import 'package:flutter/material.dart';

typedef OnTapEdit = void Function();

class ProfileUserItemSection extends StatelessWidget {
  const ProfileUserItemSection({
    Key? key,
    required this.title,
    required this.value,
    this.canEdit = false,
    this.onTapEdit,
  }) : super(key: key);

  final String title;
  final String value;
  final bool canEdit;
  final OnTapEdit? onTapEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 8.0,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: AppText.text14.copyWith(
                color: AppColors.outerSpace,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: onTapEdit,
              child: Text(
                value,
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
                style: AppText.text12.copyWith(
                  color: AppColors.sonicSilver,
                ),
              ),
            ),
          ),
          if (canEdit)
            InkWell(
              onTap: onTapEdit,
              child: const Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Icon(
                  Icons.edit,
                  color: AppColors.greenSheen,
                  size: 14.0,
                ),
              ),
            )
        ],
      ),
    );
  }
}
