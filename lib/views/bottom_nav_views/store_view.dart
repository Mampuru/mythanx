import 'package:flutter/material.dart';
import 'package:mythanx/api/api_service.dart';
import 'package:mythanx/data/mapper/products_model.dart';
import 'package:mythanx/views/independent_views/product_details_view.dart';

import '../../constants.dart';

class StoreView extends StatefulWidget {
  const StoreView({Key? key}) : super(key: key);

  @override
  _StoreViewState createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  List<Datum> productItems = [];
  late Future _getStoreProducts;
  
  @override
  void initState() {
    _getStoreProducts = getStoreProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getStoreProducts,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'ERROR: ${snapshot.error}',
                style: const TextStyle(fontSize: 18),
              ),
            );
          } else if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: productItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        final productItem = productItems[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsView(productItem: productItem,)));
                            },
                            child: Card(
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:[
                                    Text(productItem.name,style: const TextStyle(color: kPrimaryColor,fontSize: 25.0,fontWeight: FontWeight.bold),),
                                    Text(productItem.description,),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },),
                ),

              ],
            );
          }else{
            return Column(children: const [
              SizedBox(height: 200,),
              Center(
                child: Text(
                  'Fetching Store items',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: CircularProgressIndicator(color: kCharcoal,),
              )
            ]);
          }

        });
  }

  Future<List<dynamic>> getStoreProducts() async {
    Product result = await getProducts();
    setState(() {
      productItems = result.data;
    });
    return productItems;
  }
}
