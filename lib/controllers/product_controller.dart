import 'dart:convert';

import 'package:ecommerce_api_project/models/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  ProductModel? productModel;
  final allProductList = <ProductModel>[].obs;

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
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
}
