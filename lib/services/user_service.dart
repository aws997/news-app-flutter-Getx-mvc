import 'dart:convert';

import 'package:getx_mvc/models/user.dart';
import 'package:getx_mvc/utils/api_utils.dart';
import 'package:getx_mvc/utils/user_storage.dart';
import 'package:http/http.dart' as http;


class UserService{

 Future<UserModel?> getUser(String id)async{

   String uri=ApiUtils.getUser+'/$id';
   
    http.Response response=await http.get(Uri.parse(uri));
print(response.body);
    if(response.statusCode==200)
    {
   var  parsedResponse=jsonDecode(response.body);
   
UserModel user=UserModel.fromJson(parsedResponse);

return user;
    }else{
return null;
    }
  }


 




Future<bool> likePost(String id)async{

 
var user =await UserStorage().getUser();
String? token=user?['token'];

if(token==null)return false;
Map<String,String> headers={
  "token":token,
  "content-type": 'multipart/form-data'
  };

   String uri=ApiUtils.likePost+'/$id';
   
    http.Response response=await http.put(Uri.parse(uri),
    headers: headers);
print(response.body);
    if(response.statusCode==200)
    {
   

return true;
    }else{
     
return false;
    }
  }
}