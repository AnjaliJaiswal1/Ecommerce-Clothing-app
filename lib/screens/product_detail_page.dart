import 'package:ecommerce_clothing_app/Hive/product_cart_hive.dart';
import 'package:ecommerce_clothing_app/helper/widgets.dart';
import 'package:ecommerce_clothing_app/screens/cart_items_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../helper/constants.dart';
import '../main.dart';

class ProductDetailPage extends StatelessWidget {
  final List<ProductModel> recommendedProducts;

  final ProductModel product;
  const ProductDetailPage(
      {super.key, required this.product, required this.recommendedProducts});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
        valueListenable: whislistBox.listenable(),
        builder: (context, whislists, _) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => Get.back(),
              ),
              actions: [
                IconButton(
                  icon: whislists.values.contains(product)
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.pink,
                          size: 28,
                        )
                      : const Icon(
                          Icons.favorite_outline,
                          size: 28,
                        ),
                  onPressed: () {
                    if (whislists.values.contains(product)) {
                      whislists.delete(product.id);
                    } else {
                      whislists.put(product.id, product);
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.share_outlined),
                  onPressed: () {},
                ),
                // IconButton(
                //   icon: const Icon(Icons.shopping_bag_outlined),
                //   onPressed: () {},
                // ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: product.id,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          height: 300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          width: Get.width,
                          child: Image.network(
                            product.image,

                            // fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        product.title,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                "4.9 Ratings",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                          Text(
                            "2.3k+ Reviews",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            "2.9k+ sold",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        product.description,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const Text(
                        "Recommended Products",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 300,
                                  crossAxisSpacing: 16,
                                  childAspectRatio: 0.5,
                                  mainAxisSpacing: 12,
                                  crossAxisCount: 2),
                          itemCount: recommendedProducts.length,
                          itemBuilder: (ctx, index) {
                            return ProductContainer(
                              product: recommendedProducts[index],
                              recommendedProducts: recommendedProducts,
                            );
                          })
                    ]),
              ),
            ),
            bottomNavigationBar: ValueListenableBuilder<Box>(
                valueListenable: cartItemBox.listenable(),
                builder: (context, cartitems, _) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    height: 100,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Total Price",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            Text(
                              "\$${product.price}",
                              style: const TextStyle(
                                  fontSize: 22,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        ElevatedButton.icon(
                            onPressed: () {
                              if (cartitems.keys.contains(product.id)) {
                                Get.to(() => const CartScreen());
                              } else {
                                //Here i am fetching data from fakestore api so data wont have count. In your own ecommerce make model with count so you donot have to store items in map form
                                Map p = {'count': 1, 'product': product};
                                cartitems.put(product.id, p);
                              }
                            },
                            icon: const Icon(Icons.shopping_bag_outlined),
                            label: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 8),
                              child: Text(cartitems.keys.contains(product.id)
                                  ? "Go to cart"
                                  : "Add to Cart"),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                            ))
                      ],
                    ),
                  );
                }),
          );
        });
  }
}
