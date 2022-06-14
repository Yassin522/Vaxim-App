import 'package:flutter/material.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/size.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text,
    this.press,
    this.color = kPrimary,
    this.textColor = kDark,
  }) : super(key: key);
  final String? text;
  final VoidCallback? press;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenHeight(45),
      width: getScreeWidth(335),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(0),
      ),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onSurface: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getTextSize(16),
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
