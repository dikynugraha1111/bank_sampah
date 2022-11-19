import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/constant/app_text.dart';
import 'package:flutter/material.dart';

class ProfileBanner extends StatefulWidget {
  const ProfileBanner(this.isFromDashboard, {Key? key}) : super(key: key);

  final bool isFromDashboard;

  @override
  State<ProfileBanner> createState() => _ProfileBannerState();
}

class _ProfileBannerState extends State<ProfileBanner> {
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 60.0,
                width: 60.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightGrey,
                ),
              ),
              const SizedBox(width: 28.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Diky Nugraha Difiera",
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
            ],
          ),
        );

    Widget countTransactionContainer(
      int transaction,
      int point,
    ) =>
        Container(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Saldo",
                      style: AppText.text10.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.lightGrey,
                      ),
                    ),
                    Text(
                      "Rp xxxx",
                      style: AppText.text14.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.greenSheen,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: VerticalDivider(color: AppColors.lightGrey),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Point",
                      style: AppText.text10.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.lightGrey,
                      ),
                    ),
                    Text(
                      " Pt",
                      style: AppText.text14.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.greenSheen,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

    Widget backButton() => InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
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
        );

    Widget appBarBanner() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Profile",
                    style: AppText.text16.copyWith(
                      color: AppColors.greenSheen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              widget.isFromDashboard ? const SizedBox() : backButton(),
            ],
          ),
        );

    Widget contentBanner() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 21.0),
            appBarBanner(),
            const SizedBox(height: 16.0),
            titleBanner(),
            const Expanded(child: SizedBox()),
            countTransactionContainer(5, 100),
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
