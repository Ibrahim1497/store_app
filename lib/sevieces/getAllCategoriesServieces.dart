
import 'package:store_app/helper/httpHelper.dart';

import '../models/productModel.dart';

class AllCategoriesServices{
  Future<dynamic> getAllCategories({required String categoryName})async{
    List<dynamic> data=
        await Api().get(url: "https://fakestoreapi.com/products/category/$categoryName");

    List<ProductModel> productList=[];
    for(int i =0; i<data.length;i++){
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
    }
  }
