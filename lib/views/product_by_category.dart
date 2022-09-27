import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductByCategory extends StatelessWidget {
  const ProductByCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selected Category"),
      ),
    );
  }
}
