import 'package:flutter/material.dart';
import 'package:project_card_game/core/common/constants/app_colors.dart';
import 'package:project_card_game/ui/components/shimed_box.dart';

class Panel extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget? child;
  final double? width;
  final double? height;
  final bool withShadow;
  final bool isLoading;
  final Border? border;
  final Color? color;
  final Function()? onTap;
  final Function()? onLongPress;
  final bool? clickable;

  const Panel({
    super.key,
    this.padding = const EdgeInsets.all(20),
    this.child,
    this.withShadow = false,
    this.isLoading = false,
    this.width,
    this.height,
    this.border,
    this.onTap,
    this.onLongPress,
    this.clickable,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return ShimmedBox(
        width: width ?? double.infinity,
        height: height ?? double.infinity,
      );
    }

    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        border: border,
        boxShadow: [
          if (withShadow)
            BoxShadow(
              color: AppColors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3), // changes position of shadow
            ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Material(
        color: color ?? AppColors.white,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          splashColor: AppColors.primaryColor,
          overlayColor: MaterialStateProperty.all<Color>(
            AppColors.primaryColor.withOpacity(0.04),
          ),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
