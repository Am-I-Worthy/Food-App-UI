import 'package:flutter/material.dart';

import 'Colors.dart';

class CustomFlatButton extends StatelessWidget {
  const CustomFlatButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      color: mainColor,
      child: Text(
        'Buy',
        style: TextStyle(
          fontFamily: 'Gotham',
          decoration: TextDecoration.none,
          fontSize: 20.0,
          color: Colors.black
          ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)),
    );
  }
}