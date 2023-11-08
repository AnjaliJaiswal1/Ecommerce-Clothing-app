// ------flutter version: 3.13.3--------------

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_clothing_app/Hive/product_cart_hive.dart';
import 'package:ecommerce_clothing_app/controllers/services.dart';
import 'package:ecommerce_clothing_app/helper/constants.dart';
import 'package:ecommerce_clothing_app/helper/widgets.dart';
import 'package:ecommerce_clothing_app/screens/cart_items_page.dart';
import 'package:ecommerce_clothing_app/screens/whishlist_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

late Box cartItemBox;
late Box whislistBox;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Register the TaskAdapter
  Hive.registerAdapter(ProductModelAdapter());
  cartItemBox = await Hive.openBox(cartItemBoxName);
  whislistBox = await Hive.openBox(whislistItemBoxName);

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider<Services>(create: (_) => Services())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce Clothing App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 22),
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black)),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ProductModel>>(
          future: Services.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            List<ProductModel> products = snapshot.data!;
            return ValueListenableBuilder<Box>(
                valueListenable: cartItemBox.listenable(),
                builder: (context, cartItems, _) {
                  int numberOfCartItems = cartItems.length;
                  return Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: Get.height * 0.3,
                              width: Get.width,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 0.0),
                              child: CarouselSlider(
                                  items: [
                                    Image.asset(
                                      'assets/images/sale.jpg',
                                      fit: BoxFit.cover,
                                      height: Get.height * 0.3,
                                      width: Get.width,
                                    ),
                                    Image.asset(
                                      'assets/images/sale1.jpg',
                                      fit: BoxFit.cover,
                                      height: Get.height * 0.3,
                                      width: Get.width,
                                    ),
                                    Image.asset(
                                      'assets/images/sale2.jpg',
                                      fit: BoxFit.cover,
                                      height: Get.height * 0.3,
                                      width: Get.width,
                                    ),
                                    Image.asset(
                                      'assets/images/sale3.jpg',
                                      fit: BoxFit.cover,
                                      height: Get.height * 0.3,
                                      width: Get.width,
                                    ),
                                  ],
                                  options: CarouselOptions(
                                      autoPlay: true,
                                      height: 250,
                                      viewportFraction: 0.9)),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              color: Colors.white,
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconContainer(
                                      text: "Category",
                                      icon: const Icon(
                                        Icons.dashboard_outlined,
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconContainer(
                                      text: "Flight",
                                      icon: const Icon(
                                        Icons.flight_outlined,
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconContainer(
                                      text: "Bills",
                                      icon: const Icon(
                                        Icons.receipt_long_rounded,
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconContainer(
                                      text: "Data plan",
                                      icon: const Icon(
                                        Icons.dataset,
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconContainer(
                                      text: "Top Up",
                                      icon: const Icon(
                                        Icons.money,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                )
                              ]),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Best Sale Product",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold), 
                                  ),
                                  Text(
                                    "See more",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: 300,
                                          crossAxisSpacing: 12,
                                          childAspectRatio: 0.5,
                                          mainAxisSpacing: 12,
                                          crossAxisCount: 2,),
                                  itemCount: products.length,
                                  itemBuilder: (ctx, index) {
                                    List<ProductModel> recommendedProducts =
                                        products
                                            .where((element) =>
                                                element.category ==
                                                products[index].category)
                                            .toList();
                                    recommendedProducts.remove(products[index]);
                                    return ProductContainer(
                                      product: products[index],
                                      recommendedProducts: recommendedProducts,
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 36.0, left: 24, right: 24),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              flex: 4,
                              child: TextField(
                                autocorrect: false,
                                enableSuggestions: false,
                                controller: searchController,
                                decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      size: 26,
                                    ),
                                    hintText: "Search",
                                    constraints:
                                        const BoxConstraints(maxHeight: 40),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(
                                            color: Colors.grey)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(
                                            color: Colors.grey))),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: IconButton(
                                  onPressed: () {
                                    Get.to(() => const CartScreen());
                                  },
                                  icon: Badge(
                                    label: Text(numberOfCartItems.toString()),
                                    child: const Icon(
                                      Icons.shopping_bag_outlined,
                                      size: 32,
                                    ),
                                  )),
                            ),
                            Flexible(
                              flex: 1,
                              child: IconButton(
                                  onPressed: () {
                                    Get.to(() => const WhislistScreen());
                                  },
                                  icon: const Icon(
                                    Icons.favorite_outline,
                                    size: 32,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                });
          }),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          selectedFontSize: 18,
          selectedIconTheme: const IconThemeData(size: 30),
          selectedItemColor: primaryColor,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_offer_outlined), label: "Voucher"),
            BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: "Setting")
          ]),
    );
  }
}
