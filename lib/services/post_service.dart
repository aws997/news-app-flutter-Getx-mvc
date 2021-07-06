import 'dart:convert';

import 'package:getx_mvc/models/post.dart';
import 'package:getx_mvc/utils/api_utils.dart';
import 'package:getx_mvc/utils/user_storage.dart';
import 'package:http/http.dart' as http;


class PostService{

 Future<List<PostModel>> getPosts(int page)async{

   int limit=10;
   String uri=ApiUtils.homeAPI+'?page=$page&limit=$limit';
   
    http.Response response=await http.get(Uri.parse(uri));
print(response.body);
    if(response.statusCode==200)
    {
   var  parsedResponse=jsonDecode(response.body);
    print(response.body);
List<PostModel> posts=[];
for (var item in parsedResponse) {
  posts.add(PostModel.fromMap(item));
}
return posts;
    }else{
      print(response.body);
return [];
    }
  }


 
  Future<PostModel?> create({required Map<String, String> map,required String imagePath}) async{

var user =await UserStorage().getUser();
String? token=user?['token'];

if(token==null)return null;
Map<String,String> headers={
  "token":token,
  "content-type": 'multipart/form-data'
  };

    Uri _uri = Uri.parse(ApiUtils.createPostAPI);

    // http.MultipartRequest request = new http.MultipartRequest("POST", Uri.parse(ApiUtils.host+'/upload'));

    http.MultipartRequest request = new http.MultipartRequest("POST", _uri);
    request.files.add(await http.MultipartFile.fromPath('file', imagePath));
request.headers.addAll(headers);
request.fields.addAll(map);

http.StreamedResponse response = await request.send();
  //  http.Response response =await http.post(_uri, headers: headers
  //  ,body: jsonEncode(map));

   if(response.statusCode==201)
   {
      var  parsedResponse=jsonDecode(await response.stream.bytesToString());
      print(parsedResponse);
      return PostModel.fromMap(parsedResponse);
   }else
   {
     
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