import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/constant/helper.dart';
import 'package:bank_sampah/feature/login/logic/cubit/login_cubit.dart';
import 'package:bank_sampah/feature/profile/domain/repository/profile_repository.dart';
import 'package:bank_sampah/feature/profile/logic/cubit/profile_cubit.dart';
import 'package:bank_sampah/feature/profile/view/section/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({this.isFromDashboard = true, Key? key}) : super(key: key);

  final bool isFromDashboard;

  static Route route({bool? isFromDashboard}) => MaterialPageRoute(
      builder: (_) => ProfilePage(
            isFromDashboard: isFromDashboard ?? true,
          ));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(ProfileRepository.create())
        ..onInitProfile(BlocProvider.of<LoginCubit>(context)
                .state
                .userProfile
                ?.user
                .id
                .toString() ??
            "1"),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            showDefaultSnackbar(
              context,
              state.exception?.message ?? "Unknown Error",
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: state.status.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.greenSheen,
                      ),
                    )
                  : ProfileView(isFromDashboard),
            ),
          );
        },
      ),
    );
  }
}
