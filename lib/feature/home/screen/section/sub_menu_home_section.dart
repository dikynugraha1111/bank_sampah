import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/constant/app_text.dart';
import 'package:bank_sampah/constant/url_asset.dart';
import 'package:bank_sampah/feature/mitra/view/mitra_page.dart';
import 'package:bank_sampah/feature/penjualan/view/penjualan_page.dart';
import 'package:bank_sampah/feature/sampah/view/sampah_page.dart';
import 'package:flutter/material.dart';

class SubMenuHomeSection extends StatelessWidget {
  const SubMenuHomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget commonSubMenuSection(
      String imageUrl,
      Color color,
      String badgesText,
      String titleLineOne,
      String titleLineTwo,
      void Function() onTap,
    ) =>
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 8.0,
              right: 8.0,
              bottom: 14.0,
            ),
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  imageUrl,
                ),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      badgesText,
                      style: AppText.text12.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Text(
                    "$titleLineOne\n$titleLineTwo",
                    style: AppText.text12.copyWith(
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                )
              ],
            ),
          ),
        );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          commonSubMenuSection(
            UrlAsset.subMenu1,
            AppColors.salmon,
            "Js",
            "Jenis",
            "Sampah",
            () {
              Navigator.of(context).push(SampahPage.route());
            },
          ),
          commonSubMenuSection(
            UrlAsset.subMenu2,
            AppColors.greenSheen,
            "Rp",
            "Hasil",
            "Jual Sampah",
            () {
              Navigator.of(context)
                  .push(PenjualanPage.route(isFromDashboard: false));
            },
          ),
          commonSubMenuSection(
            UrlAsset.subMenu3,
            AppColors.purpleNavy,
            "MB",
            "Mitra",
            "Bisnis",
            () {
              Navigator.of(context).push(MitraPage.route());
            },
          ),
        ],
      ),
    );
  }
}
