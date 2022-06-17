
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../constants.dart';

class PayFastWebView extends StatefulWidget {
  const PayFastWebView({Key key}) : super(key: key);

  @override
  _PayFastWebViewState createState() => _PayFastWebViewState();
}

class _PayFastWebViewState extends State<PayFastWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('My ThanX'),),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse("https://sandbox.payfast.co.za/eng/process"),
            method: 'POST',
            body: Uint8List.fromList(utf8.encode("merchant_id=10000100&merchant_key=46f0cd694581a&amount=1000&item_name=Bundle")),
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded'
            }
        ),
        onWebViewCreated: (controller) {
        },
      ),
    );
  }
}
