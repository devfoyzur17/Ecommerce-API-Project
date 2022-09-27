import 'package:ecommerce_api_project/controllers/cert_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class CartItem extends StatelessWidget {
  final ProductModel productModel;
  final VoidCallback onDelete;
  CartItem({
    Key? key,
    required this.productModel,
    required this.onDelete
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Color(0xffffe6ff),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(0),
        clipBehavior: Clip.none,
        elevation: 3,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor.withOpacity(0.5)),
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                padding: EdgeInsets.all(10),
                child: Image.network(productModel.image),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      productModel.title,
                      maxLines: 1,
                      style: TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                    subtitle: Text("৳${productModel.price}"),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                height: 120,
                decoration: BoxDecoration(

                    // color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: ListTile(
                  title: FittedBox(
                    child: Text(
                      "৳${productModel.price}",
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                    ),
                  ),
                  subtitle: IconButton(
                      onPressed: onDelete,
                      icon: Icon(
                        Icons.delete,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
