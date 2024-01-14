
import 'package:store_app/helper/httpHelper.dart';

class AllCategoriesServices{
  Future<dynamic> getAllCategories()async{
    List<dynamic> data=  await Api().get(url: "https://fakestoreapi.com/products/categories");

    return data;
    }

  }
