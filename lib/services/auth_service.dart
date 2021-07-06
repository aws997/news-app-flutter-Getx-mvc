import 'dart:convert';
import 'package:get/get.dart';
import 'package:getx_mvc/models/user.dart';
import 'package:getx_mvc/utils/api_utils.dart';
import 'package:getx_mvc/utils/user_storage.dart';
import 'package:http/http.dart' as http;

class AuthService{

Map<String,String> headers={
  "content-type": 'application/json'
};

UserStorage tokenStorage=UserStorage();

Future<bool> register({required String email,required String password,required String username}) async {

final _body=jsonEncode({
'username':username,
'email':email,
'password':password
});
try{
http.Response response=await http.post(Uri.parse(ApiUtils.registerAPI), headers: headers,body:_body );

if(response.statusCode!=201){

Get.snackbar("Error", response.body,);
return false;
}

// var data=jsonDecode(response.body);


return true;
}catch(e){
  print(e);
return false;
}

}

Future<String> login({required String email,required String password})async{

Map<String,dynamic> _body={

'email':email,
'password':password
};
try{
http.Response response=await http.post(Uri.parse(ApiUtils.loginAPI),
 headers: headers,body:jsonEncode(_body));
print(response.body);
if(response.statusCode!=200){

  Get.snackbar("Error", response.body,);
  print(response.body);
return '';
}


var data=jsonDecode(response.body);

await tokenStorage.saveUser(data['token'],data['id']);
return data['id'];
}catch(e){
  print(e);
return '';
}

}
}

class APIUtil {
}