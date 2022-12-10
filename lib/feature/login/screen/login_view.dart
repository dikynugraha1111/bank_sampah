import 'package:bank_sampah/feature/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/constant/app_text.dart';
import 'package:bank_sampah/widget/button/default_button.dart';
import 'package:bank_sampah/widget/field/default_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    Widget headerSection() => Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Bank",
                    style: AppText.secondaryText16.copyWith(
                      color: AppColors.salmon,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "Sampah",
                    style: AppText.secondaryText16.copyWith(
                      color: AppColors.greenSheen,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              "RW 06 Umbulharjo",
              textAlign: TextAlign.center,
              style: AppText.secondaryText12,
            ),
            const SizedBox(height: 50.0),
          ],
        );

    Widget titleTextField(String text) => Text(
          text,
          style: AppText.text12.copyWith(fontWeight: FontWeight.bold),
        );

    Widget forgotPasswordSection(
      void Function() onTap,
    ) =>
        Center(
          child: Column(
            children: [
              Text(
                "Lupa Password / Belum Punya Akun ?",
                style: AppText.text12.copyWith(
                  color: AppColors.sonicSilver,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: onTap,
                child: Text(
                  "Hubungi Admin",
                  style: AppText.text12.copyWith(
                    color: AppColors.greenSheen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );

    Widget fieldLoginSection() => Container(
          margin: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Selamat Datang",
                style: AppText.text20.copyWith(
                  color: AppColors.greenSheen,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                "Silahkan masuk untuk melanjutkan",
                style: AppText.secondaryText12.copyWith(
                  color: AppColors.sonicSilver,
                ),
              ),
              const SizedBox(height: 24.0),
              titleTextField("Nama Pengguna"),
              const SizedBox(height: 8.0),
              DefaultTextField(
                hintText: "Nama / Username",
                controller: usernameController,
                labelText: "Nama / Username",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Nama / Username tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              titleTextField("Password"),
              const SizedBox(height: 8.0),
              DefaultTextField(
                hintText: "Password",
                controller: passwordController,
                labelText: "Password",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password tidak boleh kosong";
                  }
                  return null;
                },
                isObscure: isObscure,
                suffixWidget: IconButton(
                  color: AppColors.sonicSilver,
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: isObscure
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.remove_red_eye_outlined),
                ),
              ),
              const SizedBox(height: 24.0),
              DefaultButton(
                text: "Masuk",
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  context.read<LoginCubit>().login(
                        usernameController.text,
                        passwordController.text,
                      );
                },
              ),
              const SizedBox(height: 16.0),
              forgotPasswordSection(() {}),
              const SizedBox(height: 16.0),
              const Divider(color: AppColors.lightGrey),
            ],
          ),
        );
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: headerSection(),
            ),
            fieldLoginSection(),
          ],
        ),
      ),
    );
  }
}
