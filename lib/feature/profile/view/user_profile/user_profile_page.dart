import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/constant/app_text.dart';
import 'package:bank_sampah/feature/login/domain/model/user_profile.dart';
import 'package:bank_sampah/feature/login/logic/cubit/login_cubit.dart';
import 'package:bank_sampah/feature/profile/view/user_profile/section/profile_user_item_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute(builder: (_) => const UserProfilePage());

  @override
  Widget build(BuildContext context) {
    final User userProfileData =
        BlocProvider.of<LoginCubit>(context).state.userProfile!.user;
    Widget _separator() {
      return Divider(
        color: AppColors.lightGrey.withOpacity(0.12),
        thickness: 6.0,
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.greenSheen,
        title: Text(
          "Profil Pengguna",
          style: AppText.text14.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        children: [
          ProfileUserItemSection(
            title: "Username",
            value: userProfileData.username,
          ),
          _separator(),
          ProfileUserItemSection(
            title: "RT",
            value: userProfileData.rt,
          ),
          _separator(),
          ProfileUserItemSection(
            title: "Dibuat",
            value: userProfileData.createdAt.toIso8601String(),
          ),
          _separator(),
          ProfileUserItemSection(
            title: "Terakhir diubah",
            value: userProfileData.updatedAt.toIso8601String(),
          ),
          _separator(),
          ProfileUserItemSection(
            title: "Dihapus pada",
            value: userProfileData.deletedAt.toString(),
          ),
        ],
      ),
    );
  }
}
