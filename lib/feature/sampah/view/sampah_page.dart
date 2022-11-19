import 'package:bank_sampah/feature/sampah/view/section/sampah_view.dart';
import 'package:flutter/material.dart';

class SampahPage extends StatelessWidget {
  const SampahPage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(builder: (_) => const SampahPage());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SampahView(),
    );
  }
}
