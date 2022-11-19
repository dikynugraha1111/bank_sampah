import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/constant/app_text.dart';
import 'package:bank_sampah/feature/home/screen/section/banner_home_section.dart';
import 'package:bank_sampah/feature/home/screen/section/sub_menu_home_section.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Widget buildTitleSection(String title) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Text(
          title,
          style: AppText.text14.copyWith(
            color: AppColors.outerSpace,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const BannerHomeSection(),
        const SizedBox(height: 30.0),
        buildTitleSection("Selamatkan Bumi"),
        const SizedBox(height: 18.0),
        const SubMenuHomeSection(),
        const SizedBox(height: 30.0),
        buildTitleSection("Cerita Inspirasi"),
        const SizedBox(height: 18.0),
        // Note : Story Section
      ],
    );
  }
}
