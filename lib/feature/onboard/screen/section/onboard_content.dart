import 'package:bank_sampah/constant/app_text.dart';
import 'package:bank_sampah/feature/onboard/domain/onboard_item.dart';
import 'package:flutter/material.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent(
    this.pageController,
    this.onPageChanged,
    this.onboardItem, {
    Key? key,
  }) : super(key: key);

  final PageController pageController;
  final Function(int page) onPageChanged;
  final List<OnboardItem> onboardItem;

  @override
  Widget build(BuildContext context) {
    Column contentText(
      String title,
      String description,
    ) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppText.text20.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: AppText.text16.copyWith(
                color: const Color(0xFF4F4F4F),
              ),
            ),
          ),
        ],
      );
    }

    return PageView.builder(
      controller: pageController,
      onPageChanged: onPageChanged,
      itemCount: onboardItem.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50.0),
              Image.asset(onboardItem[index].image),
              const SizedBox(height: 40),
              Expanded(
                child: contentText(
                  onboardItem[index].title,
                  onboardItem[index].description,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
