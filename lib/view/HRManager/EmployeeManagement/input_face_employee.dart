import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:staras_manager/constants/constant.dart';

class AddFaceEmployee extends StatefulWidget {
  const AddFaceEmployee({Key? key}) : super(key: key);

  @override
  _AddFaceEmployeeState createState() => _AddFaceEmployeeState();
}

class _AddFaceEmployeeState extends State<AddFaceEmployee> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];

  void clearImageList() {
    setState(() {
      imageFileList.clear();
    });
  }

  Future<void> selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      setState(() {
        imageFileList.addAll(selectedImages);
      });
    }
  }

  Future<void> captureImage() async {
    final XFile? capturedImage =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (capturedImage != null) {
      setState(() {
        imageFileList.add(capturedImage);
      });
    }
  }

  Future<void> uploadImagesToFirebase() async {
    if (imageFileList.isEmpty) {
      // Handle the case where no images are selected
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('No Images Selected'),
            content: const Text('Please select images before uploading.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    final FirebaseStorage storage = FirebaseStorage.instance;

    for (int i = 0; i < imageFileList.length; i++) {
      final Reference ref = storage.ref().child('images/image$i.jpg');

      final File file = File(imageFileList[i].path);

      try {
        await ref.putFile(file);
        print('Image $i uploaded successfully');
      } catch (e) {
        print('Error uploading image $i: $e');
      }
    }
    clearImageList();
    print('All images uploaded successfully');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Add Face Employee',
          maxLines: 2,
          style: kTextStyle.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          height: 60.0,
                          minWidth: 70.0,
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () => {selectImages()},
                          // splashColor: Colors.redAccent,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image), // Icon "add"
                              SizedBox(
                                  width:
                                      8.0), // Khoảng cách giữa biểu tượng và văn bản
                              Text("Select Image"), // Văn bản
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: MaterialButton(
                          height: 60.0,
                          minWidth: 70.0,
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () => {captureImage()},
                          // splashColor: Colors.redAccent,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera_alt_outlined), // Icon "add"
                              SizedBox(
                                  width:
                                      8.0), // Khoảng cách giữa biểu tượng và văn bản
                              Text("Camera"), // Văn bản
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: imageFileList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.file(
                            File(imageFileList[index].path),
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      uploadImagesToFirebase();
                    },
                    child: const Text('Upload to Firebase'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
