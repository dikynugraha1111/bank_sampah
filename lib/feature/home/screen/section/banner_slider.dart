import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/feature/home/domain/model/carousel_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({Key? key}) : super(key: key);

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  var _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(right: 24.0, left: 24.0),
      width: MediaQuery.of(context).size.width,
      height: 92.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
            items: List.generate(
              listCarouselData.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: CachedNetworkImage(
                    imageUrl: listCarouselData[index].imageUrl,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    progressIndicatorBuilder: (context, url, progress) =>
                        Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                        color: AppColors.greenSheen,
                      ),
                    ),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ),
            options: CarouselOptions(
                autoPlayInterval: const Duration(seconds: 5),
                height: 75.0,
                viewportFraction: 1,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              listCarouselData.length,
              (index) => Container(
                width: _current == index ? 16.0 : 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(
                  horizontal: 2.0,
                  vertical: 1.0,
                ),
                decoration: BoxDecoration(
                  borderRadius:
                      _current == index ? BorderRadius.circular(8.0) : null,
                  shape:
                      _current == index ? BoxShape.rectangle : BoxShape.circle,
                  color: _current == index
                      ? AppColors.greenSheen
                      : AppColors.lightGrey,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
