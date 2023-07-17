import 'package:flutter/material.dart';

import '../res/my_colors.dart';

class ScoreBtn extends StatelessWidget {
  final String btnName;
  final Color btnColor;
  final VoidCallback onPressed;
  final bool withIcon;

  const ScoreBtn({
    super.key,
    required this.btnName,
    required this.btnColor,
    required this.onPressed,
    required this.withIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width * 0.5,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: btnColor,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.kTransparent),
          shadowColor: MaterialStateProperty.all(AppColors.kTransparent),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              btnName,
              style: const TextStyle(
                fontFamily: "Ubuntu",
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            withIcon ? const Icon(Icons.replay) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
