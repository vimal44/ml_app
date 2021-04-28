import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ml_app/bareCode_widget.dart';

import 'package:ml_app/image_lablling_folder/image_labling.dart';
import 'package:ml_app/text_reader_widget.dart';

//import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:http/http.dart';
import 'face_detection_widget_folder/face_detection_widget1.dart';
//import 'package:firebase_ml_vision/firebase_ml_vision.dart';
//import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void openFaceDetection() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FaceDetection()));
  }

  void openImageLabling() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ImageLabling()));
  }

  void openBarcodeScanner() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyBarecode()));
  }

  void openTextReader() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TextReader()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn ML'),
        backgroundColor: Colors.lightGreen,
        elevation: 10.0,
      ),
      drawer: Drawer(
        elevation: 12,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                Colors.greenAccent,
                Colors.lightGreenAccent
              ])),
              child: Text("welcome"),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("Contact Us"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Machine learning',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 20),
                  scrollDirection: Axis.vertical,
                  child: Row(
                    children: [
                      InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          height: 200,
                          padding: EdgeInsets.symmetric(
                              vertical: 40, horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Colors.blue,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 0,
                                    offset: Offset(0, 10),
                                    blurRadius: 0,
                                    color: Colors.blue.withOpacity(0.4))
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(
                                        "assets_images/faceregImages.jpg"),
                                    fit: BoxFit.cover,
                                  )),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Face detection",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        onTap: openFaceDetection,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.43,
                              height: 200,
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Colors.yellow,
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 0,
                                        offset: Offset(0, 10),
                                        blurRadius: 0,
                                        color: Colors.blue.withOpacity(0.4))
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage(
                                            "assets_images/faceregImages.jpg"),
                                        fit: BoxFit.cover,
                                      )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Image Labling",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            onTap: openImageLabling,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.43,
                        height: 200,
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.deepPurple,
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 0,
                                  offset: Offset(0, 10),
                                  blurRadius: 0,
                                  color: Colors.blue.withOpacity(0.4))
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(
                                      "assets_images/faceregImages.jpg"),
                                  fit: BoxFit.cover,
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Text Reader",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      onTap: openTextReader,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        InkWell(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.43,
                            height: 200,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Colors.green,
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 0,
                                      offset: Offset(0, 10),
                                      blurRadius: 0,
                                      color: Colors.blue.withOpacity(0.4))
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: AssetImage(
                                          "assets_images/faceregImages.jpg"),
                                      fit: BoxFit.cover,
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "BarCode Scanner",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          onTap: openBarcodeScanner,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 200,
                        padding:
                            EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.amber,
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 0,
                                  offset: Offset(0, 10),
                                  blurRadius: 0,
                                  color: Colors.blue.withOpacity(0.4))
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(
                                      "assets_images/faceregImages.jpg"),
                                  fit: BoxFit.cover,
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Image Labling",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      onTap: openFaceDetection,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
