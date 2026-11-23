
import 'package:flutter/material.dart';
import 'package:paw_care/models/cart_item.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/cart_item_provider.dart';
import 'cart_style.dart';

class ItemCard extends StatefulWidget {
  final CartItemModel itemModel;

  const ItemCard({
    super.key,
    required this.itemModel,
  });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    CartItemProvider provider=Provider.of<CartItemProvider>(context);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: cardDecoration(),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: SizedBox(
              width: 80,
              height: 80,
              child: widget.itemModel.image != null &&
                  widget.itemModel.image!.isNotEmpty
                  ? Image.network(
                widget.itemModel.image!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFDCEFEA),
                    child: const Icon(
                      Icons.pets,
                      color: AppColors.primary,
                      size: 36,
                    ),
                  );
                },
              )
                  : Container(
                color: const Color(0xFFDCEFEA),
                child: const Icon(
                  Icons.pets,
                  color: AppColors.primary,
                  size: 36,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.itemModel.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  widget.itemModel.brand,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.muted,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.itemModel.price.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              InkWell(onTap:() {
                provider.decreaseQuantity(widget.itemModel);
                if(widget.itemModel.qty==0){
                  provider.cartItems.removeWhere((e) => e.name==widget.itemModel.name,);
                }
              }  ,
                child: const _QtyButton(
                  icon: Icons.remove,
                  filled: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  widget.itemModel.qty.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                  ),
                ),
              ),
              InkWell(
               onTap: () => provider.increaseQuantity(widget.itemModel),
                child: const _QtyButton(
                  icon: Icons.add,
                  filled: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final bool filled;

  const _QtyButton({
    required this.icon,
    required this.filled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: filled ? AppColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: filled
            ? null
            : Border.all(
          color: AppColors.border,
          width: 1.5,
        ),
      ),
      child: Icon(
        icon,
        size: 18,
        color: filled ? Colors.white : AppColors.text,
      ),
    );
  }
}