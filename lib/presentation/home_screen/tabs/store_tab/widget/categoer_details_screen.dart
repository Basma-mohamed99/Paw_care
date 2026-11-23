import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:paw_care/models/cart_item.dart';
import 'package:paw_care/models/model_of_product.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/cart_item_provider.dart';

class CategoerDetailsScreen extends StatefulWidget {
  const CategoerDetailsScreen({super.key});

  @override
  State<CategoerDetailsScreen> createState() => _CategoerDetailsScreenState();
}

class _CategoerDetailsScreenState extends State<CategoerDetailsScreen> {
  int quantity = 1;

  static const teal = Color(0xFF2A9D8F);
  static const orange = Color(0xFFF4A261);
  static const dark = Color(0xFF16302E);
  static const bg = Color(0xFFF4F9F8);
  static const grey = Color(0xFF7A8B89);

  @override
  Widget build(BuildContext context) {
    CartItemProvider provider = Provider.of<CartItemProvider>(context);
    final ModelOfProduct args =
        ModalRoute.of(context)!.settings.arguments as ModelOfProduct;
    final double rating = double.tryParse(args.rating) ?? 0;

    return Scaffold(
      backgroundColor: bg,
      body: Column(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(args.image, fit: BoxFit.cover),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.25),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withOpacity(0.4),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    args.category,
                    style: const TextStyle(fontSize: 12, color: grey),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    args.productName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: dark,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Row(
                    children: [
                      ...List.generate(5, (i) {
                        IconData icon = rating >= i + 1
                            ? Icons.star_rounded
                            : rating > i
                            ? Icons.star_half_rounded
                            : Icons.star_outline_rounded;
                        return Icon(
                          icon,
                          size: 16,
                          color: const Color(0xFFF2C14E),
                        );
                      }),
                      const SizedBox(width: 4),
                      Text(
                        args.rating,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: dark,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'EGP ${args.price}',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: dark,
                          ),
                        ),
                      ),
                      _qtyButton(
                        Icons.remove,
                        background: Colors.white,
                        iconColor: dark,
                        onTap: () {
                          if (quantity > 1) setState(() => quantity--);
                        },
                      ),
                      SizedBox(
                        width: 38,
                        child: Text(
                          '$quantity',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: dark,
                          ),
                        ),
                      ),
                      _qtyButton(
                        Icons.add,
                        background: teal,
                        iconColor: Colors.white,
                        onTap: () => setState(() => quantity++),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: dark,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          args.description,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.6,
                            color: grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3F3E6),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.check, size: 18, color: Color(0xFF2E7D32)),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'In Stock — Usually ships within 2 days',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF2E7D32),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: _actionButton('Add to Cart', teal, () {
                          provider.addToCart(
                            CartItemModel(
                              image: args.image,
                              name: args.productName,
                              brand: args.category,
                              price: double.parse(args.price),
                              qty: 1,
                            ),
                          );
                        }
                          ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 4,
                        child: _actionButton('Buy Now', orange, () {
                          // TODO: buy now (args, quantity)
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _qtyButton(
    IconData icon, {
    required Color background,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return Material(
      color: background,
      borderRadius: BorderRadius.circular(8),
      elevation: 0.5,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: SizedBox(
          width: 30,
          height: 30,
          child: Icon(icon, size: 16, color: iconColor),
        ),
      ),
    );
  }

  Widget _actionButton(String label, Color color, VoidCallback onTap) {
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
