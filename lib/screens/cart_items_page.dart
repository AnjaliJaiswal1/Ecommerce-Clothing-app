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
          //list of all products in cart
          List productsItems = cartItems.values.toList();
          int productLength = cartItems.length;
          num totalPrice = 0;
          for (var element in productsItems) {
            num count = element['count'];
            totalPrice = totalPrice + element['product'].price * count;
          }
          return Scaffold(
              appBar: AppBar(
                title: const Text("My Cart"),
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
                                          cartItems.clear().then((value) =>
                                              Navigator.pop(context));
                                        },
                                        child: const Text("Ok")),
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
                    ProductModel product = productsItems[index]['product'];
                    int count = productsItems[index]['count'];

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
                          cartItems.delete(product.id);
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
                            trailing: SizedBox(
                              width: 120,
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: count <= 1
                                          ? null
                                          : () {
                                              count--;
                                              var p = {
                                                'count': count,
                                                'product': product
                                              };
                                              cartItems.put(product.id, p);
                                            },
                                      icon: const Icon(Icons.remove)),
                                  Container(
                                    color: Colors.grey,
                                    height: 24,
                                    width: 24,
                                    child:
                                        Center(child: Text(count.toString())),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        count++;
                                        var p = {
                                          'count': count,
                                          'product': product
                                        };
                                        cartItems.put(product.id, p);
                                      },
                                      icon: const Icon(Icons.add)),
                                ],
                              ),
                            )),
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
                          "\$$totalPrice",
                          style: const TextStyle(
                              fontSize: 22,
                              color: primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                        onPressed: productLength == 0 ? null : () {},
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
