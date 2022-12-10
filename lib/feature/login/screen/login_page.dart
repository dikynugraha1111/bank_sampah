import 'package:bank_sampah/constant/helper.dart';
import 'package:bank_sampah/feature/dashboard/screen/dashboard_page.dart';
import 'package:bank_sampah/feature/login/logic/cubit/login_cubit.dart';
import 'package:bank_sampah/feature/login/screen/login_view.dart';
import 'package:bank_sampah/widget/field/loading_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_exception/exception.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(builder: (_) => const LoginPage());

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pushReplacement(DashboardPage.route());
        }
        if (state.status.isFailure) {
          showDefaultSnackbar(
            context,
            (state.exception?.errorMessage(context) ?? "Unknown Error") ==
                    "Unauthorized"
                ? "Username atau Password salah"
                : (state.exception?.errorMessage(context) ?? "Unknown Error"),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: OverflowLoadingPage(
            visibility: state.status.isLoading,
            body: const LoginView(),
          ),
        );
      },
    );
  }
}
