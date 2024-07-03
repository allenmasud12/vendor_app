import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class VendorController {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  pickStoreImage(ImageSource source) async {
    final ImagePicker _pickImage = ImagePicker();
    XFile? _file = await _pickImage.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print("NO image Selected");
    }
  }

  ///FUNCTION TO UPLOAD VENDOR STORE IMAGE

  uploadVendorStoreImage(Uint8List? image)async{
   Reference ref = _storage.ref().child("storeImage").child(_auth.currentUser!.uid);

  UploadTask uploadTask = ref.putData(image!);
    TaskSnapshot snapshot =await uploadTask;
   String downloadUrl =await snapshot.ref.getDownloadURL();
   return downloadUrl;
  }

  Future<String> vendorRegistrationForm(
    String businessName,
    String emailAddress,
    String phoneNumber,
    String countryValue,
    String stateValue,
    String cityValue,
    Uint8List? image,
  ) async {
    String res = "Something Went wrong";
    try {
     String downloadUrl = await uploadVendorStoreImage(image);
      await _firestore.collection("vendors").doc(_auth.currentUser!.uid).set({
        'businessName': businessName,
        'storeImage': downloadUrl,
        'emailAddress': emailAddress,
        'phoneNumber': phoneNumber,
        'CountryValue': countryValue,
        'stateValue': stateValue,
        'cityValue': countryValue,
        'vendorId': _auth.currentUser!.uid,
        'approved': false,
      });
      res = "Success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
