import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import '../res/my_colors.dart';

class CustomProgressBar extends StatefulWidget {
  const CustomProgressBar({super.key,});
 

  @override
  State<CustomProgressBar> createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  @override
  Widget build(BuildContext context) {
    return FAProgressBar(
      currentValue: 5,
      size: 25,
      maxValue: 5,
      changeColorValue: 100,
      backgroundColor: Colors.transparent,
      progressGradient: AppColors.kPrimaryGradient,
      animatedDuration: const Duration(minutes: 5),
      direction: Axis.horizontal,
      displayText: ' min',
      border: Border.all(
        color: const Color(0xFF3F4768),
        width: 1,
      ),
      borderRadius: BorderRadius.circular(50),
    );
  }
}
