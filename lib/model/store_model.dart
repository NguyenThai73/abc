class StoreModel {
  int? id;
  int? companyId;
  String? storeName;
  String? storeManager;
  String? createDate;
  String? address;
  String? fax;
  double? latitude;
  double? longitude;
  String? openTime;
  String? closeTime;
  String? bssid;
  bool? active;

  StoreModel(
      {this.id,
      this.companyId,
      this.storeName,
      this.storeManager,
      this.createDate,
      this.address,
      this.fax,
      this.latitude,
      this.longitude,
      this.openTime,
      this.closeTime,
      this.bssid,
      this.active});

  StoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['companyId'];
    storeName = json['storeName'];
    storeManager = json['storeManager'];
    createDate = json['createDate'];
    address = json['address'];
    fax = json['fax'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
    bssid = json['bssid'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['companyId'] = this.companyId;
    data['storeName'] = this.storeName;
    data['storeManager'] = this.storeManager;
    data['createDate'] = this.createDate;
    data['address'] = this.address;
    data['fax'] = this.fax;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['openTime'] = this.openTime;
    data['closeTime'] = this.closeTime;
    data['bssid'] = this.bssid;
    data['active'] = this.active;
    return data;
  }
}
