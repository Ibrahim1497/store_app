import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/productModel.dart';
import 'package:store_app/sevieces/updateProduct.dart';
import 'package:store_app/widgets/button.dart';
import 'package:store_app/widgets/textFormField.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});
  static String id = "update page";

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? name, desc, image, price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Update product"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    CustomTextFormField(
                      onChanged: (data) {
                        name = data;
                      },
                      labelText: "product name",
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      onChanged: (data) {
                        desc = data;
                      },
                      labelText: "description",
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (data) {
                        price = data;
                      },
                      labelText: "price",
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      onChanged: (data) {
                        image = data;
                      },
                      labelText: "image",
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                CustomBottom(
                    onTap: () async{
                      isLoading = true;
                      setState(() {});
                      try {
                        await update(productModel);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Updated successfully")));
                      } catch (e) {
                        print(e.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    },
                    bottomName: "Update",
                    bottomColor: Colors.black),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> update(ProductModel productModel) async {
    UpdateProductServices().updateProduct(
      title: name == null ? productModel.title : name!,
      price: price == null ? productModel.price.toString() : price!,
      desc: desc == null ? productModel.description : desc!,
      image: image == null ? productModel.image : image!,
      category: productModel.category, id: productModel.id,
    );
  }
}
