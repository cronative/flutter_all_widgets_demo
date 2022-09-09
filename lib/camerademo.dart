import 'dart:io';
import 'package:demo/components/customImageView.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(home: CameraDemo()));
}

class CameraDemo extends StatefulWidget {
  CameraDemo({Key key}) : super(key: key);

  @override
  _CameraDemoState createState() => _CameraDemoState();
}

class _CameraDemoState extends State<CameraDemo> {
  File _imageFile;
  var _width;

  onImageButtonPressed(String source, {capturedImageFile}) async {
    final ImagePicker _picker = ImagePicker();
    File val;

    final pickedFile = await _picker.getImage(
      source: source == 'Camera' ? ImageSource.camera : ImageSource.gallery,
      preferredCameraDevice: CameraDevice.front
    );
    // print(pickedFile.path);
    // final bytes = File(pickedFile.path).readAsBytesSync();
    // String _img64 = base64Encode(bytes);
    // debugPrint(_img64);

    val = await ImageCropper.cropImage(
      sourcePath: pickedFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      compressQuality: 100,
      compressFormat: ImageCompressFormat.jpg,
      androidUiSettings: AndroidUiSettings(
        toolbarColor: Colors.white,
        toolbarTitle: "Crop Photo",
      ),
    );
    capturedImageFile(val);
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Upload Image"),
          backgroundColor: Colors.red[400],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: previewImage(context, _imageFile, _width),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 100.0,
              height: 50.0,
              child: FloatingActionButton.extended(
                backgroundColor: Colors.red[400],
                label: Text("Camera"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {
                  onImageButtonPressed("Camera", capturedImageFile: (s) {
                    setState(() {
                      _imageFile = s;
                    });
                  });
                },
              ),
            ),
            Container(
              width: 100.0,
              height: 50.0,
              child: FloatingActionButton.extended(
                backgroundColor: Colors.red[400],
                label: Text("Gallery"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {
                  onImageButtonPressed(
                    "Gallery",
                    capturedImageFile: (s) {
                      setState(() {
                        _imageFile = s;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
