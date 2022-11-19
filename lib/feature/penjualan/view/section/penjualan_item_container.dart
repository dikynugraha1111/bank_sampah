import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/constant/app_text.dart';
import 'package:bank_sampah/constant/helper.dart';
import 'package:flutter/material.dart';

class PenjualanItemContainer extends StatelessWidget {
  const PenjualanItemContainer(
    this.isDeposit,
    this.transactionAmount,
    this.dateTime, {
    Key? key,
  }) : super(key: key);

  final bool isDeposit;
  final int transactionAmount;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    Widget penjualanIcon() => Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
            color: isDeposit
                ? AppColors.greenSheen.withOpacity(0.15)
                : AppColors.salmon.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: isDeposit
              ? const Icon(
                  Icons.download,
                  size: 24.0,
                  color: AppColors.greenSheen,
                )
              : const Icon(
                  Icons.upload,
                  size: 24.0,
                  color: AppColors.salmon,
                ),
        );

    Widget titleSection() => Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isDeposit ? "Penjualan Sampah" : "Penarikan Saldo",
              style: AppText.text12.copyWith(
                color: AppColors.outerSpace,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              DateTime.now().toDateString,
              style: AppText.text10.copyWith(color: AppColors.outerSpace),
            )
          ],
        );

    Widget transactionAmountText() => Text(
          "${isDeposit ? "+" : "-"} Rp $transactionAmount",
          textAlign: TextAlign.end,
          style: AppText.text12.copyWith(
            color: isDeposit ? AppColors.greenSheen : AppColors.salmon,
            fontWeight: FontWeight.w600,
          ),
        );

    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          penjualanIcon(),
          const SizedBox(width: 12.0),
          titleSection(),
          Expanded(
            child: transactionAmountText(),
          ),
        ],
      ),
    );
  }
}
