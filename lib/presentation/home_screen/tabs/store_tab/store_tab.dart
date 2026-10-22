import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:paw_care/core/app_colors.dart';
import 'package:paw_care/models/model_of_product.dart';
import 'package:paw_care/presentation/home_screen/tabs/store_tab/widget/product_widget.dart';

class StoreTab extends StatefulWidget {
  const StoreTab ({super.key});


  @override
  State<StoreTab> createState() => _StoreTabState();
}


class _StoreTabState extends State<StoreTab> {
  late List<ModelOfProduct> products =[];

  @override
  void initState() {
    super.initState();
    readJson();

  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [

          Container(color: AppColors.mintgreen,
            child: Padding(padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(),
                  Text("Pet Store", style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text("Everything your pet needs", style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),),
                  SizedBox(height: 10.h,),

                  TextField(
                    decoration: InputDecoration(
                      hint: Text("Search products...",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          )
                      ),

                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )
                      ),


                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                ],
              ),


            ),
          ),
          SizedBox(height: 15.h),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5

              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductWidget(model: products[index],);
              },
            ),
          )

        ],
      ),
    );
  }

  Future<void> readJson() async {
    final String response = await DefaultAssetBundle.of(context)
        .loadString('assets/json/products.json');

    final List<dynamic> data = json.decode(response);

     products = data.map((item) {
      return ModelOfProduct(
        productName: item['productName'],
        image: item['image'],
        price: item['price'].toString(),
        rating: item['rating'].toString(),
        category: item['category'],
        description: item['description'],
      );
    }).toList();
     setState(() {

     });


  }



  }




