
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mythanx/controllers/cart_controller.dart';
import 'package:mythanx/views/independent_views/payment_view.dart';
import 'package:mythanx/views/widgets/primary_loading_button.dart';

import '../../constants.dart';

class CartView extends StatefulWidget {
  const CartView({Key key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController cartController = Get.find();
  var total=0.00;

  @override
  void initState() {
    totalPrice(cartController.cart);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Cart",style: TextStyle(color: kWhite),),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => ListView.builder(
          itemCount: cartController.cart.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kSecondaryColor,
                  ),
                ),
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Column(
                  children: [
                    Text(cartController.cart[index].name, style: const TextStyle(
                        fontSize: 20, color: kPrimaryColor),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("R${cartController.cart[index].total}", style: const TextStyle(
                            fontSize: 16, color: kBodyTextColor),),
                        IconButton(onPressed: () => {
                          cartController.removeFromCart(index),
                          totalPrice(cartController.cart),
                        }, icon: const Icon(Icons.delete,color: kErrorColor,))
                      ],
                    ),

                  ],
                ),
              ),
            );
          },
        ))
        ),
        bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 20.0,
              ),
              const Text("Total :",style: TextStyle(fontSize: 15,color: kPrimaryColor,fontWeight: FontWeight.bold )),
              Text("$total",style: const TextStyle(fontSize: 15,color: kPrimaryColor,fontWeight: FontWeight.bold )),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          PrimaryLoadingButton(
              buttonName: "Checkout",
              onTap: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentView()));
              }),
          const SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }

  totalPrice(List list) {
    var priceList = [];
    if(list.isNotEmpty){
      for (var element in list) {
        priceList.add(element.total);
      }
      setState(() {
        total = priceList.reduce((value, element) => value + element);
      });
    }else if(list.isEmpty){
      setState(() {
        total = 0.00;
      });
    }
  }
}
