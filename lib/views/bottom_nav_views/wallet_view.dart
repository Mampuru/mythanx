import 'package:flutter/material.dart';

import '../../constants.dart';

class WalletView extends StatefulWidget {
  const WalletView({Key? key}) : super(key: key);

  @override
  _WalletViewState createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width =  MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shadowColor: kSecondaryColor,
              child: SizedBox(
                width: _width,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Subscriptions",style: TextStyle(color: kBodyTextColor,fontSize: 25.0,fontWeight: FontWeight.bold),),
                      Text("Balance: 0.0",style: TextStyle(color: kPrimaryColor,fontSize: 25.0,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shadowColor: kSecondaryColor,
              child: SizedBox(
                width: _width,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Rewards",style: TextStyle(color: kBodyTextColor,fontSize: 25.0,fontWeight: FontWeight.bold),),
                      Text("Balance: 0.0",style: TextStyle(color: kPrimaryColor,fontSize: 25.0,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shadowColor: kSecondaryColor,
              child: SizedBox(
                width: _width,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Rewards Bundle",style: TextStyle(color: kBodyTextColor,fontSize: 25.0,fontWeight: FontWeight.bold),),
                      Text("Balance: 0.0",style: TextStyle(color: kPrimaryColor,fontSize: 25.0,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shadowColor: kSecondaryColor,
              child: SizedBox(
                width: _width,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Donations",style: TextStyle(color: kBodyTextColor,fontSize: 25.0,fontWeight: FontWeight.bold),),
                      Text("Balance: 0.0",style: TextStyle(color: kPrimaryColor,fontSize: 25.0,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shadowColor: kSecondaryColor,
              child: SizedBox(
                width: _width,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Add Funds",style: TextStyle(color: kBodyTextColor,fontSize: 25.0,fontWeight: FontWeight.bold),),
                      Text("Balance: 0.0",style: TextStyle(color: kPrimaryColor,fontSize: 25.0,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shadowColor: kSecondaryColor,
              child: SizedBox(
                width: _width,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Vouchers",style: TextStyle(color: kBodyTextColor,fontSize: 25.0,fontWeight: FontWeight.bold),),
                      Text("Balance: 0.0",style: TextStyle(color: kPrimaryColor,fontSize: 25.0,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}