class CartItem {
  String sku;
  String name;
  double total;
  int quantity;
  List<dynamic> lineItems;

  CartItem({this.sku,this.name, this.quantity, this.lineItems ,this.total});
}