import 'package:flutter/material.dart';
import 'package:mythanx/views/widgets/primary_loading_button.dart';

import '../../constants.dart';

class CartView extends StatefulWidget {
  const CartView({Key key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Edit Profile",style: TextStyle(color: kWhite),),

      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: Text("Cart is Empty",style: TextStyle(fontSize: 30),))
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.fromLTRB(48.0,0,16.0,16.0),
          child: PrimaryLoadingButton(
          buttonName: "Checkout",
          onTap: () async {
            /// Add endpoint to place order
          }),
        ),
    );
  }
}
