import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;

  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        child: TextButton(
            style: ButtonStyle(
                side: MaterialStateProperty.all(BorderSide(color: borderColor)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                backgroundColor: MaterialStateProperty.all(backgroundColor)),
            onPressed: onTap,
            child: Text(label,
                style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: fontColor,
                ))));
  }
}
