import 'package:flutter/material.dart';

import '../../constants.dart';


class PrimaryLoadingButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;
  final EdgeInsets margin;
  final Color buttonColor;
  final Color textColor;
  final double height;
  final double width;
  final bool isProcessing;

   const PrimaryLoadingButton({
     Key key,
    @required this.buttonName,
    this.onTap,
    this.margin = const EdgeInsets.all(0.0),
    this.buttonColor =  kPrimaryColor,
    this.textColor = kWhite,
    this.width = 250.0,
    this.height = 56.0,
    this.isProcessing = false,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    final customButton = SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: buttonColor,
          primary: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: buttonColor, width: 3),
          ),
          elevation: 0,
        ),
        onPressed: onTap,
        child: Padding(
            padding: const EdgeInsets.symmetric(
              // horizontal:
              // Responsive.blockSizeHorizontal(context) * 3,
              // vertical: Responsive.blockSizeVertical(context) * 2,
            ),
            child: isProcessing
                ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                kWhite,
              ),
            )
                : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    buttonName,
                    style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
    return customButton;
  }
}
