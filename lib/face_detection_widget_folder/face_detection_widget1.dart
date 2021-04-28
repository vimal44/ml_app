import 'package:flutter/material.dart';
import 'package:ml_app/face_detection_widget_folder/face_detection_camera.dart';
import 'package:ml_app/face_detection_widget_folder/face_detection_image.dart';

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
                child: Text('Add Smile to Face from Image'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FaceDetectionFromImage(),
                    ),
                  );
                }),
            ElevatedButton(
                child: Text('Add Smile to Face from Live Camera'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FaceDetectionFromLiveCamera(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
