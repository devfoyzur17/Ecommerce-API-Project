
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              UserAccountsDrawerHeader(
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child:  Image.asset(
                          "assets/images/man.jpg",
                          fit: BoxFit.cover,
                        )




                ),
                accountName: Text("Foyzur Rahaman"),



                accountEmail: Text("foyzur17@gmail.com"),



              ),

              ListTile(
                onTap: (){

                },
                leading:  Icon(Icons.home_sharp),
                title: Text("Home"),
              ),
              ListTile(
                leading:  Icon(Icons.account_circle
                ),
                onTap: (){

                },
                title: Text("Profile"),
              ),
              ListTile(
                onTap: () {

                },
                leading:  Icon(Icons.shopping_bag_outlined),
                title: Text("Order"),
              ),





              ListTile(
                leading:  Icon(Icons.location_on
                ),
                onTap: (){
                  _makeCurrentLocation();
                },
                title: Text("Shop Location"),
              ),

              ListTile(
                leading:  Icon(Icons.settings_outlined
                ),
                title: Text("Setting"),
              ),
              Divider(),


              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      primary: Colors.purple,
                      side: BorderSide(color: Colors.purple),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  onPressed: (){


                  }, child: Text("LogOut"))






            ],

          ),
    );
  }
  void _makeCurrentLocation() async {
    final url = Uri.parse("geo:0,0?q=Mirpur10");
    if (url != null) {
      launchUrl(url);
    } else {
      throw "Something wrong";
    }
  }




}