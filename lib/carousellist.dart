import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CarouserListDemo()));
}

class CarouserListDemo extends StatefulWidget {
  CarouserListDemo({Key key}) : super(key: key);

  @override
  _CarouserListDemoState createState() => _CarouserListDemoState();
}

class _CarouserListDemoState extends State<CarouserListDemo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text('Carouser List'), backgroundColor: Colors.red[400]),
        body: CarouselSlider(
          options: CarouselOptions(
              height: 200.0, enableInfiniteScroll: true, autoPlay: true),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Text(
                      'text $i',
                      style: TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
