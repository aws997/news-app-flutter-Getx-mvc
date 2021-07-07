class ApiUtils{
  
  static String host="https://blog-appapi.herokuapp.com";
  static String hostAPI=host + "/api";
  // static String host="http://10.0.2.2:3000";

  static String loginAPI= hostAPI + "/auth/login";
  static String registerAPI= hostAPI + '/auth/register';

  static String homeAPI= hostAPI + '/posts/home/all';
  static String createPostAPI= hostAPI + '/posts';
  static String likePost= hostAPI + '/posts/like';

  static String getUser= hostAPI + '/users';
}