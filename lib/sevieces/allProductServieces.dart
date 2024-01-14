import 'package:store_app/helper/httpHelper.dart';

import '../models/productModel.dart';

class GetAllProduct {
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> data =
        await Api().get(url: "https://fakestoreapi.com/products");

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}


