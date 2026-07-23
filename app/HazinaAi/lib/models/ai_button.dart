import 'package:flutter/material.dart';

import '../core/colors.dart';
import '../core/constants.dart';

class AIButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  final IconData? icon;

  final bool isLoading;
  final bool isOutlined;
  final bool enabled;

  final double width;
  final double height;
  final double borderRadius;
  final double elevation;
  final double fontSize;

  final Color? backgroundColor;
  final Color? foregroundColor;

  const AIButton({
    super.key,
    required this.text,
    required this.onPressed,

    this.icon,

    this.isLoading = false,
    this.isOutlined = false,
    this.enabled = true,

    this.width = double.infinity,
    this.height = AppConstants.buttonHeight,

    this.borderRadius = AppConstants.radiusLG,
    this.elevation = 0,

    this.fontSize = 16,

    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? AppColors.primary;
    final fgColor = foregroundColor ?? Colors.white;

    return SizedBox(
      width: width,
      height: height,

      child: isOutlined
          ? OutlinedButton(
              onPressed: enabled && !isLoading ? onPressed : null,

              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: bgColor,
                  width: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(borderRadius),
                ),
              ),

              child: _buildContent(bgColor),
            )
          : ElevatedButton(
              onPressed: enabled && !isLoading ? onPressed : null,

              style: ElevatedButton.styleFrom(
                elevation: elevation,
                backgroundColor: bgColor,
                foregroundColor: fgColor,

                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(borderRadius),
                ),
              ),

              child: _buildContent(fgColor),
            ),
    );
  }

  Widget _buildContent(Color color) {
    if (isLoading) {
      return SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          color: color,
        ),
      );
    }

    if (icon == null) {
      return Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: isOutlined ? AppColors.primary : color,
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 20,
          color: isOutlined ? AppColors.primary : color,
        ),

        const SizedBox(width: 10),

        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: isOutlined ? AppColors.primary : color,
          ),
        ),
      ],
    );
  }
}