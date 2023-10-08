class EmployeCCCDModel {
  String? fullName;
  String? citizenId;
  String? dateOfBirth;
  String? sex;
  String? nationality;
  String? placeOfOrigrin;
  String? placeOfResidence;
  String? dateOfIssue;
  String? issuedBy;

  EmployeCCCDModel({
    this.fullName,
    this.citizenId,
    this.dateOfBirth,
    this.sex,
    this.nationality,
    this.placeOfOrigrin,
    this.placeOfResidence,
    this.issuedBy,
    this.dateOfIssue,
  });

  EmployeCCCDModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    citizenId = json['citizenId'];
    dateOfBirth = json['dateOfBirth'];
    sex = json['sex'];
    nationality = json['nationality'];
    placeOfOrigrin = json['placeOfOrigrin'];
    placeOfResidence = json['placeOfResidence'];
    dateOfIssue = json['dateOfIssue'];
    issuedBy = json['issuedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['fullName'] = fullName;
    data['citizenId'] = citizenId;
    data['dateOfBirth'] = dateOfBirth;
    data['sex'] = sex;
    data['nationality'] = nationality;
    data['placeOfOrigrin'] = placeOfOrigrin;
    data['placeOfResidence'] = placeOfResidence;
    data['dateOfIssue'] = dateOfIssue;
    data['issuedBy'] = issuedBy;
    return data;
  }
}
