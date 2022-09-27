import 'package:ecommerce_api_project/controllers/category_controller.dart';
import 'package:ecommerce_api_project/widgets/show_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/category_item.dart';

class AllCategoryPage extends StatelessWidget {
  AllCategoryPage({Key? key}) : super(key: key);
  final categoryController = Get.put(CategoryController());
  final List<String> catList = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Categories"),
      ),
      body: Obx(
        () => categoryController.isLoading.value
            ? Center(
                child: ShowLoading(),
              )
            : GridView.builder(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: catList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1 / 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) => CategoryItem(
                  catName: catList[index],
                ),
              ),
      ),
    );
  }
}
