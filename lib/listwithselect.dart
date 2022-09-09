import 'package:demo/model/listdata.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ListWithSelect()));
}

class ListWithSelect extends StatefulWidget {
  ListWithSelect({Key key}) : super(key: key);

  @override
  _ListWithSelectState createState() => _ListWithSelectState();
}

class _ListWithSelectState extends State<ListWithSelect> {
  List<Map> staticData = ListData.data;
  Map<int, bool> selectedFlag = {};
  bool isSelectionMode = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Select Item'),
          centerTitle: true,
          backgroundColor: Colors.red[400],
        ),
        body: ListView.builder(
          itemBuilder: (builder, index) {
            Map data = staticData[index];
            selectedFlag[index] = selectedFlag[index] ?? false;
            bool isSelected = selectedFlag[index];
            return ListTile(
              onLongPress: () => onLongPress(isSelected, index),
              onTap: () => onTap(isSelected, index, data),
              title: Text("${data['name']}"),
              subtitle: Text("${data['email']}"),
              leading: _buildSelectIcon(isSelected, data), // updated
            );
          },
          itemCount: staticData.length,
        ),
        floatingActionButton: buildSelectAllButton(),
      ),
    );
  }

  Widget buildSelectAllButton() {
    // The button will be visible when the selectionMode is enabled.
    if (isSelectionMode) {
      bool isFalseAvailable = selectedFlag
          .containsValue(false); // check if all item is not selected
      return FloatingActionButton(
        onPressed: _selectAll,
        backgroundColor: Colors.red[400],
        child: Icon(
          isFalseAvailable ? Icons.done_all : Icons.remove_done,
          color: Colors.white,
        ),
      );
    } else {
      return null;
    }
  }

  void _selectAll() {
    bool isFalseAvailable = selectedFlag.containsValue(false);
    selectedFlag.updateAll((key, value) => isFalseAvailable);
    setState(() {
      isSelectionMode = selectedFlag.containsValue(true);
    });
  }

  void onLongPress(bool isSelected, int index) {
    setState(() {
      selectedFlag[index] = !isSelected;
      isSelectionMode = selectedFlag.containsValue(true);
    });
  }

  Widget _buildSelectIcon(bool isSelected, Map data) {
    if (isSelectionMode) {
      return CircleAvatar(
          backgroundColor: Colors.red[400],
          child: isSelected
              ? Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : Text('${data['inidialName']}',
                  style: TextStyle(color: Colors.white)));
    } else {
      return CircleAvatar(
        backgroundColor: Colors.red[400],
        child: Text('${data['inidialName']}',
            style: TextStyle(color: Colors.white)),
      );
    }
  }

  void onTap(bool isSelected, int index, Map data) {
    if (isSelectionMode) {
      setState(() {
        selectedFlag[index] = !isSelected;
        isSelectionMode = selectedFlag.containsValue(true);
      });
    } else {
      Navigator.pushNamed(context, '/pass-data', arguments: data);
    }
  }
}
