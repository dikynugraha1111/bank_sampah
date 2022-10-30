import 'package:bank_sampah/feature/dashboard/screen/section/navigation_item.dart';
import 'package:flutter/material.dart';

class DashboardBottomNavigationBar extends StatelessWidget {
  const DashboardBottomNavigationBar(
    this.currentIndex,
    this.onTap, {
    Key? key,
  }) : super(key: key);

  final int currentIndex;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavigationItem(
              () {
                onTap(0);
              },
              currentIndex == 0,
              "assets/icons/home.svg",
              "Home",
            ),
            NavigationItem(
              () {
                onTap(1);
              },
              currentIndex == 1,
              "assets/icons/transaction.svg",
              "Video",
            ),
            NavigationItem(
              () {
                onTap(2);
              },
              currentIndex == 2,
              "assets/icons/transaction.svg",
              "Qur'an",
            ),
            NavigationItem(
              () {
                onTap(3);
              },
              currentIndex == 3,
              "assets/icons/transaction.svg",
              "Profile",
            )
          ],
        ),
      ),
    );
  }
}
