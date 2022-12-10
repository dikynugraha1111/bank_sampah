import 'package:bank_sampah/feature/help/view/section/help_view.dart';
import 'package:flutter/material.dart';

class HelpPages extends StatelessWidget {
  const HelpPages({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(builder: (_) => const HelpPages());

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: HelpView(),
      ),
    );
  }
}
