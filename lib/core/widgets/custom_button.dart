import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.textColor,
    required this.backgroundColor,
    this.borderRadius,
    this.fontSize,
  });
  final String child;
  final VoidCallback onPressed;
  final Color textColor;
  final Color backgroundColor;
  final BorderRadius? borderRadius;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ??
                const BorderRadius.all(
                  Radius.circular(16),
                ),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            child,
            style: AppStyles.styleSemiBold18.copyWith(
              color: textColor,
              fontWeight: FontWeight.w900,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
