import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/models/vendor_model.dart';

class LandingScreen extends StatelessWidget {
 final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final CollectionReference _vendorStream = FirebaseFirestore.instance.collection("vendors");
    return StreamBuilder<DocumentSnapshot>(
      stream: _vendorStream.doc(_auth.currentUser!.uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
  VendorUserModel vendorUserModel = VendorUserModel.fromJson(snapshot.data!.data() as Map<String, dynamic>);
        return Center(child: Text(vendorUserModel.businessName!),);
      },
    );
  }
}
