import 'package:flutter/material.dart';

import '../../constants.dart';

class WalletView extends StatefulWidget {
  const WalletView({Key key}) : super(key: key);

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
              color: kSecondaryColor,
              child: SizedBox(
                width: _width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Subscriptions",style: TextStyle(color: kWhite,fontSize: 25.0,fontWeight: FontWeight.bold),),
                      Text("Balance: 0.0",style: TextStyle(color: kWhite,fontSize: 25.0,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: kSecondaryColor,
              child: SizedBox(
                width: _width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Rewards",style: TextStyle(color: kWhite,fontSize: 25.0,fontWeight: FontWeight.bold),),
                      Text("Balance: 0.0",style: TextStyle(color: kWhite,fontSize: 25.0,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: kSecondaryColor,
              child: SizedBox(
                width: _width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Rewards Bundle",style: TextStyle(color: kWhite,fontSize: 25.0,fontWeight: FontWeight.bold),),
                      Text("Balance: 0.0",style: TextStyle(color: kWhite,fontSize: 25.0,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: kSecondaryColor,
              child: SizedBox(
                width: _width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Donations",style: TextStyle(color: kWhite,fontSize: 25.0,fontWeight: FontWeight.bold),),
                      Text("Balance: 0.0",style: TextStyle(color: kWhite,fontSize: 25.0,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: kSecondaryColor,
              child: SizedBox(
                width: _width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Add Funds",style: TextStyle(color: kWhite,fontSize: 25.0,fontWeight: FontWeight.bold),),
                      Text("Balance: 0.0",style: TextStyle(color: kWhite,fontSize: 25.0,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: kSecondaryColor,
              child: SizedBox(
                width: _width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Vouchers",style: TextStyle(color: kWhite,fontSize: 25.0,fontWeight: FontWeight.bold),),
                      Text("Balance: 0.0",style: TextStyle(color: kWhite,fontSize: 25.0,fontWeight: FontWeight.bold),),
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