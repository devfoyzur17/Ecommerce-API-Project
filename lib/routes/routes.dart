import 'package:ecommerce_api_project/views/home_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String homeScreen = "/homeScreen";

  static var list = [GetPage(name: homeScreen, page: () =>  HomePage())];
}
