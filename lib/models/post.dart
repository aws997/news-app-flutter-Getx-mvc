class PostModel{


late String title,body,id,image,userId,username;
late List<String> likes;
bool liked=false;
late DateTime createdAt;

PostModel.fromMap(Map<String,dynamic> map)
{
  
  this.id=map['_id'];
  this.body=map['body'];
  this.title=map['title'];
  this.image=map['img']??"";
  this.userId= map['userId'];
  this.username= map['username'];
  this.likes=[...map['likes']];
  this.liked=map['liked']??false;
  this.createdAt=DateTime.parse(map['createdAt']);

}
} 

