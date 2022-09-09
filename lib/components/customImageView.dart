import 'package:flutter/material.dart';

Widget previewImage(BuildContext context, _imageFile, _width) {
  _width = MediaQuery.of(context).size.width;
  return Container(
    height: _width * 0.34,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      color: Colors.grey,
    ),
    child: _imageFile != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(
              _imageFile,
              height: _width * 0.34,
              width: _width,
              alignment: Alignment.center,
              fit: BoxFit.fitWidth,
            ),
          )
        : Center(
            child: Text('Image not selected'),
          ),
  );
}
