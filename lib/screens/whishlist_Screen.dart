import 'package:ecommerce_clothing_app/Hive/product_cart_hive.dart';
import 'package:ecommerce_clothing_app/helper/constants.dart';
import 'package:ecommerce_clothing_app/main.dart';
import 'package:ecommerce_clothing_app/screens/cart_items_page.dart';
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
                                  cancel: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Cancel")),
                                  confirm: TextButton(
                                      onPressed: () {
                                        wishlists.clear().then(
                                            (value) => Navigator.pop(context));
                                      },
                                      child: const Text("Ok")),
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
                        trailing: ElevatedButton(
                            onPressed: () {
                              if (wishlists.keys.contains(product.id)) {
                                Get.to(() => const CartScreen());
                              } else {
                                //Here i am fetching data from fakestore api so data wont have count. In your own ecommerce make model with count so you donot have to store items in map form
                                wishlists.put(product.id, product);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor),
                            child: Text(wishlists.values.contains(product)
                                ? "Go to cart"
                                : "Add to cart")),
                      ),
                    ),
                  );
                },
                itemCount: wishlists.length),
          );
        });
  }
}
