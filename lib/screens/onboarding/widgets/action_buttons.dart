import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/models/on_boarding.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/text_styles.dart';

class ActionButtons extends StatefulWidget {
  const ActionButtons({
    super.key,
    required this.controller,
    required this.onBackClicked,
    required this.onNextClicked,
    required this.onFinishClicked,
    required this.isLast,
  });

  final PageController controller;
  final void Function()? onNextClicked;
  final void Function()? onBackClicked;
  final void Function()? onFinishClicked;
  final bool isLast;

  @override
  State<ActionButtons> createState() => _ActionButtonsState();
}

class _ActionButtonsState extends State<ActionButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: widget.onBackClicked,
          child: Text('Back', style: titleMedium()),
        ),
        Expanded(
          child: Center(
            child: SmoothPageIndicator(
              controller: widget.controller,
              count: OnBoarding.onBoardingList.length,
              effect: ExpandingDotsEffect(
                dotWidth: 7,
                dotHeight: 7,
                activeDotColor: AppColors.gold,
                dotColor: AppColors.grey,
              ),
            ),
          ),
        ),
        widget.isLast
            ? TextButton(
                onPressed: widget.onFinishClicked,
                child: Text('Finished', style: titleMedium()),
              )
            : TextButton(
                onPressed: widget.onNextClicked,
                child: Text('Next', style: titleMedium()),
              ),
      ],
    );
  }
}
