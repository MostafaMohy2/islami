import 'package:flutter/material.dart';
import 'package:islami/core/theme/text_styles.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/models/sura.dart';
import '../../../../../core/theme/app_colors.dart';
import '../quran_tab.dart';
import 'sura_widget.dart';

class SearchTabLayOut extends StatelessWidget {
  const SearchTabLayOut({required this.surasList,required this.callback, super.key});
  final SuraWidgetOnClickcallback callback;

  final List<Sura> surasList;
  @override
  Widget build(BuildContext context) {
    if (surasList.isEmpty) {
      return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Lottie.asset(
                'assets/animations/quran.json',
                height: MediaQuery.of(context).size.height * .4,
              ),
              Text('No Results Found', style: titleMedium()),
            ],
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, _) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(color: AppColors.white, indent: 40, endIndent: 40),
        ),
        itemCount: surasList.length,
        itemBuilder: (_, index) {
          return SuraWidget(
            sura: surasList[index],
            callback: callback
          );
        },
      ),
    );
  }
}
