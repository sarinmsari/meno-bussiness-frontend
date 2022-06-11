import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.hintText,
      this.isNumber = false,
      this.isRequired = false})
      : super(key: key);

  final String hintText;
  final bool isNumber;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: TextFormField(
        keyboardType: (isNumber) ? TextInputType.number : TextInputType.name,
        validator: isRequired
            ? (String? value) {
                if (value == "") return "Required";
              }
            : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
