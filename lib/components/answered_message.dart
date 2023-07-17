import 'package:flutter/material.dart';

import '../res/my_images.dart';

class AnsweredMessage extends StatelessWidget {
  const AnsweredMessage({
    super.key,
    required this.contentText,
    required this.color,
    required this.withImage,
  });
  final String contentText;
  final Color color;
  final bool withImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          withImage
              ? Image.asset(
                  AppImages.kCongratulation,
                  width: 30,
                  height: 30,
                )
              : const SizedBox(),
          Text(
            contentText,
          ),
        ],
      ),
    );
  }
}
