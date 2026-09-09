import 'package:flutter/material.dart';
import 'package:islami/core/models/hadeeth.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/text_styles.dart';

class HadeethScreen extends StatefulWidget {
  static const String route ='/hadeeth-screen';
  const HadeethScreen({super.key, required this.hadeeth});
  final Hadeeth hadeeth;

  @override
  State<HadeethScreen> createState() => _HadeethScreenState();
}

class _HadeethScreenState extends State<HadeethScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: AppColors.gold),
        backgroundColor: AppColors.black,
        title: Text(widget.hadeeth.title, style: titleLarge(),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                ImageIcon(
                  AssetImage('assets/images/img_corner.png'),
                  size: 120,
                  color: AppColors.gold,
                ),
                Expanded(
                  child: Text(
                    widget.hadeeth.title,
                    style: titleLarge(),
                    textAlign: .center,
                  ),
                ),
                Transform.flip(
                  flipX: true,
                  child: ImageIcon(
                    AssetImage('assets/images/img_corner.png'),
                    size: 120,
                    color: AppColors.gold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 4,
              ),
              children: [
                Text(widget.hadeeth.content, style: titleMedium(),)
              ],
            ),
          ),
          Image.asset('assets/images/mosque.png', height: 100)
        ],
      ),
    );
  }
}