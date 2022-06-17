import 'package:flutter/material.dart';
import 'package:mythanx/views/payment_views/payfast_webview.dart';
import 'package:mythanx/views/widgets/primary_button.dart';

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
          child: Center(
            child: Column(
              children:  [
                const SizedBox(
                  height: 20.0,
                ),
                const Text("Please select a payment method",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                const SizedBox(
                  height: 50.0,
                ),
                PrimaryButton(buttonColor: kErrorColor,buttonName: "Pay Fast", onTap: ()   {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PayFastWebView()),
                  );
                }),
                const SizedBox(
                  height: 20.0,
                ),
                PrimaryButton(buttonColor: kWarningColor,textColor: kPrimaryColor,buttonName: "PayPal", onTap: () {

                }),
                const SizedBox(
                  height: 20.0,
                ),
                PrimaryButton(buttonColor: kCharcoal,buttonName: "Own Funds", onTap: () {

                }),
              ],
            ),
          )

      ),
    );
  }
}