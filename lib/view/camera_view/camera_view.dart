import 'dart:io';
import 'package:flutter/material.dart';
import 'package:face_camera/face_camera.dart';

class CameraView extends StatefulWidget {
  final Function(File?) onImageCaptured;
  const CameraView({Key? key, required this.onImageCaptured}) : super(key: key);

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  File? _capturedImage;

  void _handleImageCaptured(File? image) {
    setState(() {
      _capturedImage = image;
    });
    widget.onImageCaptured(
        image); // Call the callback function to pass the image back
    Navigator.pop(context); // Return to the previous screen
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FaceCamera example app'),
        ),
        body: Builder(builder: (context) {
          if (_capturedImage != null) {
            return Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.file(
                    _capturedImage!,
                    width: double.maxFinite,
                    fit: BoxFit.fitWidth,
                  ),
                  ElevatedButton(
                    onPressed: () => _handleImageCaptured(null),
                    child: const Text(
                      'Capture Again',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            );
          }
          return SmartFaceCamera(
            autoCapture: true,
            defaultCameraLens: CameraLens.front,
            onCapture:
                _handleImageCaptured, // Use the _handleImageCaptured method
            onFaceDetected: (Face? face) {
              // Do something
            },
            messageBuilder: (context, face) {
              if (face == null) {
                return _message('Place your face in the camera');
              }
              if (!face.wellPositioned) {
                return _message('Center your face in the square');
              }
              return const SizedBox.shrink();
            },
          );
        }),
      ),
    );
  }

  Widget _message(String msg) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
        child: Text(
          msg,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 14, height: 1.5, fontWeight: FontWeight.w400),
        ),
      );
}
