import 'package:flutter/material.dart';
import 'package:islami/core/models/sura.dart';
import 'package:islami/core/theme/text_styles.dart';

import '../../../../core/theme/app_colors.dart';

class SuraWidget extends StatelessWidget {
  final Sura sura;
  final void Function()? onTap;
  const SuraWidget({super.key, required this.sura,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: .center,
        children: [
          Image.asset('assets/images/Vector.png'),
          Text(sura.id.toString(), style: titleMedium(color: AppColors.white), textAlign: .center,),
        ],
      ),
      title: Text(sura.nameEn,style: titleLarge(color: AppColors.white),),
      subtitle: Text('${sura.versNumber} Verses', style: titleSmall(color: AppColors.white),),
      trailing: Text(sura.nameAr, style: titleLarge(color: AppColors.white),),
      onTap: onTap,
    );
  }
}
