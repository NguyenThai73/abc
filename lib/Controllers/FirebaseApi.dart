import 'dart:io';
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/api_consts.dart';

class FirebaseApi {
  static Future<ApiResponse> uploadImageToFirebase(
      String Username, File imageFile) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      int randomNumber = Random().nextInt(100000);
      String imageLocation = Username + '/image$randomNumber.jpg';
      await firebase_storage.FirebaseStorage.instance
          .ref(imageLocation)
          .putFile(imageFile);
      apiResponse.data = "Thêm hình thành công";
      return apiResponse;
    } on FirebaseException catch (e) {
      apiResponse.error = e.code;
      return apiResponse;
    } catch (e) {
      apiResponse.error = "serverError";
      return apiResponse;
    }
  }

  static Future<XFile?> pickFile(File file) async {
    String fileName = basename(file.path!);
    XFile xfile = XFile(file.path, name: fileName);
    return xfile;
  }

  static Future<List<XFile>> getFirebaseImages(String Username) async {
    List<XFile> imagesXFile = [];
    List<File> images = [];
    final ListResult result = await firebase_storage.FirebaseStorage.instance
        .ref(Username + '/')
        .listAll();

    for (final Reference ref in result.items) {
      final String imageURL = await ref.getDownloadURL();
      final File imageFile = await _urlToFile(imageURL);
      String fileName = basename(imageFile.path!);
      XFile xfile = XFile(imageFile.path, name: fileName);
      imagesXFile.add(xfile);
    }
    return imagesXFile;
  }

  static Future<File> _urlToFile(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    final tempDir = await getTemporaryDirectory();
    final file =
        File('${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.png');

    await file.writeAsBytes(bytes);
    return file;
  }
}
