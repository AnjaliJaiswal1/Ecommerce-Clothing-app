import 'package:ecommerce_clothing_app/Hive/product_cart_hive.dart';
import 'package:ecommerce_clothing_app/helper/constants.dart';
import 'package:ecommerce_clothing_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
        valueListenable: cartItemBox.listenable(),
        builder: (context, cartItems, _) {
          List productsItems = cartItems.values.toList();
          int productLength = cartItems.length;
          num totalPrice = 0;
          cartItems.values.forEach(
            (element) {
              totalPrice = totalPrice + element.price;
            },
          );
          return Scaffold(
              appBar: AppBar(
                title: const Text("My Cart"),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                        onPressed: () {
                          Get.defaultDialog(
                              cancel: TextButton(
                                  onPressed: () {},
                                  child: const Text("Cancel")),
                              confirm: TextButton(
                                  onPressed: () {}, child: const Text("Ok")),
                              content: const Text(""),
                              title: "Delete all $productLength items?");
                        },
                        icon: const Icon(Icons.delete_outline),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor),
                        label: const Text("Delete All")),
                  )
                ],
              ),
              body: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    ProductModel product = productsItems[index];

                    // return Text("adfad");
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
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
                        trailing: IconButton(
                            icon: const Icon(Icons.delete_outline_outlined),
                            onPressed: () {
                              cartItems.delete(product.id);
                            }),
                      ),
                    );
                  },
                  itemCount: cartItems.length),
              bottomNavigationBar: Container(
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
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          "\$${totalPrice}",
                          style: const TextStyle(
                              fontSize: 22,
                              color: primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_bag_outlined),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 8),
                          child: Text("Checkout ($productLength)"),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                        ))
                  ],
                ),
              ));
        });
  }
}
