import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/constant/app_text.dart';
import 'package:bank_sampah/feature/home/screen/section/banner_slider.dart';
import 'package:bank_sampah/feature/login/logic/cubit/login_cubit.dart';
import 'package:bank_sampah/feature/profile/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerHomeSection extends StatefulWidget {
  const BannerHomeSection({Key? key}) : super(key: key);

  @override
  State<BannerHomeSection> createState() => _BannerHomeSectionState();
}

class _BannerHomeSectionState extends State<BannerHomeSection> {
  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() => Image.asset(
          "assets/images/home_banner.png",
          width: double.infinity,
          height: 154.0,
          fit: BoxFit.cover,
        );

    Widget titleSection() => Text(
          "Bank Sampah",
          textAlign: TextAlign.center,
          style: AppText.text16.copyWith(
            color: AppColors.greenSheen,
            fontWeight: FontWeight.bold,
          ),
        );

    Widget userDataSection(void Function() onTap) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 33.0,
                width: 33.0,
                decoration: const BoxDecoration(
                  color: AppColors.lightGrey,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8.0),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi ...",
                    style: AppText.text10.copyWith(
                      color: AppColors.sonicSilver,
                    ),
                  ),
                  Text(
                    BlocProvider.of<LoginCubit>(context)
                            .state
                            .userProfile
                            ?.user
                            .username ??
                        "Unknown",
                    style: AppText.text12.copyWith(
                      color: AppColors.greenSheen,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const Expanded(child: SizedBox()),
              InkWell(
                onTap: onTap,
                child: Container(
                  height: 24.0,
                  width: 78.0,
                  decoration: BoxDecoration(
                    color: AppColors.greenSheen,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(
                    child: Text(
                      "Lihat Point",
                      style: AppText.text12.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

    Widget bannerContent() => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 25.0),
            titleSection(),
            const SizedBox(height: 26.0),
            userDataSection(() {
              Navigator.of(context)
                  .push(ProfilePage.route(isFromDashboard: false));
            }),
            const Expanded(child: SizedBox()),
            const BannerSlider(),
          ],
        );

    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Stack(
        children: [
          backgroundImage(),
          bannerContent(),
        ],
      ),
    );
  }
}
