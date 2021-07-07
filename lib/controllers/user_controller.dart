
import 'package:get/get.dart';
import 'package:getx_mvc/models/user.dart';
import 'package:getx_mvc/services/user_service.dart';



class UserController extends GetxController {

UserService userService=UserService();

RxBool isLoading=RxBool(false);
Rx<UserModel>? user;




 @override
   void onInit() {
     
     super.onInit();
   }

 
  








getUser(String userId)async{
 if(userId.length<1)return;
 
 isLoading.value=true;
 UserModel? _user= await userService.getUser(userId);
 if(_user!=null) user=Rx<UserModel>(_user);
 isLoading.value=false;

}

}