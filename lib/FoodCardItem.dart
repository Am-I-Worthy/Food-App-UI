import 'package:flutter/material.dart';
import 'CustomFlatButton.dart';
import 'DetailsPage.dart';

List<String> indianFood = [
  'Roti-Panner masala',
  'Burrito Chicken',
  'Prawn Soupy Noodles',
  'Chicken Biriyani',
  'Indian Food',
  'indianFood'
];

List<String> chineseFood = [
  'Rice Vegetable Mix',
  'Chicken Rib Curry',
  'Beans Stew Roll',
  'Chicken Fried Rice',
  'Chinese Food',
  'chineseFood',
];

List<String> italianFood = [
  'Friut Salad',
  'Cheesy Pasta',
  'Rose Pasta Roll',
  'Veg Pizza',
  'Italian Food',
  'italianFood',
];

List<List> typesOfFood = [indianFood, chineseFood, italianFood];

class FoodItemCard extends StatefulWidget {
  final int index;
  final int foodIndex;
  final double height;
  final bool active;

  FoodItemCard({this.foodIndex, this.index, this.height, this.active});

  @override
  _FoodItemCardState createState() => _FoodItemCardState();
}

class _FoodItemCardState extends State<FoodItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              pageNo: widget.index,
              headingText: typesOfFood[widget.foodIndex].elementAt(widget.index),
              subText: typesOfFood[widget.foodIndex]
                  [typesOfFood[widget.foodIndex].length - 2],
                  image: 'assets/${typesOfFood.elementAt(widget.foodIndex).elementAt(typesOfFood[widget.foodIndex].length - 1)}/${widget.index}.jpg',
            ),
          ),
        );
        });
      },
      child: Hero(
        tag: 'Page${widget.index}',
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    
                    typesOfFood[widget.foodIndex].elementAt(widget.index),
                    style:
                        TextStyle(
                          fontFamily: 'Gotham',
                          decoration: TextDecoration.none,
                          fontSize: 24.0, fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                  SizedBox(height: 8.0,),
                  Text(
                    typesOfFood[widget.foodIndex][typesOfFood[widget.foodIndex].length - 2],
                    style: TextStyle(
                      fontFamily: 'GothamBook',
                      decoration: TextDecoration.none,
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                ],
              ),
              AnimatedOpacity(
                opacity: (widget.active) ? 1.0 : 0.0,
                duration: Duration(milliseconds: 375),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 600),
                  curve: Curves.easeOutBack,
                  height: widget.height,
                  width: widget.height,

                  foregroundDecoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100.0),
                    // image: DecorationImage(
                    //   fit: BoxFit.cover,
                    //   image: AssetImage(
                    //       'assets/${typesOfFood.elementAt(widget.foodIndex).elementAt(typesOfFood[widget.foodIndex].length - 1)}/${widget.index}.jpg'),
                    // ),
                  ),
                ),
              ),
              Flexible(
                child: AnimatedOpacity(
                  opacity: (widget.active) ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 375),
                  curve: Curves.easeOut,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 375),
                    height: (widget.height == 190.0) ? 28.0 : 0.0,
                    child: Text(
                      '\$10.00',
                      style: TextStyle(
                        fontFamily: 'Gotham',
                        decoration: TextDecoration.none,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: AnimatedOpacity(
                  opacity: (widget.active) ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 375),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 375),
                    curve: Curves.easeOut,
                    height: (widget.active) ? 45.0 : 0.0,
                    width: 90.0,
                    child: CustomFlatButton(),
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
        ),
      ),
    );
  }
}


