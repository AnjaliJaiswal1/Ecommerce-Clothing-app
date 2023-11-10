import 'package:ecommerce_clothing_app/Hive/product_cart_hive.dart';
import 'package:ecommerce_clothing_app/helper/constants.dart';
import 'package:ecommerce_clothing_app/main.dart';
import 'package:ecommerce_clothing_app/screens/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WhislistScreen extends StatelessWidget {
  const WhislistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
        valueListenable: whislistBox.listenable(),
        builder: (context, wishlists, _) {
          //list of all products in cart
          List productsItems = wishlists.values.toList();
          int productLength = wishlists.length;

          return Scaffold(
            appBar: AppBar(
              title: const Text("Wishlist screen"),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton.icon(
                      onPressed: productLength ==
                              0 //if there is not product in cart disable delete all button
                          ? null
                          : () {
                              Get.defaultDialog(
                                  titlePadding: const EdgeInsets.all(16),
                                  radius: 16,
                                  cancel: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  confirm: TextButton(
                                    onPressed: () {
                                      wishlists.clear().then(
                                          (value) => Navigator.pop(context));
                                    },
                                    child: const Text(
                                      "Ok",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  content: const Text(""),
                                  title: "Remove all $productLength items?");
                            },
                      icon: const Icon(Icons.delete_outline),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor),
                      label: const Text("Remove All")),
                )
              ],
            ),
            body: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  ProductModel product = productsItems[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Dismissible(
                      key: Key(product.id.toString()),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20.0),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      onDismissed: (direction) {
                        wishlists.delete(product.id);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Deleted'),
                        ));
                      },
                      child: ListTile(
                        onTap: () {
                          Get.to(() => ProductDetailPage(
                              product: product, recommendedProducts: []));
                        },
                        contentPadding: const EdgeInsets.all(16),
                        tileColor: Colors.white,
                        leading: Image.network(
                          product.image,
                          fit: BoxFit.fill,
                        ),
                        title: Text(
                          product.title,
                          style: const TextStyle(fontSize: 16),
                        ),
                        subtitle: Text(
                          "\$${product.price}",
                          style: const TextStyle(
                              color: primaryColor, fontSize: 16),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: wishlists.length),
          );
        });
  }
}
