import 'package:flutter/material.dart';
import 'package:ml_app/face_detection_widget_folder/face_detection_image.dart';
import 'package:ml_app/face_detection_widget_folder/live.dart';

class FaceDetection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smile To Face App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                child: Text('Open Camera'),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 100, vertical: 50)),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LiveLabling(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
