import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:paw_care/core/app_colors.dart';
import 'package:paw_care/core/application_routes.dart';
import 'package:paw_care/models/model_of_product.dart';
import 'package:paw_care/presentation/home_screen/tabs/store_tab/widget/product_widget.dart';

class StoreTab extends StatefulWidget {
  const StoreTab ({super.key});


  @override
  State<StoreTab> createState() => _StoreTabState();
}


class _StoreTabState extends State<StoreTab> {
     List<ModelOfProduct> products =[];

  String selectedCategory = "All";

  List<String> get categories {
    final set = <String>{};
    for (final p in products) {
      if (p.category.trim().isNotEmpty) set.add(p.category.trim());
    }
    return ["All", ...set];
  }

  List<ModelOfProduct> get filteredProducts {
    if (selectedCategory == "All") return products;
    return products
        .where((p) =>
    p.category.trim().toLowerCase() ==
        selectedCategory.toLowerCase())
        .toList();
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFF0A263), Color(0xFFD9803A)],
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(padding: EdgeInsets.fromLTRB(20.w, 20.h, 0, 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(),
                  Text("Pet Store", style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                  ),),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Text("Everything your pet needs", style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),),
                    Spacer(),

                    InkWell(onTap: () => Navigator.pushNamed(context, ApplicationRoutes.cartScreen),
                        child: Icon(Icons.shopping_cart_outlined,color: Colors.white,)),
                      SizedBox(width:25.w,)


                    ],
                  ),
                  SizedBox(height: 14.h,),

                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: TextField(
                      decoration: InputDecoration(
                        hint: Text("Search products...",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            )
                        ),
                        prefixIcon: Icon(Icons.search,
                            color: Colors.white.withOpacity(0.9)),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.25),
                        contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none
                        ),


                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 14.h,),

                  SizedBox(
                    height: 40.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(right: 20.w),
                      itemCount: categories.length,
                      separatorBuilder: (_, __) => SizedBox(width: 10.w),
                      itemBuilder: (context, index) {
                        final c = categories[index];
                        final selected = c == selectedCategory;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = c;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            decoration: BoxDecoration(
                              color: selected
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              c,
                              style: TextStyle(
                                color: selected
                                    ? const Color(0xFFE9964F)
                                    : Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                ],
              ),


            ),
          ),
        ),

        // Banner
        Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 16.h),
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: AppColors.mintgreen,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("This Week", style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 12.sp,
                    ),),
                    SizedBox(height: 4.h,),
                    Text("Up to 30% Off", style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w800,
                    ),),
                    SizedBox(height: 4.h,),
                    Text("Selected pet food items", style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 13.sp,
                    ),),
                  ],
                ),
              ),
              Text("🐾", style: TextStyle(fontSize: 44.sp)),
            ],
          ),
        ),

        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12

            ),
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              return ProductWidget(model: filteredProducts[index],);
            },
          ),
        ),


      ],
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