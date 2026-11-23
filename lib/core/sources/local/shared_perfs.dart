import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/cart_item.dart';
import '../../../models/model_of_product.dart';
class SharedPerfs {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> SaveCartItems(
      List<CartItemModel> cartItems) async {
    await prefs.setStringList(
      "cartItemsSaved",
      cartItems.map((e) => "${e.name}|${e.qty}").toList(),
    );
  }

  static List<CartItemModel> getSavedItemCart(
      List<ModelOfProduct> products) {

    List<String> itemsSaved =
        prefs.getStringList("cartItemsSaved") ?? [];

    return itemsSaved.map((item) {
      final data = item.split('|');

      final name = data[0];
      final qty = int.parse(data[1]);

      final product = products.where(
            (e) => e.productName == name,
      );

      if (product.isEmpty) {
        return null;
      }

      final selectedProduct = product.first;

      return CartItemModel(
        name: selectedProduct.productName,
        image: selectedProduct.image,
        brand: selectedProduct.category,
        price: double.parse(selectedProduct.price),
        qty: qty,
      );

    }).whereType<CartItemModel>().toList();
  }
}