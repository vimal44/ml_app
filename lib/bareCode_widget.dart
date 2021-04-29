import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyBarecode extends StatefulWidget {
  MyBarecode({Key key}) : super(key: key);

  @override
  _MyBarecodeState createState() => _MyBarecodeState();
}

String result = '';
File pickedImage;
ImagePicker imagePicker;
BarcodeDetector barcodeDetector;

class _MyBarecodeState extends State<MyBarecode> {
  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    barcodeDetector = FirebaseVision.instance.barcodeDetector();
  }

  Future pickImage() async {
    PickedFile tempStore =
        await imagePicker.getImage(source: ImageSource.gallery);
    pickedImage = File(tempStore.path);
    decode();

    setState(() {
      pickedImage;
    });
  }

  Future decode() async {
    result = "";
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(pickedImage);

    List barCodes = await barcodeDetector.detectInImage(ourImage);

    for (Barcode readableCode in barCodes) {
      result += (readableCode.displayValue) + "";
    }
    setState(() {
      result;
    });
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
                        pickedImage != null
                            ? Center(
                                child: Container(
                                    height: 200.0,
                                    width: 200.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: FileImage(pickedImage),
                                            fit: BoxFit.cover))),
                              )
                            : Container(),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            padding: EdgeInsets.all(15),
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
                                  onPressed: pickImage,
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            horizontal: 100, vertical: 50)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )))));
  }
}
