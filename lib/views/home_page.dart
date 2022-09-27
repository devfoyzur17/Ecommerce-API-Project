import 'package:ecommerce_api_project/controllers/product_controller.dart';
import 'package:ecommerce_api_project/widgets/category_item.dart';
import 'package:ecommerce_api_project/widgets/product_item.dart';
import 'package:ecommerce_api_project/widgets/show_loading.dart';
import 'package:ecommerce_api_project/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final productController = Get.put(ProductController());
  late ProductController productController;
  bool isFirst = true;

  @override
  void didChangeDependencies() {
    if (isFirst) {
      productController = Get.put(ProductController());
      _getData();

      isFirst = false;
    }

    super.didChangeDependencies();
  }

  _getData() async {
    try {
      productController.getAllProducts();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Choice"),
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSlider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        letterSpacing: 1),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "see all",
                      ))
                ],
              ),

              //todo This is category gridview section.....................

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1 / 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) => CategoryItem(),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Text(
                "All Products",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    letterSpacing: 1),
              ),
              SizedBox(
                height: 10,
              ),


              //todo This is product gridview section.....................

              Obx(() => productController.isLoading.value
                  ? ShowLoading()
                  : GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 2 / 3,
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: productController.allProductList.length,
                      itemBuilder: (context, index) {
                        final product = productController.allProductList[index];

                        return ProductItem(product: product);
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
