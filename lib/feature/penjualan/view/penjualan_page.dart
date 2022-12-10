import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/constant/helper.dart';
import 'package:bank_sampah/feature/login/logic/cubit/login_cubit.dart';
import 'package:bank_sampah/feature/penjualan/domain/repository/penjualan_repository.dart';
import 'package:bank_sampah/feature/penjualan/logic/cubit/penjualan_cubit.dart';
import 'package:bank_sampah/feature/penjualan/view/section/penjualan_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocProvider(
      create: (context) => PenjualanCubit(PenjualanRepository.create())
        ..onGetAllPenjualanData(BlocProvider.of<LoginCubit>(context)
                .state
                .userProfile
                ?.user
                .id
                .toString() ??
            "1"),
      child: BlocConsumer<PenjualanCubit, PenjualanState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            showDefaultSnackbar(
              context,
              state.exception?.message ?? "Unknown Error",
            );
          }
        },
        builder: (context, state) {
          return state.status.isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: AppColors.greenSheen),
                )
              : Scaffold(body: PenjualanView(isFromDashboard));
        },
      ),
    );
  }
}
