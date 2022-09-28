import 'package:ecommerce_api_project/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/product_item.dart';
import '../widgets/show_loading.dart';

class ProductByCategory extends StatelessWidget {
  ProductByCategory({Key? key}) : super(key: key);
  final productController = Get.put(ProductController());
  final String catName = Get.arguments;
  @override
  Widget build(BuildContext context) {

    productController.getProductsByCategory();

    return Scaffold(
      appBar: AppBar(
        title: Text("Selected Category"),
      ),
      body: Obx(() => productController.isCatLoading.value
          ? Center(child: ShowLoading())
          : GridView.builder(
              shrinkWrap: true,
              primary: false,
              //   physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2 / 3,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15),
              itemCount: productController.productListByCategory.length,
              itemBuilder: (context, index) {
                final product = productController.productListByCategory[index];

                return ProductItem(product: product);
              })),
    );
  }
}
