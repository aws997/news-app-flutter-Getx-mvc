class ApiUtils{
  static String hostAPI="http://10.0.2.2:3000/api";
  static String host="http://10.0.2.2:3000";

  static String loginAPI= hostAPI + "/auth/login";
  static String registerAPI= hostAPI + '/auth/register';

  static String homeAPI= hostAPI + '/posts/home/all';
  static String createPostAPI= hostAPI + '/posts';
  static String likePost= hostAPI + '/posts/like';
}