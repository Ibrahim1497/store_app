import 'package:store_app/helper/httpHelper.dart';

import '../models/productModel.dart';

class AddProduct {
  Future<ProductModel> addProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
   Map<String,dynamic> data=await Api().post(url: "https://fakestoreapi.com/products", body: {
      "title": title,
      "price": price,
      "description": desc,
      "image: https": image,
      "category": category
    });
   return ProductModel.fromJson(data);
  }
}
