import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:project_card_game/core/common/constants/app_colors.dart';

class Loader extends StatelessWidget {
  const Loader({super.key, this.size, this.inverted = false});

  final double? size;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 30,
      child: LoadingAnimationWidget.fourRotatingDots(
        color: inverted ? AppColors.backgroundColor : AppColors.primaryColor,
        size: size ?? 30,
      ),
    );
  }
}
