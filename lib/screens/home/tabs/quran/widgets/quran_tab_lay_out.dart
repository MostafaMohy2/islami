import 'package:flutter/material.dart';

import '../../../../../core/models/sura.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/text_styles.dart';
import '../quran_tab.dart';
import 'most_recent_widget.dart';
import 'sura_widget.dart';

class QuranTabLayOut extends StatelessWidget {
  final List<Sura> mostRecent;
  final SuraWidgetOnClickcallback callback;

  const QuranTabLayOut({required this.mostRecent,required this.callback, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          if (mostRecent.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: .centerLeft,
                  child: Text(
                    'Most Recent',
                    style: titleMedium(
                      fontWeight: .w700,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 8)),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 160,
                child: ListView.separated(
                  scrollDirection: .horizontal,
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: mostRecent.length,
                  itemBuilder: (context, index) {
                    return MostRecentWidget(sura: mostRecent[index], callback: callback,);
                  },
                ),
              ),
            ),
          ],

          SliverToBoxAdapter(child: SizedBox(height: 16)),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: .centerLeft,
                child: Text(
                  'Suras List',
                  style: titleMedium(fontWeight: .w700, color: AppColors.white),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 8)),

          SliverList.separated(
            separatorBuilder: (_, _) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(color: AppColors.white, indent: 40, endIndent: 40),
            ),
            itemCount: suraList.length,
            itemBuilder: (_, index) {
              return SuraWidget(
                sura: suraList[index],
                callback: callback,
              );
            },
          ),
        ],
      ),
    );
  }
}
