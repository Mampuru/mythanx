import 'package:flutter/material.dart';

import '../../constants.dart';

class PrimaryTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? textInputType;
  final bool? obscureText;

  const PrimaryTextfield({
    Key? key,
    required this.controller,
    required this.label,
    this.textInputType,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextField(
    textCapitalization: TextCapitalization.none,
    autocorrect: false,
    enableSuggestions: false,
    keyboardType: (textInputType == null) ? TextInputType.text : textInputType,
    controller: controller,
    obscureText: (obscureText == null) ? false:true,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    decoration: InputDecoration(
      hintText: label,
      hintStyle: const TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: kBodyTextColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
      ),
    ),
  );
}