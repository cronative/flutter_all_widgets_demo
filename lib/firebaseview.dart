import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'constants/database.dart';

void main() {
  runApp(MaterialApp(home: FirebaseView()));
}

class FirebaseView extends StatefulWidget {
  FirebaseView({Key key}) : super(key: key);

  @override
  _FirebaseViewState createState() => _FirebaseViewState();
}

class _FirebaseViewState extends State<FirebaseView> {
  var noteInfo;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text('View List'),
            centerTitle: true,
            backgroundColor: Colors.red[400]),
        body: Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: Database.readItems(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'No data found',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                );
              } else if (snapshot.hasData || snapshot.data != null) {
                return snapshot.data.docs.length == 0
                    ? Center(
                        child: Text(
                          'No data found',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16.0),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          noteInfo = snapshot.data.docs[index].data();
                          String docID = snapshot.data.docs[index].id;
                          String title = noteInfo['title'];
                          String description = noteInfo['description'];

                          return Ink(
                            decoration: BoxDecoration(
                              color: Colors.red[400].withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              onTap: () => {
                                Navigator.pushNamed(context, '/firebase-insert',
                                    arguments: {
                                      "id": docID,
                                      "title": title,
                                      "description": description
                                    })
                              },
                              title: Text(
                                title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                description,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        },
                      );
              } else if (!snapshot.hasData && snapshot.data == null) {
                return Center(child: Text('No data found'));
              }

              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/firebase-insert');
          },
          backgroundColor: Colors.red[400],
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
