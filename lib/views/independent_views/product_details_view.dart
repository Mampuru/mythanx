import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mythanx/controllers/cart_controller.dart';
import 'package:mythanx/data/dto/cart_item_dto.dart';
import 'package:mythanx/data/mapper/products_model.dart';
import 'package:mythanx/views/widgets/primary_loading_button.dart';
import 'package:mythanx/views/widgets/primary_textfield.dart';
import 'package:mythanx/views/widgets/primary_toast.dart';
import '../../constants.dart';

class ProductDetailsView extends StatefulWidget {
  final Datum productItem;
  const ProductDetailsView({Key? key ,required this.productItem}) : super(key: key);

  @override
  _ProductDetailsViewState createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  CartController cartController = Get.find();
  final amountController = TextEditingController();
  double total = 0.00;
  int counter = 0;
  var sum = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Store",style: TextStyle(color: kWhite),),

      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(widget.productItem.name,style: const TextStyle(fontSize: 30,color: kPrimaryColor,fontWeight: FontWeight.bold )),
                ),
                Text(widget.productItem.description,style: const TextStyle(fontSize: 17,)),
                const SizedBox(
                  height: 20.0,
                ),
                widget.productItem.lineItem.isEmpty ?
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Please enter the amount you would like purchase"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PrimaryTextfield(controller: amountController, label: "Amount",textInputType: TextInputType.number, obscureText: false,),
                    ),
                  ],
                ):
                SizedBox(
                  height: MediaQuery.of(context).size.height/1.8,
                  child: ListView.builder(
                      itemCount: widget.productItem.lineItem.length,
                      itemBuilder: (BuildContext context, int index){
                       final lineItem = widget.productItem.lineItem[index];
                       return Card(
                         child: ListTile(
                           onTap: () {
                             showDialog(context: context, builder:(BuildContext context){
                               return Dialog(
                                 elevation: 0,
                                 alignment: Alignment.center,
                                 child: Column(
                                   mainAxisSize: MainAxisSize.min,
                                   children: [
                                     const SizedBox(height: 20.0,),
                                     Padding(
                                       padding: const EdgeInsets.fromLTRB(24,16,24,8),
                                       child: Text("How much ${lineItem.name} bundles do you wish to purchase",style: const TextStyle(color: kCharcoal,fontWeight: FontWeight.bold,fontSize: 20)),
                                     ),
                                     const SizedBox(height: 20.0,),
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: PrimaryTextfield(label:"e.g 570",controller: amountController,textInputType: TextInputType.number,),
                                     ),
                                     const SizedBox(height: 20.0,),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       children: [
                                         InkWell(
                                           radius: 40.0,
                                           onTap: () {
                                             amountController.clear();
                                             Navigator.pop(context);
                                           },
                                           child: const Text("CANCEL",style: TextStyle(color: kErrorColor),),
                                         ),
                                         InkWell(
                                             radius: 40.0,
                                             onTap: () async {
                                                  setState(() {
                                                    lineItem.quantity = int.parse(amountController.text);
                                                    lineItem.total = findSubTotal(int.parse(amountController.text),100.00);
                                                    sum[lineItem.id] = lineItem.total;
                                                  });

                                                  setState(() {
                                                    total = overallTotal();
                                                  });
                                                  amountController.clear();
                                                  Navigator.pop(context);
                                             },
                                             child: const Text("ACCEPT",style: TextStyle(color: kSuccessColor),)
                                         ),
                                       ],
                                     ),
                                     const SizedBox(height: 20.0,),
                                   ],
                                 ),
                               );
                             });
                           },
                           title: Text(lineItem.name),
                           subtitle: Text("Qty: ${lineItem.quantity}"),
                         ),
                       );
                  }),
                ),
                const SizedBox(
                  height: 50.0,
                ),

              ],
            ),
          )
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
              buttonName: "Add to Cart",
              onTap: () async {
                widget.productItem.lineItem.isEmpty ?
               await addToCart(widget.productItem,double.parse(amountController.text)) :
                await addToCart(widget.productItem,total);
               PrimaryToast().displayToast("Item added to Cart", kInfoColor);
              }),
          const SizedBox(
            height: 10.0,
          )
        ],
      ),

    );
  }

  addToCart(Datum productItem,double subtotal){
    CartItem item = CartItem();
    item.sku = productItem.sku;
    item.name = productItem.name;
    item.quantity = counter;
    item.lineItems = productItem.lineItem;
    item.total = subtotal;

    cartController.addToCart(item);
  }

  //calculating the total for the lineItem bundle
  double findSubTotal(int quantity,double price){
    double subtotal;
    subtotal = quantity*price;
    return subtotal;
  }

  double overallTotal(){
    double overTotal = 0.00;
    sum.forEach((key, value) {
      overTotal = overTotal + value;
    });
    return overTotal;
  }
}
