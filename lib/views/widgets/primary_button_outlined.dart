import 'package:flutter/material.dart';

import '../../constants.dart';

class PrimaryButtonOutlined extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;
  final EdgeInsets margin;
  final Color buttonColor;
  final Color textColor;
  final double height;
  final double width;

  const PrimaryButtonOutlined({
    Key? key,
    required this.buttonName,
    required this.onTap,
    this.margin = const EdgeInsets.all(0.0),
    this.buttonColor = kWhite ,
    this.textColor = kPrimaryColor,
    this.width = 250.0,
    this.height = 48.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customButton = ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: width,height: height),
      child: OutlinedButton(
          onPressed: onTap,
          child: Text(buttonName,style: TextStyle(color: textColor,fontSize: 17.0,fontWeight: FontWeight.bold),),
          style: OutlinedButton.styleFrom(primary:textColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),side:const BorderSide(color: Colors.pink,width: 5,style:BorderStyle.solid ) ))
      ),
    );
    return customButton;
  }
}
