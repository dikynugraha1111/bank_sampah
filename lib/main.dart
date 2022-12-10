import 'package:bank_sampah/common/injection/injection.dart';
import 'package:bank_sampah/feature/splash_screen/screen/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: Injection.providerList,
      child: const MaterialApp(
        home: SplashScreenPage(),
      ),
    );
  }
}
