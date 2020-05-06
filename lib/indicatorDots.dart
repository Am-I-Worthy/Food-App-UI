import 'package:flutter/material.dart';

class IndicatorDot extends StatefulWidget {
  final List<IndicatorDotTab> tabs;
  final int selectedDot;

  IndicatorDot({this.tabs,this.selectedDot});

  @override
  _FoodChoiceState createState() => _FoodChoiceState();
}
class _FoodChoiceState extends State<IndicatorDot> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.tabs
          .map(
            (t) => IndicatorDotTab(
              active: (widget.tabs.indexOf(t) == widget.selectedDot) ? true : false,
            ),
          )
          .toList(),
    );
  }
}

class IndicatorDotTab extends StatefulWidget {
  final bool active;

  IndicatorDotTab({this.active,});

  @override
  _FoodChoiceTabState createState() => _FoodChoiceTabState();
}

class _FoodChoiceTabState extends State<IndicatorDotTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 375),
        curve: Curves.easeOut,
        height: (widget.active)?12.0:8.0,
        width: (widget.active)?12.0:8.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: (widget.active) ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
