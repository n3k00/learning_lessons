import 'package:flutter/material.dart';

class SeeMoreText extends StatelessWidget {
  final String text;
  final Color textColor;
  final bool seeMoreTextVisibility;

  SeeMoreText(this.text, {this.textColor = Colors.white,this.seeMoreTextVisibility = true});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: seeMoreTextVisibility,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: textColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
