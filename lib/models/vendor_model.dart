class VendorUserModel {
  String businessName;
  String emailAddress;
  String phoneNumber;
  String countryValue;
  String stateValue;
  String cityValue;
  String storeImage;
  String vendorId;
  bool? approved;

  VendorUserModel({
    required this.businessName,
    required this.emailAddress,
    required this.phoneNumber,
    required this.countryValue,
    required this.stateValue,
    required this.cityValue,
    required this.storeImage,
    required this.vendorId,
    this.approved,
  });

  Map<String, dynamic> toJson() {
    return {
      'businessName': businessName,
      'emailAddress': emailAddress,
      'phoneNumber': phoneNumber,
      'countryValue': countryValue,
      'stateValue': stateValue,
      'cityValue': cityValue,
      'storeImage': storeImage,
      'vendorId': vendorId,
      'approved': approved,
    };
  }

  factory VendorUserModel.fromJson(Map<String, dynamic> json) {
    return VendorUserModel(
      businessName: json['businessName'],
      emailAddress: json['emailAddress'],
      phoneNumber: json['phoneNumber'],
      countryValue: json['countryValue'],
      stateValue: json['stateValue'],
      cityValue: json['cityValue'],
      storeImage: json['storeImage'],
      vendorId: json['vendorId'],
      approved: json['approved'],
    );
  }

}
