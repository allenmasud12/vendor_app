class VendorUserModel {
  String? businessName;
  String? emailAddress;
  String? phoneNumber;
  String? countryValue;
  String? stateValue;
  String? cityValue;
  String? storeImage;
  String? vendorId;
  bool? approved;

  VendorUserModel({
    this.businessName,
    this.emailAddress,
    this.phoneNumber,
    this.countryValue,
    this.stateValue,
    this.cityValue,
    this.storeImage,
    this.vendorId,
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
      businessName: json['businessName'] as String?,
      emailAddress: json['emailAddress'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      countryValue: json['countryValue'] as String?,
      stateValue: json['stateValue'] as String?,
      cityValue: json['cityValue'] as String?,
      storeImage: json['storeImage'] as String?,
      vendorId: json['vendorId'] as String?,
      approved: json['approved'] as bool?,
    );
  }

  @override
  String toString() {
    return 'VendorUserModel{businessName: $businessName, emailAddress: $emailAddress, phoneNumber: $phoneNumber, countryValue: $countryValue, stateValue: $stateValue, cityValue: $cityValue, storeImage: $storeImage, vendorId: $vendorId, approved: $approved}';
  }
}
