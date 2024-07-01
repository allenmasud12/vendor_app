import 'dart:typed_data'; 

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_app/const.dart';
import 'package:vendor_app/vendor/controller/vendor_controller.dart';

import '../../../widget/input_text.dart';

class VendorRegistrationScreen extends StatefulWidget {
  const VendorRegistrationScreen({super.key});

  @override
  State<VendorRegistrationScreen> createState() => _VendorRegistrationScreenState();
}

class _VendorRegistrationScreenState extends State<VendorRegistrationScreen> {
  final VendorController _vendorController = VendorController();

  Uint8List? _image;

  selectGalleryImage() async {
    Uint8List im = await _vendorController.pickStoreImage(ImageSource.gallery);

    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.pink,
            toolbarHeight: 200,
            flexibleSpace: LayoutBuilder(builder: (context, constraints) {
              return FlexibleSpaceBar(
                background: Center(
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: _image!= null? Image.memory(_image!): IconButton(
                      onPressed: () {
                        selectGalleryImage();
                      },
                      icon: const Icon(CupertinoIcons.photo),
                    ),
                  ),
                ),
              );
            }),
          ),
        const  SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 20),
                 InputText(
                  keyboardType: TextInputType.text,
                  text: "Business Name",
                ),
                 InputText(
                  keyboardType: TextInputType.text,
                  text: "Email Address",
                ),
                 InputText(
                  keyboardType: TextInputType.phone,
                  text: "Phone Number",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
