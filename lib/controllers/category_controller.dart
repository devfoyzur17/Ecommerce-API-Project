import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/category_model.dart';

class CategoryController extends GetxController {
  var isLoading = false.obs;
  List categoryList = <String>[].obs;

  @override
  void onInit() {
    getAllCategory();
    super.onInit();
  }

  void getAllCategory() async {
    isLoading(true);
    try {
      var response = await http
          .get(
        Uri.parse('https://fakestoreapi.com/products/categories'),
      )
          .then((value) {
        if (value.statusCode == 200) {
          categoryList = categoryModelFromJson(value.body);
          print(categoryList);
        } else {
          'vul hoise ${value.statusCode}';
        }
      });
    } catch (error) {
      rethrow;
    } finally {
      isLoading(false);
    }
  }
}
