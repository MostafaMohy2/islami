import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/text_styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double turns = 0;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: .start,
        children: [
          Center(
            child: Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
              style: titleLarge(fontSize: 36, color: AppColors.white),
            ),
          ),
          SizedBox(
            height: 460,
            child: Stack(
              children: [
                Positioned(
                  top: -5,
                  left: MediaQuery.of(context).size.width * 0.17,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      'assets/images/sebhaHead.png',
                      width: 73,
                      height: 86,
                    ),
                  ),
                ),
                Positioned(
                  top: 75,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        turns += 1 / 30;
                        counter += 1;
                        if (counter > 30) counter = 0;
                      });
                    },
                    child: AnimatedRotation(
                      turns: turns,
                      duration: Duration(milliseconds: 400),
                      child: Stack(
                        alignment: .center,
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/sebhaBody.png',
                              width: 378,
                              height: 380,
                            ),
                          ),
                          AnimatedRotation(
                            turns: -turns,
                            duration: Duration(milliseconds: 400),
                            child: Column(
                              children: [
                                Text(
                                  'سبحان الله',
                                  style: titleLarge(
                                    color: AppColors.white,
                                    fontSize: 36,
                                  ),
                                ),
                                Text(
                                  counter <= 30 && counter >= 0
                                      ? '$counter'
                                      : '$counter',
                                  style: titleLarge(
                                    color: AppColors.white,
                                    fontSize: 36,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
