import 'package:bank_sampah/constant/url_asset.dart';

class OnboardItem {
  String image;
  String title;
  String description;

  OnboardItem(
    this.image,
    this.title,
    this.description,
  );
}

final List<OnboardItem> dummyOnboard = [
  OnboardItem(
    UrlAsset.onboard1,
    'Mulai Tabung Sampah',
    'Mulai tabung sampah anda dari sekarang juga. Menabung dengan profit lebih baik dari pada tidak sama sekali.',
  ),
  OnboardItem(
    UrlAsset.onboard2,
    'Dapatkan Reward',
    'Dapatkan reward berupa merchandise unik setiap tahun dengan point tertentu..',
  ),
  OnboardItem(
    UrlAsset.onboard3,
    'Go Green',
    'Jadikan Bank Sampah sebagai dukungan gerakan Go Green. Kalau bukan dimulai dari kita siapa lagi ?.',
  ),
];
