import 'package:staras_manager/model/employe/employe.cccd.model.dart';

class EmployeeRequestModel {
  String? name;
  String? phone;
  String? email;
  String? currentAddress;
  String? profileImage;
  bool? active;
  EmployeCCCDModel? citizenIdentificationCardRequest;

  EmployeeRequestModel({this.name, this.phone, this.email, this.currentAddress, this.profileImage, this.active, this.citizenIdentificationCardRequest});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['currentAddress'] = currentAddress;
    data['profileImage'] = profileImage;
    data['active'] = true;
    data['citizenIdentificationCardRequest'] = citizenIdentificationCardRequest?.toJson();
    return data;
  }
}
