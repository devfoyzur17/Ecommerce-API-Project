import 'package:ecommerce_api_project/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<ProductModel> cartProductList = <ProductModel>[].obs;

  int getCount() => cartProductList.length;

  double get totalPrice =>
      cartProductList.fold(0, (sum, item) => sum + item.price);

  void removeFromTheCart(ProductModel productModel) {
    cartProductList.remove(productModel);
  }

  void addToCart(ProductModel productModel) {
    cartProductList.add(productModel);
  }
}
