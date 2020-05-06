import 'package:flutter/material.dart';

import 'Colors.dart';
import 'CustomFlatButton.dart';

class BottomBlackBar extends StatelessWidget {
  const BottomBlackBar({
    Key key,
    @required Animation animation,
    @required this.height,
  }) : _animation = animation, super(key: key);

  final Animation _animation;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _animation.value * (height * (0.8 / 5)),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top:20.0,left: 20.0,right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          'NOW',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontFamily: 'Gotham'),
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          height: 12.0,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '\$7.50',
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 15.0,
                              fontFamily: 'Gotham'),
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          height: 5.0,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '30% Dsnt',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                              fontFamily: 'Gotham'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:34.0,right: 10.0,left: 10.0),
                  child: Container(
                    height: 8.0,
                    width: 8.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          'BEFORE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontFamily: 'Gotham'),
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          height: 12.0,
                        ),
                      ),
                      Flexible(
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(height: 2.2,width: 50.0,color: mainColor,),
                            Text(
                              '\$10.00',
                              style: TextStyle(
                                  color: mainColor,
                                  fontSize: 15.0,
                                  fontFamily: 'Gotham',
                                  ),
                            ),
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
            CustomFlatButton(),
          ],
        ),
      ),
    );
  }
}
