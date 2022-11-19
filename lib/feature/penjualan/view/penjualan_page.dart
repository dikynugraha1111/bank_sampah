import 'package:bank_sampah/feature/penjualan/view/section/penjualan_view.dart';
import 'package:flutter/material.dart';

class PenjualanPage extends StatelessWidget {
  const PenjualanPage({this.isFromDashboard = true, Key? key})
      : super(key: key);

  final bool isFromDashboard;

  static Route route({
    bool? isFromDashboard,
  }) =>
      MaterialPageRoute(
        builder: (_) => PenjualanPage(
          isFromDashboard: isFromDashboard ?? true,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PenjualanView(isFromDashboard),
    );
  }
}
