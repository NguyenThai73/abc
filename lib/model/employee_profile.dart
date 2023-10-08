class EmployeeProfile {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? currentAddress;
  int? companyId;
  String? profileImage;
  bool? active;
  CitizenIdentificationCardResponse? citizenIdentificationCardResponse;

  EmployeeProfile(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.currentAddress,
      this.companyId,
      this.profileImage,
      this.active,
      this.citizenIdentificationCardResponse});

  EmployeeProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    currentAddress = json['currentAddress'];
    companyId = json['companyId'];
    profileImage = json['profileImage'];
    active = json['active'];
    citizenIdentificationCardResponse =
        json['citizenIdentificationCardResponse'] != null
            ? new CitizenIdentificationCardResponse.fromJson(
                json['citizenIdentificationCardResponse'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['currentAddress'] = this.currentAddress;
    data['companyId'] = this.companyId;
    data['profileImage'] = this.profileImage;
    data['active'] = this.active;
    if (this.citizenIdentificationCardResponse != null) {
      data['citizenIdentificationCardResponse'] =
          this.citizenIdentificationCardResponse!.toJson();
    }
    return data;
  }
}

class CitizenIdentificationCardResponse {
  String? citizenId;
  String? fullName;
  String? dateOfBirth;
  String? sex;
  String? nationality;
  String? placeOfOrigrin;
  String? placeOfResidence;
  String? dateOfIssue;
  String? issuedBy;

  CitizenIdentificationCardResponse(
      {this.citizenId,
      this.fullName,
      this.dateOfBirth,
      this.sex,
      this.nationality,
      this.placeOfOrigrin,
      this.placeOfResidence,
      this.dateOfIssue,
      this.issuedBy});

  CitizenIdentificationCardResponse.fromJson(Map<String, dynamic> json) {
    citizenId = json['citizenId'];
    fullName = json['fullName'];
    dateOfBirth = json['dateOfBirth'];
    sex = json['sex'];
    nationality = json['nationality'];
    placeOfOrigrin = json['placeOfOrigrin'];
    placeOfResidence = json['placeOfResidence'];
    dateOfIssue = json['dateOfIssue'];
    issuedBy = json['issuedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['citizenId'] = this.citizenId;
    data['fullName'] = this.fullName;
    data['dateOfBirth'] = this.dateOfBirth;
    data['sex'] = this.sex;
    data['nationality'] = this.nationality;
    data['placeOfOrigrin'] = this.placeOfOrigrin;
    data['placeOfResidence'] = this.placeOfResidence;
    data['dateOfIssue'] = this.dateOfIssue;
    data['issuedBy'] = this.issuedBy;
    return data;
  }
}
