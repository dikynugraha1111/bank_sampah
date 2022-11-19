import 'package:bank_sampah/feature/dashboard/screen/section/navigation_item.dart';
import 'package:flutter/material.dart';

class DashboardBottomNavigationBar extends StatefulWidget {
  const DashboardBottomNavigationBar(
    this.currentIndex,
    this.onTap, {
    Key? key,
  }) : super(key: key);

  final int currentIndex;
  final void Function(int index) onTap;

  @override
  State<DashboardBottomNavigationBar> createState() =>
      _DashboardBottomNavigationBarState();
}

class _DashboardBottomNavigationBarState
    extends State<DashboardBottomNavigationBar> {
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
                widget.onTap(0);
              },
              widget.currentIndex == 0,
              "assets/icons/home.svg",
              "Home",
            ),
            NavigationItem(
              () {
                widget.onTap(1);
              },
              widget.currentIndex == 1,
              "assets/icons/record.svg",
              "Penjualan",
            ),
            NavigationItem(
              () {
                widget.onTap(2);
              },
              widget.currentIndex == 2,
              "assets/icons/profile.svg",
              "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
