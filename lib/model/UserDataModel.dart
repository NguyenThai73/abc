import 'dart:convert';

class UserData {
  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? currentAddress;
  final int? companyId;
  final String? profileImage;
  final bool? active;
  final CitizenIdentificationCardResponse? citizenIdentificationCardResponse;

  UserData({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.currentAddress,
    this.companyId,
    this.profileImage,
    this.active,
    this.citizenIdentificationCardResponse,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      currentAddress: json['currentAddress'],
      companyId: json['companyId'],
      profileImage: json['profileImage'],
      active: json['active'],
      citizenIdentificationCardResponse:
          CitizenIdentificationCardResponse.fromJson(
              json['citizenIdentificationCardResponse']),
    );
  }

  factory UserData.fromRawJson(String jsonString) {
    final jsonData = json.decode(jsonString);
    return UserData.fromJson(jsonData);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'currentAddress': currentAddress,
      'companyId': companyId,
      'profileImage': profileImage,
      'active': active,
      'citizenIdentificationCardResponse':
          citizenIdentificationCardResponse?.toJson(),
    };
  }

  String toRawJson() => json.encode(toJson());
}

class CitizenIdentificationCardResponse {
  final String? citizenId;
  final String? fullName;
  final DateTime? dateOfBirth;
  final String? sex;
  final String? nationality;
  final String? placeOfOrigin;
  final String? placeOfResidence;
  final DateTime? dateOfIssue;
  final String? issuedBy;

  CitizenIdentificationCardResponse({
    this.citizenId,
    this.fullName,
    this.dateOfBirth,
    this.sex,
    this.nationality,
    this.placeOfOrigin,
    this.placeOfResidence,
    this.dateOfIssue,
    this.issuedBy,
  });

  factory CitizenIdentificationCardResponse.fromJson(
      Map<String, dynamic> json) {
    return CitizenIdentificationCardResponse(
      citizenId: json['citizenId'],
      fullName: json['fullName'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      sex: json['sex'],
      nationality: json['nationality'],
      placeOfOrigin: json['placeOfOrigin'],
      placeOfResidence: json['placeOfResidence'],
      dateOfIssue: DateTime.parse(json['dateOfIssue']),
      issuedBy: json['issuedBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'citizenId': citizenId,
      'fullName': fullName,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'sex': sex,
      'nationality': nationality,
      'placeOfOrigin': placeOfOrigin,
      'placeOfResidence': placeOfResidence,
      'dateOfIssue': dateOfIssue?.toIso8601String(),
      'issuedBy': issuedBy,
    };
  }
}
