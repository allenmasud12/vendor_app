import 'package:flutter/material.dart';
import 'package:vendor_app/const.dart';

class InputText extends StatelessWidget {
  final String text;
  final TextInputType keyboardType;

  const InputText({
    super.key,
    required this.text,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: keyboardType,
            decoration: InputDecoration(
              labelText: text,
              hintText: text,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.pink,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
