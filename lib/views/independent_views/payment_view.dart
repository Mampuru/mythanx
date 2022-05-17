import 'package:flutter/material.dart';
import 'package:mythanx/views/widgets/primary_button.dart';
import 'package:mythanx/views/widgets/primary_loading_button.dart';

import '../../constants.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({Key key}) : super(key: key);

  @override
  _PaymentViewState createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Payment",style: TextStyle(color: kWhite),),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children:  [
              PrimaryButton(buttonColor: kErrorColor,buttonName: "Pay Fast", onTap: () {

              }),
              PrimaryButton(buttonColor: kWarningColor,buttonName: "PayPal", onTap: () {

              })

            ],
          )

      ),
      // bottomSheet: Padding(
      //   padding: const EdgeInsets.fromLTRB(48.0,0,16.0,16.0),
      //   child: PrimaryLoadingButton(
      //       buttonName: "Checkout",
      //       onTap: () async {
      //         /// Add endpoint to place order
      //       }),
      // ),
    );
  }
}