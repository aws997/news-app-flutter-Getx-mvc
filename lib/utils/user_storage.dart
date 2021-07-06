import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class UserStorage{

// Create secure storage instance 
final storage = new FlutterSecureStorage();

//create classs singleton
static final UserStorage _userStorage=UserStorage._internal();

String? userId;

factory UserStorage(){
  return _userStorage;
}
  UserStorage._internal();
  saveUser(String token,String id) async {

await storage.write(key: "token", value: token);
await storage.write(key: "id", value: id);
userId=id;

  }
  Future<Map<String,String>?>getUser() async {
    Map<String,String> _user= await  storage.readAll();
    userId=_user['id'];
    print("getiing $_user");
    return _user;
  }

  

  removeUser() async {
await storage.deleteAll();
userId=null;
  }

}