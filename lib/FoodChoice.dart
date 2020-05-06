import 'package:flutter/material.dart';
import 'package:wanna_do_it_4/main.dart';

class FoodChoice extends StatefulWidget {
  final List<FoodChoiceTab> tabs;
  final Function selectedTab;

  FoodChoice({this.tabs, this.selectedTab});

  @override
  _FoodChoiceState createState() => _FoodChoiceState();
}

class _FoodChoiceState extends State<FoodChoice> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.tabs
          .map(
            (t) => FoodChoiceTab(
              name: t.name,
              height: t.height,
              width: t.width,
              textSize: t.textSize,
              active: (widget.tabs.indexOf(t) == selectedTab) ? true : false,
              onPressed: () {
                setState(() {
                  selectedTab = widget.tabs.indexOf(t);
                  widget.selectedTab(selectedTab);
                });
              },
            ),
          )
          .toList(),
    );
  }
}

class FoodChoiceTab extends StatefulWidget {
  final bool active;
  final Function onPressed;
  final Color color;
  final String name;
  final double height;
  final double width;
  final double textSize;

  FoodChoiceTab({this.active, this.onPressed, this.color, this.name,this.width,this.height,this.textSize});

  @override
  _FoodChoiceTabState createState() => _FoodChoiceTabState();
}

class _FoodChoiceTabState extends State<FoodChoiceTab> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
        print('tapped');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOut,
          height: widget.height,
          width: widget.width,
          child: Center(
            child: Text(
              widget.name,
              style: TextStyle(
                fontFamily: 'GothamBook',
                decoration: TextDecoration.none,
                fontSize: widget.textSize,
                color: (widget.active) ? Colors.white : Colors.black,
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: (widget.active) ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
