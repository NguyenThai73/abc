import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:staras_manager/constants/api_consts.dart';
import 'package:staras_manager/model/UserDataModel.dart';

class UserProfileController {
  static UserData parseMyObjects(String jsonString) {
    final parsed = jsonDecode(jsonString).cast<Map<String, dynamic>>();
    return parsed.map<UserData>((json) => UserData.fromJson(json));
  }

  static Future<String?> readAccessToken() async {
    final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
    return await _secureStorage.read(key: 'access_token');
  }

  static Future<ApiResponse> UserProfile(int id) async {
    ApiResponse apiResponse = ApiResponse();
    var jsonData = {}; // Thêm dữ liệu JSON nếu cần thiết

    try {
      var token = await readAccessToken();
      final response = await http.get(
        Uri.parse(GetEmployee + id.toString()),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        apiResponse.data = UserData.fromJson(jsonDecode(response.body)['data']);
      } else {
        apiResponse.error = jsonDecode(response.body)['message'];
      }
    } catch (e) {
      apiResponse.error = "Server error!!";
    }

    return apiResponse;
  }

  static Future<ApiResponse> UpdateUserProfile(
      UserData userData, int id) async {
    ApiResponse apiResponse = ApiResponse();
    var jsonData;
    try {
      jsonData = {
        "name": userData.name,
        "phone": userData.phone,
        "email": userData.email,
        "currentAddress": userData.currentAddress,
        "companyId": userData.companyId,
        "profileImage": userData.profileImage,
        "active": true,
        "citizenIdentificationCardRequest": {
          "citizenId":
              userData.citizenIdentificationCardResponse?.citizenId ?? "",
          "fullName":
              userData.citizenIdentificationCardResponse?.fullName ?? "",
          "dateOfBirth": "2001-10-07",
          "sex": userData.citizenIdentificationCardResponse?.sex ?? "",
          "nationality":
              userData.citizenIdentificationCardResponse?.nationality ?? "",
          "placeOfOrigrin":
              userData.citizenIdentificationCardResponse?.placeOfOrigin ?? "",
          "placeOfResidence":
              userData.citizenIdentificationCardResponse?.placeOfResidence ??
                  "",
          "dateOfIssue": "2001-10-07",
          "issuedBy":
              userData.citizenIdentificationCardResponse?.issuedBy ?? "",
        }
      };
    } catch (e) {
      apiResponse.error = "Lỗi parste json";
      return apiResponse;
    }
    try {
      var token = await readAccessToken();
      final response = await http.put(Uri.parse(PutEmployee + id.toString()),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: json.encode(jsonData));

      if (response.statusCode == 200) {
        apiResponse.data = UserData.fromJson(jsonDecode(response.body)['data']);
      } else {
        apiResponse.error = jsonDecode(response.body)['message'];
      }
    } catch (e) {
      apiResponse.error = e.toString();
    }

    return apiResponse;
  }
}
