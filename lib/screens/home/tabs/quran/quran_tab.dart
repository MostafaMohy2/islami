import 'package:flutter/material.dart';
import 'package:islami/core/models/sura.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/text_styles.dart';
import 'package:islami/screens/home/tabs/quran/sura_screen.dart';
import 'package:islami/screens/home/tabs/quran/sura_widget.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

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
                focusedBorder:OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.gold, width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: .centerLeft,
              child: Text(
                'Suras List',
                style: titleMedium(fontWeight: .w700, color: AppColors.white),
              ),
            ),
          ),

          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(16),
              separatorBuilder: (_, _) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(color: AppColors.white, indent: 40, endIndent: 40,),
              ),
              itemCount: suraList.length,
              itemBuilder: (_, index) {
                return SuraWidget(sura: suraList[index], onTap: () {
                  Navigator.pushNamed(context, SuraScreen.route, arguments: suraList[index]);
                },);
              },
            ),
          ),
        ],
      ),
    );
  }
}
