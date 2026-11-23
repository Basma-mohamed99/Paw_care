import 'package:flutter/cupertino.dart';
import 'package:paw_care/core/sources/local/shared_perfs.dart';

import '../models/cart_item.dart';


class CartItemProvider extends ChangeNotifier {
  List<CartItemModel> cartItems = [];

  void addToCart(CartItemModel newItem) {
    for (var item in cartItems) {
      if (item.name == newItem.name) {
        item.qty += newItem.qty;
        saveData();
        notifyListeners();
        return;
      }
    }

    cartItems.add(newItem);
    saveData();
    notifyListeners();
  }

  void increaseQuantity(CartItemModel item) {
    item.qty++;
    saveData();
    notifyListeners();
  }

  void decreaseQuantity(CartItemModel item) {
    if (item.qty > 1) {
      item.qty--;
    } else {
      cartItems.remove(item);
    }

    saveData();
    notifyListeners();
  }

  void saveData()async {
   await SharedPerfs.SaveCartItems(cartItems);
  }
  void restoreCart(List<CartItemModel> items) {
    cartItems = items;
    notifyListeners();
  }
}
