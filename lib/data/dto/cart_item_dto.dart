class CartItem {
  String sku;
  String name;
  double total;
  int quantity;
  List<dynamic> lineItems;

  CartItem({required this.sku,required this.name, required this.quantity, required this.lineItems ,required this.total});
}