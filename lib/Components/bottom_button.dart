import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String label;
  final void Function() onTap;

  BottomButton({required this.label , required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 15.0),
      width: double.infinity,
      color: Color(0xFFEB1555),
      height: 70.0,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child : Text(label,
            style: TextStyle(
              fontSize: 25.0,
            ),
            textAlign: TextAlign.center,

          ),
        ),
      ),
    );
  }
}
