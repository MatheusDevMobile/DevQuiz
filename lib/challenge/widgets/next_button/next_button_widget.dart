import 'package:dquiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backGroundColor;
  final Color fontColor;
  final Color borderColor;
  final Color overlayColor;
  final VoidCallback onTap;

  NextButtonWidget(
      {required this.label,
      required this.backGroundColor,
      required this.fontColor,
      required this.borderColor,
      required this.overlayColor,
      required this.onTap});

  NextButtonWidget.green({required String label, required VoidCallback onTap})
      : this.backGroundColor = AppColors.darkGreen,
        this.overlayColor = AppColors.darkDarkGreen,
        this.borderColor = AppColors.green,
        this.fontColor = AppColors.white,
        this.onTap = onTap,
        this.label = label;

  NextButtonWidget.purple({required String label, required VoidCallback onTap})
      : this.backGroundColor = AppColors.purple,
        this.overlayColor = AppColors.darkDarkGreen,
        this.borderColor = AppColors.green,
        this.fontColor = AppColors.white,
        this.onTap = onTap,
        this.label = label;

  NextButtonWidget.white({required String label, required VoidCallback onTap})
      : this.backGroundColor = AppColors.white,
        this.overlayColor = AppColors.lightLightGrey,
        this.borderColor = AppColors.border,
        this.fontColor = AppColors.grey,
        this.onTap = onTap,
        this.label = label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(overlayColor),
            backgroundColor: MaterialStateProperty.all(backGroundColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            side: MaterialStateProperty.all(BorderSide(color: borderColor))),
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600, fontSize: 15, color: fontColor),
        ),
      ),
    );
  }
}
