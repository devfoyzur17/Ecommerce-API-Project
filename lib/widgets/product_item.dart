import 'package:ecommerce_api_project/controllers/cert_controller.dart';
import 'package:ecommerce_api_project/controllers/product_controller.dart';
import 'package:ecommerce_api_project/models/product_model.dart';
import 'package:ecommerce_api_project/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  ProductItem({Key? key, required this.product}) : super(key: key);

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.productDetailsPage, arguments: product);
      },
      child: Card(
        elevation: 5,
        color: Color(0xfff2f2f2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: FadeInImage.assetNetwork(
                          image: product.image,
                          height: 90,
                          placeholder: "assets/images/photos.png",
                          fadeInCurve: Curves.bounceInOut,
                          fadeInDuration: const Duration(seconds: 2),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, right: 5),
                        child: Obx(
                          () => InkWell(
                              onTap: () {
                                product.isFavorite.toggle();
                              },
                              child: Icon(
                                  product.isFavorite.value
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: Colors.purple)),
                        ),
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
                    initialRating: product.rating.rate,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
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
                        fontSize: 14),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "৳${product.price}",
                        style: TextStyle(color: Colors.purple, fontSize: 14),
                      ),
                      InkWell(
                        onTap: () {
                         cartController.addToCart(product);
                        },
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 23,
                          color: Theme.of(context).primaryColor,
                        ),
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
    ;
  }
}
