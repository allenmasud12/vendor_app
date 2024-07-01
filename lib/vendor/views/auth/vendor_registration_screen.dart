import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/const.dart';

import '../../../widget/input_text.dart';

class VendorRegistrationScreen extends StatelessWidget {
  const VendorRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.pink,
            toolbarHeight: 200,
            flexibleSpace: LayoutBuilder(builder: (context, constraints){
              return FlexibleSpaceBar(
                background: Center(
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration(
                      color: Colors.white
                    ),
                    child:  IconButton(
                      onPressed: (){

                      },
                      icon: const Icon(CupertinoIcons.photo),
                    ),
                  ),
                )
              );
            }),
          ),
           SliverToBoxAdapter(
            child: Column(
              children: [
                20.height,
                const InputText(
                  keyboardType: TextInputType.text,
                  text: "Business Name",
                ),
                const InputText(
                  keyboardType: TextInputType.text,
                  text: "Email Address",
                ),
                const InputText(
                  keyboardType: TextInputType.phone,
                  text: "Phone Number",
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
