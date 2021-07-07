import 'package:get/get.dart';
import 'package:getx_mvc/utils/user_storage.dart';

class HomeController extends GetxController {
 
  var currentIndex = 0.obs;

  
  @override
  void onInit() {
    
    UserStorage().getUser();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }



  void setIndex(ind){
currentIndex.value=ind;
  }
}