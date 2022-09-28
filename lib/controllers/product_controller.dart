import 'dart:convert';

import 'package:ecommerce_api_project/models/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  var isCatLoading = false.obs;
  var isDelLoading = false.obs;
  ProductModel? productModel;
  final allProductList = <ProductModel>[].obs;
  final productListByCategory = <ProductModel>[].obs;
  String category = "";

  void removeFromTheList(ProductModel productModel){
    allProductList.remove(productModel);
  }

  void setNewCategory(String catName) {
    category = catName;
    print("Category: $category");
  }

  void getAllProducts() async {
    isLoading(true);
    final uri = Uri.parse("https://fakestoreapi.com/products");

    try {
      final response = await get(uri).then((value) {
        if (value.statusCode == 200) {
          final jsonData = json.decode(value.body);
          for (var product in jsonData) {
            allProductList.add(ProductModel.fromJson(product));
          }
        }
      });
    } catch (error) {
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future deleteProduct(int productId) async {
    isDelLoading(true);
    final uri =
    Uri.parse("https://fakestoreapi.com/products/$productId");
    try{
      final response = await delete(uri);
      if(response.statusCode == 200){
        final map = json.decode(response.body);
        print("Delete successfully");

      }
    }catch(error){
      rethrow;
    }
    finally{
      isDelLoading(false);
    }
  }
  void getProductsByCategory() async {
    isCatLoading(true);
    productListByCategory.clear();
    final uri =
        Uri.parse("https://fakestoreapi.com/products/category/$category");
    try {
      final response = await get(uri);
      if (response.statusCode == 200) {
        final map = json.decode(response.body);
        for (var product in map) {
          productListByCategory.add(ProductModel.fromJson(product));
        }
      } else {
        print("Something wrong");
      }
    } catch (error) {
      rethrow;
    } finally {
      isCatLoading(false);
    }
  }
}
