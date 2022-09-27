import 'package:ecommerce_api_project/controllers/product_controller.dart';
import 'package:ecommerce_api_project/widgets/show_loading.dart';
import 'package:ecommerce_api_project/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1 / 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(5),
                  height: 75,
                  width: 78,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    child: FittedBox(
                        child: Text(
                      "men's clothing",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Color(0xffe6e6e6).withOpacity(0.5)),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.deepOrange.withOpacity(0.7), width: 1),
                      borderRadius: BorderRadius.circular(60)),
                ),
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

                        return InkWell(
                          onTap: () {},
                          child: Card(
                            elevation: 5,
                            color: Color(0xfff2f2f2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          Container(
                                            
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(5))),
                                            padding: EdgeInsets.all(20),
                                            alignment: Alignment.center,
                                            child: FadeInImage.assetNetwork(
                                              image: product.image,
                                              height: 90,
                                              placeholder:
                                                  "assets/images/photos.png",
                                              fadeInCurve: Curves.bounceInOut,
                                              fadeInDuration:
                                                  const Duration(seconds: 2),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, right: 5),
                                            child: InkWell(
                                                onTap: () {},
                                                child: Icon(
                                                    Icons.favorite_outline,
                                                    size: 20,
                                                    color: Color(0xff666666))),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Center(
                                      child: RatingBar.builder(
                                        itemSize: 20,
                                        //   ignoreGestures: true,
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 1.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          //print(rating);
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        product.title,
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, bottom: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "৳${product.price}",
                                            style: TextStyle(
                                                color: Color(0xff666666),
                                                fontSize: 12),
                                          ),
                                          Icon(
                                            Icons.shopping_cart_outlined,
                                            size: 20,
                                            color:
                                                Theme.of(context).primaryColor,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
