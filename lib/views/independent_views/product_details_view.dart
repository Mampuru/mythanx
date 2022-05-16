import 'package:flutter/material.dart';
import 'package:mythanx/data/mapper/products_model.dart';
import 'package:mythanx/views/widgets/primary_loading_button.dart';
import 'package:mythanx/views/widgets/primary_textfield.dart';
import '../../constants.dart';

class ProductDetailsView extends StatefulWidget {
  final Datum productItem;
  const ProductDetailsView({Key key ,this.productItem}) : super(key: key);

  @override
  _ProductDetailsViewState createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  final amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Edit Profile",style: TextStyle(color: kWhite),),

      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(widget.productItem.name,style: const TextStyle(fontSize: 30,color: kPrimaryColor,fontWeight: FontWeight.bold )),
              ),
              Text(widget.productItem.description,style: const TextStyle(fontSize: 17,)),
              widget.productItem.lineItem.isEmpty ?
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Please enter the amount you would like purchase"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PrimaryTextfield(controller: amountController, label: "Amount"),
                  ),
                ],
              ):
              Expanded(
                child: ListView.builder(
                    itemCount: widget.productItem.lineItem.length,
                    itemBuilder: (BuildContext context, int index){
                     final lineItem = widget.productItem.lineItem[index];
                     return Card(
                       child: ListTile(
                         onTap: () {

                         },
                         title: Text(lineItem.name),
                         subtitle: Text("Qty: ${lineItem.quantity}"),
                       ),
                     );
                }),
              )

            ],
          )
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.fromLTRB(48.0,0,16.0,16.0),
        child: PrimaryLoadingButton(
            buttonName: "Add to Cart",
            onTap: () async {
              /// Add endpoint to place order
            }),
      ),

    );
  }
}