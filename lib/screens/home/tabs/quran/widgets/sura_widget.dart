import 'package:flutter/material.dart';
import 'package:islami/core/models/sura.dart';
import 'package:islami/core/theme/text_styles.dart';
import 'package:islami/screens/home/tabs/quran/quran_tab.dart';

import '../../../../../core/theme/app_colors.dart';

class SuraWidget extends StatelessWidget {
  final Sura sura;
  final SuraWidgetOnClickcallback callback;
  const SuraWidget({super.key, required this.callback, required this.sura});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: .center,
        children: [
          Image.asset('assets/images/Vector.png'),
          Text(
            sura.id.toString(),
            style: titleMedium(color: AppColors.white),
            textAlign: .center,
          ),
        ],
      ),
      title: Text(sura.nameEn, style: titleLarge(color: AppColors.white)),
      subtitle: Text(
        '${sura.versNumber} Verses',
        style: titleSmall(color: AppColors.white),
      ),
      trailing: Text(sura.nameAr, style: titleLarge(color: AppColors.white)),
      onTap: () {
        callback(sura);
      },
    );
  }
}
