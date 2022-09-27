// ignore_for_file: sort_child_properties_last

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:flutter/material.dart'; 
 
class AppSlider extends StatelessWidget {
  const AppSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
 
      child: ImageSlideshow(
            width: double.infinity,
            height: 150,
            initialPage: 0,
            indicatorColor: Colors.deepOrange,
            indicatorBackgroundColor: Colors.grey,
            onPageChanged: (value) {
              debugPrint('Page changed: $value');
            },
            autoPlayInterval: 3000,
            isLoop: true,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/baner1.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/baner3.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/baner4.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15)
        ),
        
    );
    
    
  }
}