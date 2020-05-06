import 'package:flutter/material.dart';
import 'package:wanna_do_it_4/Colors.dart';
import 'package:wanna_do_it_4/FoodChoice.dart';

import 'BottomBlackBar.dart';
import 'DetailsPageTopBar.dart';

class DetailsPage extends StatefulWidget {
  final int pageNo;
  final String headingText;
  final String subText;
  final String image;

  DetailsPage({this.pageNo, this.headingText, this.subText, this.image});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  int active = 0;

  AnimationController _controller;
  CurvedAnimation _curvedAnimation;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);
    _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_curvedAnimation);
    _controller.forward();

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: mainColor,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: DetailsPageTopBar(animation: _animation),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    height: height * (0.6 / 5),
                  ),
                  Flexible(
                    child: Hero(
                      tag: 'Page${widget.pageNo}',
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30.0),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          widget.headingText,
                                          style: TextStyle(
                                            fontFamily: 'Gotham',
                                            decoration: TextDecoration.none,
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(
                                          widget.subText,
                                          style: TextStyle(
                                            fontFamily: 'GothamBook',
                                            decoration: TextDecoration.none,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        active = (active == 1) ? 0 : 1;
                                      });
                                    },
                                    child: Icon(
                                      (active == 1)
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      size: 35.0,
                                      color: (active != 1)
                                          ? Colors.black
                                          : Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            FadeTransition(
                              opacity: _animation,
                              child: Container(
                                height: 220.0,
                                width: 220.0,
                                foregroundDecoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(150.0),
                                  // image: DecorationImage(
                                  //   fit: BoxFit.cover,
                                  //   image: AssetImage(widget.image),
                                  // ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FoodChoice(
                      selectedTab: (value) {
                        print(value);
                      },
                      tabs: [
                        FoodChoiceTab(
                          name: 'Small',
                          height: 40.0,
                          width: 90.0,
                          textSize: 16.0,
                        ),
                        FoodChoiceTab(
                          name: 'Medium',
                          height: 40.0,
                          width: 90.0,
                          textSize: 16.0,
                        ),
                        FoodChoiceTab(
                          name: 'Big',
                          height: 40.0,
                          width: 90.0,
                          textSize: 16.0,
                        ),
                      ],
                    ),
                    BottomBlackBar(animation: _animation, height: height),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
