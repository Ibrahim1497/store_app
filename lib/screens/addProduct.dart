import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/screens/homeScreen.dart';
import 'package:store_app/sevieces/addProduct.dart';

import '../models/productModel.dart';
import '../sevieces/updateProduct.dart';
import '../widgets/button.dart';
import '../widgets/textFormField.dart';

class AddProductScreen extends StatefulWidget {
  AddProductScreen({super.key});
  static String id = "add product page";

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late ProductModel productModel;
  String? name, desc, price;
  late XFile image;
  bool isLoading = false;
  ImagePicker imagePicker = ImagePicker();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    CustomTextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "required field";
                        }
                      },
                      onChanged: (data) {
                        name = data;
                      },
                      labelText: "product name",
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "required field";
                        }
                      },
                      onChanged: (data) {
                        desc = data;
                      },
                      labelText: "description",
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "required field";
                        }
                      },
                      keyboardType: TextInputType.number,
                      onChanged: (data) {
                        price = data;
                      },
                      labelText: "price",
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  image = (await imagePicker.pickImage(
                                      source: ImageSource.camera))!;
                                  setState(() {});
                                  productModel.image = image as String;
                                },
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 40,
                                  color: Colors.blue,
                                )),
                            const Text(
                              "Camera",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  image = (await imagePicker.pickImage(
                                      source: ImageSource.gallery))!;
                                  setState(() {});
                                  productModel.image = image as String;
                                },
                                icon: Icon(
                                  Icons.browse_gallery,
                                  size: 40,
                                  color: Colors.blue,
                                )),
                            Text(
                              "Gallery",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                CustomBottom(
                    onTap: () async {
                      bool valid = formKey.currentState!.validate();
                      if (valid) {
                        isLoading = true;
                        setState(() {});
                        await add(productModel);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Add successfully")));

                        isLoading = false;
                        setState(() {});
                      } else {
                        Lottie.network(
                            "https://lottie.host/1197fed4-09c1-4253-8c82-6676a28ebdc0/gE9HtjP03I.json");
                      }
                      Navigator.pushNamed(context, HomeScreen.id);
                    },
                    bottomName: "Add Product",
                    bottomColor: Colors.black),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> add(ProductModel productModel) async {
    AddProduct().addProduct(
      title: name == null ? productModel.title : name!,
      price: price == null ? productModel.price.toString() : price!,
      desc: desc == null ? productModel.description : desc!,
      image: image.toString(),
      category: productModel.category,
    );
  }
}
