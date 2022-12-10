import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/constant/helper.dart';
import 'package:bank_sampah/feature/sampah/domain/repository/sampah_repository.dart';
import 'package:bank_sampah/feature/sampah/logic/sampah/sampah_cubit.dart';
import 'package:bank_sampah/feature/sampah/logic/sampah/sampah_state.dart';
import 'package:bank_sampah/feature/sampah/view/section/sampah_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SampahPage extends StatelessWidget {
  const SampahPage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(builder: (_) => const SampahPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampahCubit(SampahRepositoryImpl.create())..onInit(),
      child: BlocConsumer<SampahCubit, SampahState>(
        listener: (context, state) {
          if (state.status.isError) {
            showDefaultSnackbar(
              context,
              state.error?.message ?? "Unknown Error",
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: state.status.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.greenSheen,
                    ),
                  )
                : SampahView(state),
          );
        },
      ),
    );
  }
}
