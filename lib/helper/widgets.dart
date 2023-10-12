import 'dart:developer';

import 'package:ecommerce_clothing_app/Hive/product_cart_hive.dart';
import 'package:ecommerce_clothing_app/helper/constants.dart';
import 'package:ecommerce_clothing_app/main.dart';
import 'package:ecommerce_clothing_app/screens/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class IconContainer extends StatelessWidget {
  final String text;
  final Widget icon;
  final void Function()? onPressed;
  const IconContainer(
      {super.key,
      required this.icon,
      required this.onPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[100],
            ),
            height: 45,
            width: 45,
            child: Center(
              child: IconButton(
                icon: icon,
                color: Colors.grey,
                onPressed: onPressed,
                iconSize: 22,
              ),
            )),
        const SizedBox(
          height: 6,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}

class ProductContainer extends StatelessWidget {
  final List<ProductModel> recommendedProducts;
  final ProductModel product;

  const ProductContainer(
      {super.key, required this.product, required this.recommendedProducts});

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / 2;
    return ValueListenableBuilder<Box>(
        valueListenable: whislistBox.listenable(),
        builder: (context, whislists, _) {
          return InkWell(
            onTap: () => Get.to(() => ProductDetailPage(
                  recommendedProducts: recommendedProducts,
                  product: product,
                )),
            child: Stack(children: [
              Container(
                width: widthValue,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: product.id,
                      child: Image.network(
                        product.image,
                        height: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.category.capitalize!,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            product.title,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Price : \$${product.price}",
                            style: const TextStyle(
                                fontSize: 18,
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  right: 2,
                  top: 2,
                  child: IconButton(
                      onPressed: () {
                        if (whislists.values.contains(product)) {
                          whislists.delete(product.id);
                        } else {
                          whislists.put(product.id, product);
                        }
                      },
                      icon: whislists.values.contains(product)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.pink,
                              size: 28,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              size: 28,
                            )))
            ]),
          );
        });
  }
}
