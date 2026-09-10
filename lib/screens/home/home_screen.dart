import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/screens/home/tabs/hadeeth/hadeeth_tab.dart';
import 'package:islami/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami/screens/home/widgets/base_tab.dart';

import 'tabs/sebha/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    BaseTab(
      imgPath: 'assets/images/quran_bg.png',
      child: QuranTab(),
    ),
    BaseTab(
      imgPath: 'assets/images/hadith_bg.png',
      child: HadeethTab(),
    ),
    BaseTab(
      imgPath: 'assets/images/sebha_bg.png',
      child: SebhaTab(),
    ),
    BaseTab(
      imgPath: 'assets/images/radio_bg.png',
      child: Container(color: Colors.deepPurple),
    ),
    BaseTab(
      imgPath: 'assets/images/more_bg.png',
      child: Container(color: Colors.orange),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],

      backgroundColor: AppColors.black,
      bottomNavigationBar: BottomNavigationBar(
        type: .fixed,
        currentIndex: selectedIndex,
        backgroundColor: AppColors.gold,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.black,
        showUnselectedLabels: false,
        onTap: (newIndex) {
          if (newIndex != selectedIndex) {
            setState(() {
              selectedIndex = newIndex;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: buildIcon(selectedIndex == 0, 'assets/images/ic_quran.png'),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: buildIcon(selectedIndex == 1, 'assets/images/ic_hadeth.png'),
            label: 'Hadeth',
          ),
          BottomNavigationBarItem(
            icon: buildIcon(selectedIndex == 2, 'assets/images/ic_sebha.png'),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: buildIcon(selectedIndex == 3, 'assets/images/ic_radio.png'),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: buildIcon(selectedIndex == 4, 'assets/images/ic_time.png'),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}

Widget buildIcon(bool isSelectd, String imgPath) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: isSelectd ? AppColors.black.withAlpha(90) : Colors.transparent,
      borderRadius: BorderRadius.circular(100),
    ),
    child: ImageIcon(AssetImage(imgPath)),
  );
}
