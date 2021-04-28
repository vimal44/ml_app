import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageLabling extends StatefulWidget {
  ImageLabling({Key key}) : super(key: key);
  @override
  _ImageLablingState createState() => _ImageLablingState();
}

File _image;
ImageLabeler labeler;

class _ImageLablingState extends State<ImageLabling> {
  ImagePicker imagePicker;
  String result = '';
  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();

    labeler = FirebaseVision.instance.imageLabeler();
  }

  _imgFromCamera() async {
    PickedFile pickedFile =
        await imagePicker.getImage(source: ImageSource.camera);
    _image = File(pickedFile.path);
    doImageLabeling();
    setState(() {
      _image;
    });
  }

  _imgFromGallery() async {
    PickedFile pickedFile =
        await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile.path != null) {
      _image = File(pickedFile.path);
      doImageLabeling();
    }
    setState(() {
      _image;
    });
  }

  doImageLabeling() async {
    result = "";
    if (_image != null) {
      final FirebaseVisionImage visionImage =
          FirebaseVisionImage.fromFile(_image);
      final List<ImageLabel> labels = await labeler.processImage(visionImage);
      for (ImageLabel l4 in labels) {
        result += l4.text + " " + l4.confidence.toStringAsFixed(2) + '\n';
      }

      setState(() {
        result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 100.0),
                        _image != null
                            ? Center(
                                child: Container(
                                    height: 200.0,
                                    width: 200.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: FileImage(_image),
                                            fit: BoxFit.cover))),
                              )
                            : Container(),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    new Expanded(
                                      flex: 1,
                                      child: new SingleChildScrollView(
                                        scrollDirection:
                                            Axis.vertical, //.horizontal
                                        child: new Text(
                                          '$result',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'finger_paint',
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                ElevatedButton(
                                  child: Text('gallery image'),
                                  onPressed: _imgFromGallery,
                                ),
                                SizedBox(height: 10.0),
                                ElevatedButton(
                                  child: Text('Read Text'),
                                  onPressed: _imgFromGallery,
                                ),
                                ElevatedButton(
                                  child: Text('Read Bar Code'),
                                  onPressed: _imgFromGallery,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )))));
  }
}
