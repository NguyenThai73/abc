class EmployeeInStoreModel {
  int? id;
  int? companyId;
  String? storeName;
  String? createDate;
  String? address;
  String? fax;
  double? latitude;
  double? longitude;
  String? openTime;
  String? closeTime;
  String? bssid;
  bool? active;
  List<EmployeeInStoreResponseModels>? employeeInStoreResponseModels;

  EmployeeInStoreModel(
      {this.id,
      this.companyId,
      this.storeName,
      this.createDate,
      this.address,
      this.fax,
      this.latitude,
      this.longitude,
      this.openTime,
      this.closeTime,
      this.bssid,
      this.active,
      this.employeeInStoreResponseModels});

  EmployeeInStoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['companyId'];
    storeName = json['storeName'];
    createDate = json['createDate'];
    address = json['address'];
    fax = json['fax'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
    bssid = json['bssid'];
    active = json['active'];
    if (json['employeeInStoreResponseModels'] != null) {
      employeeInStoreResponseModels = <EmployeeInStoreResponseModels>[];
      json['employeeInStoreResponseModels'].forEach((v) {
        employeeInStoreResponseModels!
            .add(new EmployeeInStoreResponseModels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['companyId'] = this.companyId;
    data['storeName'] = this.storeName;
    data['createDate'] = this.createDate;
    data['address'] = this.address;
    data['fax'] = this.fax;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['openTime'] = this.openTime;
    data['closeTime'] = this.closeTime;
    data['bssid'] = this.bssid;
    data['active'] = this.active;
    if (this.employeeInStoreResponseModels != null) {
      data['employeeInStoreResponseModels'] =
          this.employeeInStoreResponseModels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EmployeeInStoreResponseModels {
  int? employeeId;
  String? employeeName;
  String? positionName;
  String? typeName;
  Null? assignedDate;
  int? workScheduleId;
  bool? status;

  EmployeeInStoreResponseModels(
      {this.employeeId,
      this.employeeName,
      this.positionName,
      this.typeName,
      this.assignedDate,
      this.workScheduleId,
      this.status});

  EmployeeInStoreResponseModels.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    employeeName = json['employeeName'];
    positionName = json['positionName'];
    typeName = json['typeName'];
    assignedDate = json['assignedDate'];
    workScheduleId = json['workScheduleId'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    data['employeeName'] = this.employeeName;
    data['positionName'] = this.positionName;
    data['typeName'] = this.typeName;
    data['assignedDate'] = this.assignedDate;
    data['workScheduleId'] = this.workScheduleId;
    data['status'] = this.status;
    return data;
  }
}
