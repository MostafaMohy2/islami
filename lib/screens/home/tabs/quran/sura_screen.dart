import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/models/sura.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/text_styles.dart';

class SuraScreen extends StatefulWidget {
  static const String route = '/sura-screen';
  final Sura sura;

  const SuraScreen({super.key, required this.sura});

  @override
  State<SuraScreen> createState() => _SuraScreenState();
}

class _SuraScreenState extends State<SuraScreen> {
  @override
  void initState() {
    super.initState();
    loadSura(widget.sura.id.toString());
  }

  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.gold),
        backgroundColor: AppColors.black,
        centerTitle: true,
        title: Text(widget.sura.nameEn, style: titleLarge()),
        scrolledUnderElevation: 0,
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
                    widget.sura.nameAr,
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
                RichText(
                  text: TextSpan(
                    children: List.generate(ayat.length, (index) {
                      return TextSpan(text: '${ayat[index]} [${index + 1}]');
                    }),
                    style: titleLarge(),
                  ),
                  textDirection: .rtl,
                  textAlign: .center,
                ),
              ],
            ),
          ),
          Image.asset('assets/images/mosque.png', height: 100)
        ],
      ),
    );
  }

  Future<void> loadSura(String id) async {
    var response = await rootBundle.loadString('assets/suras/$id.txt');
    var ayatContent = response
        .trim()
        .split('\n').map((aya)=>aya.trim()).toList();
    setState(() {
      ayat = ayatContent;
    });
  }
}
