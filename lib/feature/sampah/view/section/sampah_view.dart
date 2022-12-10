import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/constant/app_text.dart';
import 'package:bank_sampah/feature/sampah/logic/sampah/sampah_state.dart';
import 'package:bank_sampah/feature/sampah/view/section/sampah_banner.dart';
import 'package:flutter/material.dart';

class SampahView extends StatefulWidget {
  const SampahView(this.state, {Key? key}) : super(key: key);

  final SampahState state;

  @override
  State<SampahView> createState() => _SampahViewState();
}

class _SampahViewState extends State<SampahView> {
  @override
  Widget build(BuildContext context) {
    final item = widget.state.bankSampahResponse?.showBankItem;
    Widget sampahItemContainer(
      String title,
      String description,
      int price,
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
                          "Harga / Kg",
                          style: AppText.text10.copyWith(
                            color: AppColors.outerSpace,
                            fontSize: 8,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "$price / Kg",
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
          item?.length ?? 0,
          (index) => sampahItemContainer(
            item?[index].nama ?? "Unknown Name",
            item?[index].deskripsi ?? "Unknown Description",
            int.parse(item?[index].hargaKg ?? "0"),
          ),
        );

    return ListView(
      children: [
        const SampahBanner(),
        const SizedBox(height: 30.0),
        ...generateSampahContainer(),
      ],
    );
  }
}
