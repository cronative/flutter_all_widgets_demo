import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileStructure extends StatefulWidget {
  FileStructure({Key key}) : super(key: key);

  @override
  _FileStructureState createState() => _FileStructureState();
}

class _FileStructureState extends State<FileStructure> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("File"),
          backgroundColor: Colors.red,
        ),
        body: Container(padding: EdgeInsets.all(30.0), child: buttonShape()),
      ),
    );
  }

  Widget buttonShape() {
    return InkWell(
      onTap: () async {
        await callFolderCreationMethod('Flutter Demo');
      },
      child: Container(
        width: 180.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0.0, 20.0),
                blurRadius: 30.0,
                color: Colors.black12)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.0),
        ),
        child: Row(
          children: [
            Container(
              width: 140.0,
              height: 50.0,
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
              child: Center(
                child: Text(
                  'Create Folder',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(95.0),
                  topLeft: Radius.circular(95.0),
                  bottomRight: Radius.circular(200.0),
                ),
              ),
            ),
            Icon(Icons.folder, size: 30.0, color: Colors.pinkAccent)
          ],
        ),
      ),
    );
  }

  callFolderCreationMethod(String folderInAppDocDir) async {
    String actualFileName = await folderCreate(folderInAppDocDir);
    print(actualFileName);
  }

  folderCreate(String folderName) async {
    final Directory _appDocDir =
        await getExternalStorageDirectory(); //Get this App External Storage Directory

    final Directory _appDocDirFolder = Directory(
        '${_appDocDir.path}/$folderName/'); //App External Storage Directory + folder name

    if (await _appDocDirFolder.exists()) {
      //if folder already exists return path
      return _appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder =
          await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }
}
