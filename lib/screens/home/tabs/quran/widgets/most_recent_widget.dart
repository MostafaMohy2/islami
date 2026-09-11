import 'package:flutter/material.dart';
import 'package:islami/core/models/sura.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/text_styles.dart';

import '../quran_tab.dart';

class MostRecentWidget extends StatelessWidget {
  final Sura sura;
  final SuraWidgetOnClickcallback callback;

  const MostRecentWidget({
    required this.sura,
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(sura),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: .spaceEvenly,
              children: [
                Text(
                  sura.nameEn,
                  style: titleLarge(fontSize: 24, color: AppColors.black),
                ),
                Text(
                  sura.nameAr,
                  style: titleLarge(fontSize: 24, color: AppColors.black),
                ),
                Text('${sura.versNumber} Verses', style: titleSmall(color: AppColors.black)),
              ],
            ),
            Image.asset('assets/images/mostRecent.png')
          ],
        ),
      ),
    );
  }
}
