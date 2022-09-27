import 'package:ecommerce_api_project/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductDetailsPage({Key? key}) : super(key: key);

  final ProductModel product = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Product Details"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(20),
                    //  color: Color(0xffEFEFEF),
                    color: Colors.white,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/placeholder.jpg',
                      image: product.image,
                      fadeInCurve: Curves.bounceInOut,
                      fadeInDuration: const Duration(seconds: 3),
                      width: MediaQuery.of(context).size.width - 100,
                      height: MediaQuery.of(context).size.height / 3.2,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: Obx(() => IconButton(
                          onPressed: () {
                            product.isFavorite.toggle();
                          },
                          icon: Icon(
                            product.isFavorite.value
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: Colors.purple,
                          ))))
                ],
              ),
              Divider(),
              Center(
                child: RatingBar.builder(
                  itemSize: 30,
                  // ignoreGestures: true,
                  initialRating: product.rating.rate,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    //print(rating);
                  },
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  product.title,
                  maxLines: 3,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  '৳${product.price}',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: RichText(
                  text: TextSpan(
                      text: "Description: ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: product.description,
                          style: TextStyle(
                              color: Color(0xff666666),
                              fontWeight: FontWeight.normal),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ));
  }
}
