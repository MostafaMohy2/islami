import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/models/hadeeth.dart';
import 'package:islami/core/theme/text_styles.dart';
import 'package:islami/screens/home/tabs/hadeeth/hadeeth_screen.dart';

import '../../../../core/theme/app_colors.dart';

class HadeethTab extends StatefulWidget {
  const HadeethTab({super.key});

  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  List<Hadeeth> hadeeths = [];

  @override
  void initState() {
    super.initState();
    loadHadeeths();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        hadeeths.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, HadeethScreen.route, arguments: hadeeths[index]);
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.gold,
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  opacity: .25,
                  image: AssetImage('assets/images/cardBg.png'),
                  fit: BoxFit.contain,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/img_corner.png',
                          width: 90,
                          color: AppColors.black,
                        ),
                        Expanded(
                          child: Text(
                            hadeeths[index].title,
                            style: titleLarge(color: AppColors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Transform.flip(
                          flipX: true,
                          child: Image.asset(
                            'assets/images/img_corner.png',
                            width: 90,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        Text(
                          hadeeths[index].content,
                          style: titleMedium(color: AppColors.black),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 1,
                    ),
                    child: Image.asset('assets/images/mosque.png'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      options: CarouselOptions(
        height: double.infinity,
        viewportFraction: 0.82,
        initialPage: 0,
        enlargeCenterPage: true,
        enlargeFactor: 0.12,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Future<void> loadHadeeths() async {
    await loadNextHadeeth(1);
  }

  Future<void> loadNextHadeeth(int index) async {
    if (index > 50) return;

    final hadeeth = await rootBundle.loadString('assets/hadeeth/h$index.txt');
    final lines = hadeeth
        .trim()
        .split('\n')
        .map((line) => line.trim())
        .toList();

    setState(() {
      hadeeths.add(
        Hadeeth(lines.first, lines.sublist(1).join('\n'), index.toString()),
      );
    });

    await loadNextHadeeth(index + 1);
  }
}
