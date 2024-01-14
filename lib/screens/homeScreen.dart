import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/models/productModel.dart';
import 'package:store_app/screens/SelectedItemsScreen.dart';

import '../sevieces/allProductServieces.dart';
import '../widgets/customCard.dart';
import 'addProduct.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static String id = "home page";
 static List<ProductModel> selectedProducts = [];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AddProductScreen.id);
            },
            icon: const Icon(Icons.add_to_photos_outlined),
          ),
          title: const Text("New Trend"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, SelectedItemScreen.id);
                },
                icon: const Icon(Icons.shopping_cart))
          ],
        ),

        body: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 100),
            child: FutureBuilder<List<ProductModel>>(
              future: GetAllProduct().getAllProduct(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductModel> products = snapshot.data!;
                  return GridView.builder(
                      physics:  BouncingScrollPhysics(),
                      itemCount: products.length,
                      clipBehavior: Clip.none,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.3,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 70.0),
                      itemBuilder: (context, index) {
                        return CustomCard(
                          productModel: products[index],
                        );
                      });
                } else {
                  print(snapshot.error);
                  return Center(
                    child: CircularProgressIndicator()
                  );
                }
              },
            )));
  }
}
