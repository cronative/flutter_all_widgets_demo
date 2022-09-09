import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grouped_list/grouped_list.dart';

void main() {
  runApp(MaterialApp(
    home: GroupList(),
  ));
}

// ignore: must_be_immutable
class GroupList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map data = {};
    data = ModalRoute.of(context).settings.arguments;
    print(data);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text('Group List'),
            centerTitle: true,
            backgroundColor: Colors.red[400]),
        body: GroupedListView<dynamic, String>(
          elements: _elements,
          groupBy: (element) => element['ShiftGroupDescription'],
          groupComparator: (value1, value2) => value2.compareTo(value1),
          itemComparator: (item1, item2) =>
              item1['UserFullName'].compareTo(item2['UserFullName']),
          sort: true,
          order: GroupedListOrder.ASC,
          useStickyGroupSeparators: true,
          groupSeparatorBuilder: (String value) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          itemBuilder: (c, element) {
            return Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: Container(
                color: Colors.white,
                child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Text(element['NameInitial'],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      foregroundColor: Colors.white,
                    ),
                    title: Text(element['UserFullName'],
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold))),
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
            );
          },
        ),
      ),
    );
  }

  _showSnackBar(String val) {
    print(val);
  }

  List _elements = [
    {
      "UserID": 7986,
      "DepartmentId": 36,
      "Unitdefault": 1,
      "UserFullName": "Boston (Traveler), Sherine",
      "User_Cell": "1112223333",
      "User_Phone": "9191234567",
      "User_Email": "InActiveEmail@shiftwizard.com",
      "BadgeID": null,
      "HideAccount": 0,
      "User_Status": null,
      "User_Name": null,
      "User_Password": null,
      "Supervisor": null,
      "Permission": "RN, RN9A, RN-Ort",
      "Title": null,
      "Category": null,
      "AgencyPhonetical": null,
      "FTEType": null,
      "ShiftGroupDescription": "Traveler",
      "LastLoginDate": null,
      "ProfilePictureFilename": null,
      "User_LName": "Boston (Traveler)",
      "User_FName": "Sherine",
      "NameInitial": "SB"
    },
    {
      "UserID": 8082,
      "DepartmentId": 36,
      "Unitdefault": 1,
      "UserFullName": "Sahasakmontri, Jay",
      "User_Cell": "1112223333",
      "User_Phone": "9191234567",
      "User_Email": "InActiveEmail@shiftwizard.com",
      "BadgeID": null,
      "HideAccount": 0,
      "User_Status": null,
      "User_Name": null,
      "User_Password": null,
      "Supervisor": null,
      "Permission": "RN-Ort",
      "Title": null,
      "Category": null,
      "AgencyPhonetical": null,
      "FTEType": null,
      "ShiftGroupDescription": "RN/Medic",
      "LastLoginDate": null,
      "ProfilePictureFilename": null,
      "User_LName": "Sahasakmontri",
      "User_FName": "Jay",
      "NameInitial": "JS"
    },
    {
      "UserID": 618,
      "DepartmentId": 36,
      "Unitdefault": 1,
      "UserFullName": "Ball, Sarah",
      "User_Cell": "9193245455",
      "User_Phone": "9191234567",
      "User_Email": "jeff.palmer@shiftwizard.com",
      "BadgeID": null,
      "HideAccount": 0,
      "User_Status": null,
      "User_Name": null,
      "User_Password": null,
      "Supervisor": null,
      "Permission": "RN, PEDI ED RN, RN9A, SANE RN, Medic",
      "Title": null,
      "Category": null,
      "AgencyPhonetical": null,
      "FTEType": null,
      "ShiftGroupDescription": "RN/Medic",
      "LastLoginDate": null,
      "ProfilePictureFilename": null,
      "User_LName": "Ball",
      "User_FName": "Sarah",
      "NameInitial": "SB"
    },
    {
      "UserID": 324,
      "DepartmentId": 36,
      "Unitdefault": 1,
      "UserFullName": "Bennet, Melinda",
      "User_Cell": "1112223333",
      "User_Phone": "9191234567",
      "User_Email": "InActiveEmail@shiftwizard.com",
      "BadgeID": null,
      "HideAccount": 0,
      "User_Status": null,
      "User_Name": null,
      "User_Password": null,
      "Supervisor": null,
      "Permission": "RN, PEDI ED RN, RN9A, Medic",
      "Title": null,
      "Category": null,
      "AgencyPhonetical": null,
      "FTEType": null,
      "ShiftGroupDescription": "PD RN/Medic",
      "LastLoginDate": null,
      "ProfilePictureFilename": null,
      "User_LName": "Bennet",
      "User_FName": "Melinda",
      "NameInitial": "MB"
    },
    {
      "UserID": 92,
      "DepartmentId": 36,
      "Unitdefault": 1,
      "UserFullName": "Baillargeon, Sarah",
      "User_Cell": "1112223333",
      "User_Phone": "9191234567",
      "User_Email": "tbs.vikas@gmail.com",
      "BadgeID": null,
      "HideAccount": 0,
      "User_Status": null,
      "User_Name": null,
      "User_Password": null,
      "Supervisor": null,
      "Permission": "Tech, US",
      "Title": null,
      "Category": null,
      "AgencyPhonetical": null,
      "FTEType": null,
      "ShiftGroupDescription": "Tech",
      "LastLoginDate": null,
      "ProfilePictureFilename": null,
      "User_LName": "Baillargeon",
      "User_FName": "Sarah",
      "NameInitial": "SB"
    },
    {
      "UserID": 7690,
      "DepartmentId": 36,
      "Unitdefault": 1,
      "UserFullName": "Spearman, Perry",
      "User_Cell": "1112223333",
      "User_Phone": "9191234567",
      "User_Email": "InActiveEmail@shiftwizard.com",
      "BadgeID": null,
      "HideAccount": 0,
      "User_Status": null,
      "User_Name": null,
      "User_Password": null,
      "Supervisor": null,
      "Permission": "Tech-Orient",
      "Title": null,
      "Category": null,
      "AgencyPhonetical": null,
      "FTEType": null,
      "ShiftGroupDescription": "Tech",
      "LastLoginDate": null,
      "ProfilePictureFilename": null,
      "User_LName": "Spearman",
      "User_FName": "Perry",
      "NameInitial": "PS"
    }
  ];
}
