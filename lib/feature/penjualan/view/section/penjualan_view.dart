import 'package:bank_sampah/feature/penjualan/domain/model/penjualan_sampah_response.dart';
import 'package:bank_sampah/feature/penjualan/logic/cubit/penjualan_cubit.dart';
import 'package:bank_sampah/feature/penjualan/view/section/penjualan_banner.dart';
import 'package:bank_sampah/feature/penjualan/view/section/penjualan_item_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PenjualanView extends StatefulWidget {
  const PenjualanView(this.isFromDashboard, {Key? key}) : super(key: key);

  final bool isFromDashboard;

  @override
  State<PenjualanView> createState() => _PenjualanViewState();
}

class _PenjualanViewState extends State<PenjualanView> {
  @override
  Widget build(BuildContext context) {
    final List<BankIncome>? item =
        context.read<PenjualanCubit>().state.bankSampahResponse?.bankIncome;

    List<Widget> generatedListHistoryTransaction() {
      return List.generate(
        item?.length ?? 0,
        (index) => PenjualanItemContainer(
          (item?[index].pendapatan.contains("-") ?? false) ? false : true,
          int.parse(item![index].pendapatan),
          item[index].createdAt,
        ),
      );
    }

    Widget listItemTransaction() => ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: generatedListHistoryTransaction(),
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
