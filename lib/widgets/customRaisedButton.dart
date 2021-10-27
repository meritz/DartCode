import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final String buttonText;

  CustomRaisedButton({@required this.buttonText, icon, onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 55, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.cyan.shade900,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
