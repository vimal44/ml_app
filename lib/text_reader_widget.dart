import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class TextReader extends StatefulWidget {
  @override
  _TextReaderState createState() => _TextReaderState();
}

File pickedImage;
ImagePicker imagePicker;
TextRecognizer recognizeText;
String result = '';

class _TextReaderState extends State<TextReader> {
  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    recognizeText = FirebaseVision.instance.textRecognizer();
  }

  Future pickImage() async {
    PickedFile tempStore =
        await imagePicker.getImage(source: ImageSource.gallery);
    pickedImage = File(tempStore.path);
    readText();
    setState(() {
      pickedImage;
    });
  }

  Future readText() async {
    result = "";
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(pickedImage);

    VisionText readText = await recognizeText.processImage(ourImage);

    for (TextBlock block in readText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          result += (word.text) + " ";
        }
      }
    }
    setState(() {
      result;
    });
  }

  Future decode() async {
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(pickedImage);
    BarcodeDetector barcodeDetector = FirebaseVision.instance.barcodeDetector();
    List barCodes = await barcodeDetector.detectInImage(ourImage);

    for (Barcode readableCode in barCodes) {
      print(readableCode.displayValue);
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
                            padding: EdgeInsets.symmetric(horizontal: 15),
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
