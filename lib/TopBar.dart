import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String titleText;
  final Widget leading;
  final Widget trailing;

  TopBar({
    this.leading,
    this.titleText,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Hero(
          tag: 'icon',
          child: Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: leading,
          ),
        ),
        Hero(
          tag: 'Title',
          child: Container(
            child: Text(
              titleText,
              style: TextStyle(
                fontFamily: 'Gotham',
                decoration: TextDecoration.none,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Hero(
          tag: 'ProPic',
          child: trailing,
        ),
      ],
    );
  }
}
