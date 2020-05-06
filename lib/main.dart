import 'package:flutter/material.dart';
import 'package:wanna_do_it_4/indicatorDots.dart';

import 'Colors.dart';
import 'FoodCardItem.dart';
import 'FoodChoice.dart';
import 'TopBar.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

int selectedTab = 1;

class _MyAppState extends State<MyApp> {
  PageController _pageController;
  double padding = 0;
  int pageNo = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
    );
    _pageController.addListener(() {
      setState(() {
        padding = _pageController.page;
        pageNo = _pageController.page.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(color: mainColor),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: TopBar(
                  leading: Icon(
                    Icons.menu,
                    size: 23.0,
                  ),
                  titleText: 'Food Items',
                  trailing: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/user.jpg',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  height: height * (1.25 / 5),
                ),
                Container(
                  height: height * (3.2 / 5),
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        print(index);
                        return AnimatedPadding(
                          duration: Duration(milliseconds: 375),
                          curve: Curves.easeOut,
                          padding: (index != pageNo)
                              ? EdgeInsets.only(
                                  top: 70.0,
                                  bottom: 70.0,
                                  right: 10.0,
                                  left: 10.0)
                              : EdgeInsets.only(
                                  top: 0.0,
                                  bottom: 0.0,
                                  right: 25.0,
                                  left: 25.0),
                          child: [
                            FoodItemCard(
                              index: index,
                              foodIndex: 0,
                              height: (index != pageNo) ? 100.0 : 190.0,
                              active: (index == pageNo) ? true : false,
                            ),
                            FoodItemCard(
                              index: index,
                              foodIndex: 1,
                              height: (index != pageNo) ? 100.0 : 190.0,
                              active: (index == pageNo) ? true : false,
                            ),
                            FoodItemCard(
                              index: index,
                              foodIndex: 2,
                              height: (index != pageNo) ? 100.0 : 190.0,
                              active: (index == pageNo) ? true : false,
                            ),
                          ].elementAt(selectedTab),
                        );
                      }),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  height: height * (1.2 / 5) - 80,
                ),
                FoodChoice(
                  selectedTab: (value) {
                    setState(() {
                      selectedTab = value;
                      _pageController.animateToPage(
                        0,
                        duration: Duration(milliseconds: 375),
                        curve: Curves.easeOut,
                      );
                    });
                  },
                  tabs: [
                    FoodChoiceTab(
                      name: 'Indian',
                      height: 55.0,
                      width: 110.0,
                      textSize: 18.0,
                    ),
                    FoodChoiceTab(
                      name: 'Chinese',
                      height: 55.0,
                      width: 110.0,
                      textSize: 18.0,
                    ),
                    FoodChoiceTab(
                      name: 'Italian',
                      height: 55.0,
                      width: 110.0,
                      textSize: 18.0,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  height: height * (4.55 / 5),
                ),
                Container(
                  child: IndicatorDot(
                    selectedDot: pageNo,
                    tabs: [
                      IndicatorDotTab(),
                      IndicatorDotTab(),
                      IndicatorDotTab(),
                      IndicatorDotTab(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
