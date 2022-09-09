import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:share/share.dart';

void main() {
  runApp(MaterialApp(
    home: Second(),
  ));
}

class Second extends StatefulWidget {
  Second({Key key}) : super(key: key);

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  /*
   * Share details
   */
  shareDetails(String details, String subject) {
    Share.share(details, subject: subject);
  }

  _showSnackBar(String val) {
    print(val);
    switch (val) {
      case 'Share':
        shareDetails(
            "check out my website https://example.com", "Flutter share demo");
        break;
      case 'Delete':
        print(val);
        break;
      default:
    }
  }

  Map data = {};
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text('Slidable List'),
            centerTitle: true,
            backgroundColor: Colors.red[400]),
        body: Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: Container(
            color: Colors.red[400],
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("RA",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold)),
                foregroundColor: Colors.white,
              ),
              title: Text('Ravi Ashara',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: Text('SlidableDrawerDelegate',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
          actions: <Widget>[
            IconSlideAction(
              caption: 'Archive',
              color: Colors.blue,
              icon: Icons.archive,
              onTap: () => _showSnackBar('Archive'),
            ),
            IconSlideAction(
              caption: 'Share',
              color: Colors.indigo,
              icon: Icons.share,
              onTap: () => _showSnackBar('Share'),
            ),
          ],
        ),
      ),
    );
  }
}
