import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/constant/app_text.dart';
import 'package:bank_sampah/feature/dashboard/screen/dashboard_page.dart';
import 'package:bank_sampah/feature/onboard/screen/onboard_page.dart';
import 'package:bank_sampah/feature/profile/view/section/profile_banner.dart';
import 'package:bank_sampah/widget/button/default_button.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView(this.isFromDashboard, {Key? key}) : super(key: key);

  final bool isFromDashboard;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    Widget profileSibMenuTitle(String title) => Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Text(
            title,
            style: AppText.text14.copyWith(
              color: AppColors.outerSpace,
              fontWeight: FontWeight.w600,
            ),
          ),
        );

    Widget profileSubMenuContainer(
      IconData icon,
      String title,
    ) =>
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          height: 42.0,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: AppColors.sonicSilver,
                    size: 24.0,
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      title,
                      style: AppText.text12.copyWith(
                        color: AppColors.sonicSilver,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.sonicSilver,
                    size: 24.0,
                  )
                ],
              ),
              const Expanded(child: SizedBox()),
              const Divider(
                color: AppColors.sonicSilver,
                height: 1.0,
              )
            ],
          ),
        );

    return ListView(
      children: [
        ProfileBanner(widget.isFromDashboard),
        const SizedBox(height: 30.0),
        profileSibMenuTitle("Pengaturan"),
        const SizedBox(height: 18.0),
        profileSubMenuContainer(Icons.person, "Data Diri"),
        const SizedBox(height: 30.0),
        profileSibMenuTitle("Lainnya"),
        const SizedBox(height: 18.0),
        profileSubMenuContainer(Icons.help, "Bantuan"),
        const SizedBox(height: 18.0),
        profileSubMenuContainer(Icons.security_outlined, "Tentang"),
        const SizedBox(height: 50.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: DefaultButton(
            text: "Keluar",
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                OnboardPage.route(),
                (route) => false,
              );
            },
          ),
        )
      ],
    );
  }
}
