import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/constant/app_text.dart';
import 'package:bank_sampah/feature/mitra/view/section/mitra_banner.dart';
import 'package:flutter/material.dart';

class MitraView extends StatefulWidget {
  const MitraView({Key? key}) : super(key: key);

  @override
  State<MitraView> createState() => _MitraViewState();
}

class _MitraViewState extends State<MitraView> {
  @override
  Widget build(BuildContext context) {
    Widget sampahItemContainer(
      String title,
      String description,
    ) =>
        Container(
          height: 114,
          margin: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            bottom: 18.0,
          ),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.08),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                height: 90.0,
                width: 75.0,
                decoration: BoxDecoration(
                  color: AppColors.greenSheen,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppText.text12.copyWith(
                        color: AppColors.outerSpace,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        description,
                        softWrap: true,
                        style: AppText.text10.copyWith(
                          color: AppColors.outerSpace,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Minggu",
                          style: AppText.text10.copyWith(
                            color: AppColors.outerSpace,
                            fontSize: 8,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "09.00 - 11.00 WIB",
                            textAlign: TextAlign.end,
                            style: AppText.text12.copyWith(
                              color: AppColors.greenSheen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );

    List<Widget> generateSampahContainer() => List.generate(
          1,
          (index) => sampahItemContainer(
            "Mitra 1",
            "Mitra bank sampah terletak di pos ronda RT 20 dan setoran setiap hari minggu ke 3",
          ),
        );

    return ListView(
      children: [
        const MitraBanner(),
        const SizedBox(height: 30.0),
        ...generateSampahContainer(),
      ],
    );
  }
}
