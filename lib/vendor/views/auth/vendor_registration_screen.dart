import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          )
        ],
      ),
    );
  }
}
