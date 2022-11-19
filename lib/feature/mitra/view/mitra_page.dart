import 'package:bank_sampah/feature/mitra/view/section/mitra_view.dart';
import 'package:flutter/material.dart';

class MitraPage extends StatelessWidget {
  const MitraPage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(builder: (_) => const MitraPage());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MitraView(),
    );
  }
}
