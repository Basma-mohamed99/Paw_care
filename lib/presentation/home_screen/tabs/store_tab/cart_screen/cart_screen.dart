
import 'package:flutter/material.dart';
import 'package:paw_care/core/sources/local/shared_perfs.dart';
import 'package:paw_care/presentation/home_screen/tabs/store_tab/cart_screen/widgets/cart_item_card.dart';
import 'package:paw_care/provider/cart_item_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../models/cart_item.dart';
import '../../../../../provider/All_product_json_provider.dart';
import 'widgets/order_summary_card.dart';
import 'widgets/checkout_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}


class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    AllProductJsonProvider provider=Provider.of<AllProductJsonProvider>(context,listen: false);
    provider.readJson();
  }

  @override
  Widget build(BuildContext context) {
    AllProductJsonProvider AllProductProvider=Provider.of<AllProductJsonProvider>(context,listen: true);
    CartItemProvider provider=Provider.of<CartItemProvider>(context);
    List<CartItemModel> cartItems=SharedPerfs.getSavedItemCart(AllProductProvider.products);
    double subTotal = cartItems.fold(0, (total, item) {
      return total + (item.price * item.qty);
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAF9),
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(itemCount: cartItems.length,
                itemBuilder: (context, index) =>ItemCard(itemModel: cartItems.elementAt(index)) ,

              ),
            ),

            const SizedBox(height: 16),

             OrderSummaryCard(
              subtotal: " EGP ${subTotal.toString() }",
              shipping: 'EGP 50',
              total: " EGP ${(subTotal+50).toString()}",
            ),

            const SizedBox(height: 20),

            CheckoutButton(
              onPressed: () {
                // Navigate to checkout screen
              },
            ),
          ],
        ),
      ),
    );
  }


}
