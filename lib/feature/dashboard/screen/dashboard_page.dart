import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/constant/app_text.dart';
import 'package:bank_sampah/feature/dashboard/screen/section/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    DateTime preBackpress = DateTime.now();
    final PageStorageBucket bucket = PageStorageBucket();
    int currentIndex = 0;

    final List<Widget> currentScrenList = [
      //Note List of thw widget
    ];

    return WillPopScope(
      onWillPop: () async {
        if (DateTime.now().difference(preBackpress) >=
            const Duration(seconds: 2)) {
          preBackpress = DateTime.now();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar
            ..showSnackBar(
              SnackBar(
                content: Text(
                  'Tekan lagi untuk keluar',
                  style: AppText.text14.copyWith(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: AppColors.salmon,
              ),
            );
          return false;
        } else {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageStorage(
          bucket: bucket,
          child: currentScrenList[currentIndex],
        ),
        bottomNavigationBar: DashboardBottomNavigationBar(
          currentIndex,
          (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
