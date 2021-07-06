import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvc/controllers/auth_controller.dart';
import 'package:getx_mvc/views/screens/login.dart';

class Profile extends StatefulWidget {


  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
      AuthController authController =Get.put(AuthController());

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
    Obx(() 
       {
         if(authController.userId.isNotEmpty)
         return ElevatedButton(onPressed: (){
authController.logout();
        },
         child: Text("LOGOUT"));
         else return ElevatedButton(onPressed: (){
Get.to(()=> LoginScreen());
        },
         child: Text("LOGIN"));
         })
      ],
    );
  }
}