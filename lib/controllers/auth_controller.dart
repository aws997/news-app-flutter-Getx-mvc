
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvc/models/user.dart';
import 'package:getx_mvc/services/auth_service.dart';
import 'package:getx_mvc/utils/user_storage.dart';
import 'package:getx_mvc/views/screens/home.dart';
import 'package:getx_mvc/views/screens/login.dart';


class AuthController extends GetxController {

AuthService authService=AuthService();

RxBool isLoading=RxBool(false);

RxString userId=''.obs;
RxBool isLoggedIn =false.obs;



 @override
   void onInit() {
     
     super.onInit();
retriveuser();

   }

 
  

void login(String email, String password) async{

isLoading.value=true;
String _userid =await authService.login( email: email, password: password);
isLoading.value=false;


if(_userid.isNotEmpty) {
  isLoggedIn.value=true;
  userId.value=_userid;
  Get.offAll(()=>HomeScreen());
  
  
  }

   


}


void register(String email, String password, String username) async{
  
  isLoading.value=true;

bool success = await authService.register( email: email, password: password, username: username);
isLoading.value=false;

if(success) Get.offAll(()=>LoginScreen());
  
  
}

void logout(){
UserStorage().removeUser();
userId.value='';
isLoggedIn.value=false;
Get.snackbar("Logout","You have been logged out successfuly");
// Get.offAll(()=> LoginScreen());
}

void retriveuser(){
  UserStorage().getUser().then((value) {
if(value!=null)
{
  userId.value=value['id']??'';
  if(userId.value.isNotEmpty)
  isLoggedIn.value=true;
  
}
  });
}

}