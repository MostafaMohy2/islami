import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';

class BaseTab extends StatelessWidget {
  const BaseTab({super.key, required this.imgPath, required this.child});

  final String imgPath;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imgPath), fit: .cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.black.withAlpha(100),
              AppColors.black.withAlpha(90),
              AppColors.black,
            ],
            begin: .topCenter,
            end: .bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SafeArea(
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
