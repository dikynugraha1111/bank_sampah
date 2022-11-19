import 'package:bank_sampah/feature/profile/view/section/profile_view.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({this.isFromDashboard = true, Key? key}) : super(key: key);

  final bool isFromDashboard;

  static Route route({bool? isFromDashboard}) => MaterialPageRoute(
      builder: (_) => ProfilePage(
            isFromDashboard: isFromDashboard ?? true,
          ));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProfileView(isFromDashboard),
      ),
    );
  }
}
