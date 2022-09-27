import 'package:ecommerce_api_project/views/all_category_page.dart';
import 'package:ecommerce_api_project/views/cart_page.dart';
import 'package:ecommerce_api_project/views/home_page.dart';
import 'package:ecommerce_api_project/views/product_details_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String homeScreen = "/homeScreen";
  static const String allCategoryScreen = "/allCategory";
  static const String productDetailsPage = "/productDetailsPage";
  static const String cartPage = "/cartPage";

  static var list = [
    GetPage(name: homeScreen, page: () =>  HomePage()),
    GetPage(name: allCategoryScreen, page: () =>  AllCategoryPage()),
    GetPage(name: productDetailsPage, page: () =>  ProductDetailsPage()),
    GetPage(name: cartPage, page: () =>  CartPage()),
  ];
}
