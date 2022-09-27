import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
