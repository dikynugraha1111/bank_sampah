import 'package:bank_sampah/feature/penjualan/view/section/penjualan_banner.dart';
import 'package:bank_sampah/feature/penjualan/view/section/penjualan_item_container.dart';
import 'package:flutter/material.dart';

class PenjualanView extends StatefulWidget {
  const PenjualanView(this.isFromDashboard, {Key? key}) : super(key: key);

  final bool isFromDashboard;

  @override
  State<PenjualanView> createState() => _PenjualanViewState();
}

class _PenjualanViewState extends State<PenjualanView> {
  @override
  Widget build(BuildContext context) {
    Widget listItemTransaction() => ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            PenjualanItemContainer(true, 10000, DateTime.now()),
            PenjualanItemContainer(false, 3000, DateTime.now()),
            PenjualanItemContainer(false, 10000, DateTime.now()),
            PenjualanItemContainer(true, 200000, DateTime.now()),
            PenjualanItemContainer(false, 5000, DateTime.now()),
          ],
        );

    return ListView(
      children: [
        PenjualanBanner(widget.isFromDashboard),
        const SizedBox(height: 30),
        listItemTransaction(),
      ],
    );
  }
}
