import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class ExpansionListCard extends StatefulWidget {
  ExpansionListCard({Key key}) : super(key: key);

  @override
  _ExpansionListCardState createState() => _ExpansionListCardState();
}

class _ExpansionListCardState extends State<ExpansionListCard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Expansion Tile Card List"),
          backgroundColor: Colors.red[400],
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: index < 5 ? 10.0 : 0.0,
                  left: 10.0,
                  right: 10.0,
                  top: index == 0 ? 10.0 : 0),
              child: ExpansionTileCard(
                baseColor: Colors.cyan[50],
                expandedColor: Colors.red[50],
                // key: cardA,
                leading:
                    CircleAvatar(child: Image.asset("assets/images/moon.jpeg")),
                title: Text("Flutter Dev's $index"),
                subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
                children: <Widget>[
                  Divider(
                    thickness: 1.0,
                    height: 1.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        "FlutterDevs specializes in creating cost-effective and efficient applications with our perfectly crafted,"
                        " creative and leading-edge flutter app development solutions for customers all around the globe.",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
