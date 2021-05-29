import 'package:shared_preferences/shared_preferences.dart';


class UserPreferences {

  // Future<void> saveUser(UserProfile user) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   prefs.setString("user", json.encode(user.user));
  //   prefs.setString("token", user.accessToken);
  //
  // }

  Future<void> splashSeen(bool status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("splashSeen", status);
  }

  Future<bool> getSplashStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool status = prefs.getBool("splashSeen");
    if(status == null){
      return null ;
    }else{
      print(status);
      return status;
    }
  }

  // Future<User> getUser() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String user = prefs.getString("user");
  //   if(user == null){
  //     return null ;
  //   }else{
  //     print(json.decode(user));
  //     return User.fromJson(json.decode(user));
  //   }
  // }

  // Future<void> removeUser() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.remove("token");
  //   await prefs.remove("user");
  // }
  //
  // Future<String> getToken() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String token = prefs.getString("token");
  //   return token;
  // }

  // Future<String> getName(args) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String name = prefs.getString("name");
  //   return name;
  // }

  // Future<String> getPhone(args) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String phone = prefs.getString("phone");
  //   return phone;
  // }
}