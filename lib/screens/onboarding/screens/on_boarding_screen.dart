import 'package:flutter/material.dart';
import 'package:islami/core/models/on_boarding.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/text_styles.dart';
import 'package:islami/screens/home/home_screen.dart';

import '../widgets/action_buttons.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String route = '/onboarding';
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Image.asset('assets/images/logo.png'),

          Expanded(
            child: PageView.builder(
              onPageChanged: (page){
                currentPage = page;
                setState(() {
                  
                });
              },
              controller: controller,
              itemCount: OnBoarding.onBoardingList.length,
              itemBuilder: (context, index) {
                final item = OnBoarding.onBoardingList[index];
                return Column(
                  mainAxisAlignment: .center,
                  children: [
                    Image.asset(item.imgPath, width: 350, height: 350),
                    Text(item.title, style: titleLarge(), textAlign: .center),
                    Text(
                      item.description,
                      style: titleMedium(),
                      textAlign: .center,
                    ),
                  ],
                );
              },
            ),
          ),
          
          ActionButtons(
            controller: controller,
            onBackClicked: () {
              controller.previousPage(
                duration: Duration(microseconds: 200),
                curve: Curves.bounceInOut,
              );
            },
            onNextClicked: () {
              controller.nextPage(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              );
            },
            onFinishClicked: () {
              Navigator.pushReplacementNamed(context, HomeScreen.route);
            },
            isFirst: currentPage == 0,
            isLast: currentPage == OnBoarding.onBoardingList.length - 1,
          ),
        ],
      ),
    );
  }
}

