import 'dart:typed_data';
import 'package:country_state_city_picker/country_state_city_picker.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  Uint8List? _image;

  String cityValue = '';
  String stateValue = '';
  String countryValue = '';

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
                    child: _image != null
                        ? Image.memory(_image!)
                        : IconButton(
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
          SliverToBoxAdapter(
            child: Form(
              key: _globalKey,
              child: Column(
                children: [
                  20.height,
                  InputText(
                    emptyText: "please enter your business name",
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    text: "Business Name",
                  ),
                  InputText(
                    emptyText: "please enter your email",
                    controller: _emailController,
                    keyboardType: TextInputType.text,
                    text: "Email Address",
                  ),
                  InputText(
                    emptyText: "please enter your phone number",
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    text: "Phone Number",
                  ),
                  SelectState(
                    onCountryChanged: (value) {
                      setState(() {
                        countryValue = value;
                      });
                    },
                    onStateChanged: (value) {
                      setState(() {
                        stateValue = value;
                      });
                    },
                    onCityChanged: (value) {
                      setState(() {
                        cityValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            if(_globalKey.currentState!.validate()){
              print(_nameController.text);
              print(_emailController.text);
              print(_phoneController.text);
              print(countryValue);
              print(stateValue);
              print(cityValue);
            }else{
              print("wronggg");
            }

          },
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 4,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
