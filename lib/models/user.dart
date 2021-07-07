import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.username='',
        this.email,
        this.id,
        this.profilePic='',

        this.coverPic,
        this.followers = const [],
        this.following =const [],
        this.isAdmin,
        this.desc,
        this.city,
        this.country,
    });

    String username;
    String? email;
        String? id;

    String profilePic;
    String? coverPic;
    List<String> followers;
    List<String> following;
    bool? isAdmin;
    String? desc;
    String? city;
    String? country;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"],
        email: json["email"],
        profilePic: json["profilePic"],
        coverPic: json["coverPic"],
        followers: List<String>.from(json["followers"].map((x) => x)),
        following: List<String>.from(json["following"].map((x) => x)),
        isAdmin: json["isAdmin"],
        desc: json["desc"],
        city: json["city"],
        id: json["_id"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "profilePic": profilePic,
        "coverPic": coverPic,
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "following": List<dynamic>.from(following.map((x) => x)),
        "isAdmin": isAdmin,
        "desc": desc,
        "city": city,
        "country": country,
    };
}
