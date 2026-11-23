
class CartItemModel {
  final String name;
  final String brand;
  final double price;
  int  qty;
  final String? image;

  CartItemModel({
  required  this.name,
  required  this.brand,
  required  this.price,
  required this.qty,
    this.image,
  });
}
