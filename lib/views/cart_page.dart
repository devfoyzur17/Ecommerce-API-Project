import 'package:ecommerce_api_project/controllers/cert_controller.dart';
import 'package:ecommerce_api_project/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);
  List<ProductModel> cartList = Get.arguments;

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart List"),
      ),
      body: Obx(()=>
         Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: cartList.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartList[index];
                      return CartItem(
                        productModel: cartItem,
                          onDelete: () {
                            cartController.removeFromTheCart(cartItem);
                          }
                      );
                    })),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(()=>
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal:",
                          style:
                              TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        Text(
                          "৳${cartController.totalPrice.toStringAsFixed(2)}",
                          style:
                              TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              // Navigator.pushNamed(context, CheckoutPage.routeName);
                            },
                            child: const Text("Checkout"))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
