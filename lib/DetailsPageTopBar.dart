import 'package:flutter/material.dart';

class DetailsPageTopBar extends StatefulWidget {
  const DetailsPageTopBar({
    Key key,
    @required Animation animation,
  }) : _animation = animation, super(key: key);

  final Animation _animation;

  @override
  _DetailsPageTopBarState createState() => _DetailsPageTopBarState();
}

class _DetailsPageTopBarState extends State<DetailsPageTopBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Hero(
          tag: 'icon',
          child: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              child: FadeTransition(
                opacity: widget._animation,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 23.0,
                ),
              ),
            ),
          ),
        ),
        Hero(
          tag: 'Title',
          child: FadeTransition(
            opacity: widget._animation,
            child: Container(
              child: Text(
                'Details',
                style: TextStyle(
                    fontFamily: 'Gotham',
                    decoration: TextDecoration.none,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ),
        Hero(
          tag: 'ProPic',
          child: FadeTransition(
            opacity: widget._animation,
            child: Container(
              height: 40.0,
              width: 40.0,
              child: Icon(Icons.more_vert),
            ),
          ),
        ),
      ],
    );
  }
}
