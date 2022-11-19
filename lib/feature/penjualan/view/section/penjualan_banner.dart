import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/constant/app_text.dart';
import 'package:flutter/material.dart';

class PenjualanBanner extends StatefulWidget {
  const PenjualanBanner(this.isFromDashboard, {Key? key}) : super(key: key);

  final bool isFromDashboard;

  @override
  State<PenjualanBanner> createState() => _PenjualanBannerState();
}

class _PenjualanBannerState extends State<PenjualanBanner> {
  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() => Image.asset(
          "assets/images/home_banner.png",
          width: double.infinity,
          height: 180.0,
          fit: BoxFit.cover,
        );

    Widget titleBanner() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Daftar Transaksi Penjualan\nBank Sampah",
                style: AppText.text16.copyWith(
                  color: AppColors.greenSheen,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2.0),
              Text(
                "RW 06, Umulharjo",
                style: AppText.text10.copyWith(
                  color: AppColors.lightGrey,
                ),
              )
            ],
          ),
        );

    Widget countTransactionContainer(int transaction) => Container(
          width: double.infinity,
          height: 65.0,
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 4.0,
                offset: const Offset(1, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Jumlah Transaksi",
                style: AppText.text10.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.lightGrey,
                ),
              ),
              Text(
                "$transaction Transaksi",
                style: AppText.text14.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.greenSheen,
                ),
              ),
            ],
          ),
        );

    Widget backButton() => InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.only(
              top: 14.0,
              left: 18.0,
              bottom: 4.0,
            ),
            child: Container(
              width: 24.0,
              height: 24.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 4.0,
                    offset: const Offset(1, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 16.0,
                color: AppColors.greenSheen,
              ),
            ),
          ),
        );

    Widget contentBanner() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.isFromDashboard
                ? const SizedBox(height: 42.0)
                : backButton(),
            titleBanner(),
            const Expanded(child: SizedBox()),
            countTransactionContainer(5),
          ],
        );

    return SizedBox(
      width: double.infinity,
      height: 210.0,
      child: Stack(
        children: [
          backgroundImage(),
          contentBanner(),
        ],
      ),
    );
  }
}
