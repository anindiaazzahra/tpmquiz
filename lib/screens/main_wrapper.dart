import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({
    required this.navigationShell,
    super.key,
  });
  final StatefulNavigationShell navigationShell;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int selectedIndex = 1;

  void _goToBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: widget.navigationShell,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: GNav(
            backgroundColor: Colors.white,
            tabActiveBorder: Border.all(color: Colors.grey, width: 2),
            tabBackgroundColor: Colors.white24,
            gap: 16,
            padding: const EdgeInsets.all(12),
            onTabChange: (index) {
              setState(() {
                selectedIndex = index; // Perbarui nilai indeks yang dipilih
              });
              _goToBranch(selectedIndex);
            },
            tabs: const [
              GButton(
                icon: Icons.calendar_month_outlined,
                text: 'Konversi Hari',
              ),
              GButton(
                icon: Icons.calculate_outlined,
                text: 'Geometri',
              ),
              GButton(
                icon: Icons.person_2_rounded,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}