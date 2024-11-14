import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/const.dart';
import 'package:vendor_app/models/vendor_model.dart';
import 'package:vendor_app/vendor/screen/vendor_map_screen.dart';
import 'package:vendor_app/vendor/views/auth/vendor_registration_screen.dart';

class LandingScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final CollectionReference vendorStream =
        FirebaseFirestore.instance.collection("vendors");
    return StreamBuilder<DocumentSnapshot>(
      stream: vendorStream.doc(_auth.currentUser?.uid).snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        if(!snapshot.data!.exists){
          return const VendorRegistrationScreen();
        }

        VendorUserModel vendorUserModel = VendorUserModel.fromJson(
            snapshot.data!.data() as Map<String, dynamic>);

        if(vendorUserModel.approved== true){
          return const VendorMapScreen();
        }
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                vendorUserModel.storeImage!,
                width: 90,
              ),
            ),
            15.height,
            Text(
              vendorUserModel.businessName!,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),

            ),
            15.height,
            const Text("Your Application, has been send to shop admin will get back you soon",
            textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            15.height,
            TextButton(onPressed: ()async{
              await _auth.signOut();
            }, child: const Text("Sign Out"))
          ],
        ));
      },
    );
  }
}
