import 'package:shared_preferences/shared_preferences.dart';


class UserPreferences {

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


  Future<void> subscription(bool status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("subscription", status);
  }


  Future<bool> getSubscription() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool status = prefs.getBool("subscription");
    if(status == null){
      return false ;
    }else{
      return status;
    }
  }

}