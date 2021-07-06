import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvc/utils/user_storage.dart';
import 'package:getx_mvc/views/screens/home.dart';
import 'package:getx_mvc/views/screens/login.dart';

void main() async {
  
  

  runApp(
    GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen()
    ));
}



