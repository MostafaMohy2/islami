import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/core/models/sura.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/text_styles.dart';
import 'package:islami/screens/home/tabs/quran/widgets/quran_tab_lay_out.dart';
import 'package:islami/screens/home/tabs/quran/widgets/search_tab_lay_out.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'sura_screen.dart';

typedef SuraWidgetOnClickcallback = Future<void> Function(Sura);

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  final TextEditingController controller = TextEditingController(text: '');
  List<Sura> searchResults = [];
  List<Sura> mostRecent = [];
  Timer? debounceTimer;

  @override
  void initState() {
    super.initState();
    fetchMostRecent();
    controller.addListener(() {
      if (debounceTimer?.isActive ?? false) debounceTimer!.cancel();
      debounceTimer = Timer(Duration(milliseconds: 500), () {
        searchForSurah(controller.text);
      });
    });
  }

  Future<void> fetchMostRecent() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> recentIds = pref.getStringList('mostRecent') ?? [];
    mostRecent = [];
    for (String id in recentIds) {
      mostRecent.add(suraList[int.parse(id) - 1]);
    }
    if (!mounted) return;
    setState(() {});
  }

  Future<void> updateMostRecent(Sura sura) async {
    String id = sura.id.toString();
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> recentIds = pref.getStringList('mostRecent') ?? [];
    if (recentIds.contains(id)) {
      recentIds.remove(id);
    }
    recentIds = [id, ...recentIds];

    await pref.setStringList('mostRecent', recentIds);

    await fetchMostRecent();
    Navigator.pushNamed(context, SuraScreen.route, arguments: sura);
  }

  void searchForSurah(String input) {
    if (input.isEmpty) {
      searchResults = [];
      setState(() {});
      return;
    }

    if (RegExp('^[A-Za-z]+').hasMatch(input)) {
      final query = input.toLowerCase();
      searchResults = suraList
          .where((sura) => sura.nameEn.toLowerCase().contains(query))
          .toList();
    } else {
      searchResults = suraList
          .where((sura) => sura.nameAr.contains(input))
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: .start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: controller,
              style: titleMedium(color: AppColors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.gold, width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                prefixIcon: Image.asset(
                  'assets/images/ic_quran.png',
                  color: AppColors.gold,
                ),
                hintText: 'Sura Name',
                hintStyle: titleMedium(color: AppColors.white),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.gold, width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),

          if (searchResults.isEmpty && controller.text.isEmpty)
            QuranTabLayOut(mostRecent: mostRecent, callback: updateMostRecent)
          else
            SearchTabLayOut(
              surasList: searchResults,
              callback: updateMostRecent,
            ),
        ],
      ),
    );
  }
}
