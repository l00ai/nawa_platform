import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:nawa_platform/helper/user_preferences.dart';
import 'package:nawa_platform/model/letter.dart';
import 'package:nawa_platform/ui/screen/subscribe_screen.dart';

import 'AppColors.dart';

class Common {
  static final Common _singleton = Common._internal();

  factory Common() {
    return _singleton;
  }

  Common._internal();

//  أ، ب، ت، ث، ج، ح، خ، د، ذ، ر، ز، س، ش، ص، ض، ط، ظ، ع، غ، ف، ق، ك، ل، م، ن، هـ، و، ي،

  final listOfLetter = [
    Letter(id: "1", name: "أ"),
    Letter(id: "2", name: "ب"),
    Letter(id: "3", name: "ت"),
    Letter(id: "4", name: "ث"),
    Letter(id: "5", name: "ج"),
    Letter(id: "6", name: "ح"),
    Letter(id: "7", name: "خ"),
    Letter(id: "8", name: "د"),
    Letter(id: "9", name: "ذ"),
    Letter(id: "10", name: "ر"),
    Letter(id: "11", name: "س"),
    Letter(id: "12", name: "ش"),
    Letter(id: "13", name: "ص"),
    Letter(id: "14", name: "ض"),
    Letter(id: "15", name: "ط"),
    Letter(id: "16", name: "ع"),
    Letter(id: "17", name: "غ"),
    Letter(id: "18", name: "ف"),
    Letter(id: "19", name: "ق"),
    Letter(id: "20", name: "ك"),
    Letter(id: "21", name: "ل"),
    Letter(id: "22", name: "م"),
    Letter(id: "23", name: "ن"),
    Letter(id: "24", name: "ه"),
    Letter(id: "25", name: "و"),
    Letter(id: "26", name: "ي"),
  ];


  final listSearchType = [
    Letter(id: "1", name: "الحرف"),
    Letter(id: "2", name: "الإسم"),
    Letter(id: "3", name: "النوع"),
    Letter(id: "4", name: "الأكثر قراءة"),
  ];

  Future<Widget> downloadImage(String url) async{
    // try{
    //   return CachedNetworkImage(
    //     imageUrl: 'http://nawa.accessline.ps/Uploads/Images/'+url,
    //     height: 220.0,
    //     width: 170.0,
    //     useOldImageOnUrlChange: true,
    //     fit: BoxFit.cover,
    //     placeholder: (context, url) => Container(width: 170.0, height: 220.0,child: Center( child: Text("..."),),),
    //     errorWidget: (context, url, error) => Container(width: 170.0, height: 220.0,child: Center( child: Text("غير متوفر"),),),
    //   );
    // }on SocketException catch(e) {
    //   return Container(width: 170.0, height: 220.0,child: Center( child: Text("غير متوفر"),),) ;
    // } catch(e) {
    //   return Container(width: 170.0, height: 220.0,child: Center( child: Text("غير متوفر"),),) ;
    // }
    // return FadeInImage(
    //   image: NetworkImage('http://nawa.accessline.ps/Uploads/Images/'+url),
    //   placeholder: AssetImage("assets/images/placeholder.png"),
    //   height: 220.0,
    //   width: 170.0,
    //   imageErrorBuilder:
    //       (context, error, stackTrace) {
    //     return Image.asset(
    //         'assets/images/placeholder.png',
    //         fit: BoxFit.cover);
    //   },
    //   fit: BoxFit.cover,
    // );

    // return new FadeInImage(
    //   imageErrorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
    //     return Container(
    //       width: 170.0,
    //       height: 220.0,
    //       child: Image.asset("assets/images/placeholder.png", fit: BoxFit.cover,),
    //     );
    //   },
    //   placeholder: AssetImage("assets/images/placeholder.png"),
    //   image: CachedNetworkImageProvider('http://nawa.accessline.ps/Uploads/Images/'+url, ),
    //   placeholderErrorBuilder: (context, error, stackTrace) => Image.asset("assets/images/placeholder.png", width: 220.0, height: 170.0,),
    //   fit: BoxFit.cover,
    //   height: 220.0,
    //   width: 170.0,
    // );

    return Image.network(
      'http://nawa.accessline.ps/Uploads/Images/'+url,
      height: 220.0,
      width: 170.0,
      cacheHeight: 220,
      cacheWidth: 170,
      fit: BoxFit.cover,
      errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
        return  Image.asset("assets/images/placeholder.png", width: 170.0, height: 220.0, fit: BoxFit.cover);
      },
    );

    // return Image(
    //   height: 220.0,
    //   width: 170.0,
    //   fit: BoxFit.cover,
    //   image: NetworkImageWithRetry(
    //     'http://nawa.accessline.ps/Uploads/Images/'+url,),
    //   errorBuilder: (context, exception, stackTrack) => Image.asset("assets/images/placeholder.png",fit: BoxFit.cover, height: 220.0,
    //     width: 170.0, ),
    //   loadingBuilder: (context, exception, stackTrack) => Image.asset("assets/images/placeholder.png",fit: BoxFit.cover, height: 220.0,
    //     width: 170.0,),
    // );

  }

  Widget textField({controller, String hint, bool mulit = false, bool obscure = false, bool email = false}){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          color: AppColors.bgSplashScreenColor,
          borderRadius: BorderRadius.circular(7.0)),
      child: TextField(
        style: TextStyle(
          fontSize: 15.0,
        ),
        controller: controller,
        maxLines: mulit ? 5 : 1,
        minLines: mulit ? 5 : 1,
        textInputAction: TextInputAction.done,
        obscureText: obscure,
        keyboardType: !email ? TextInputType.text : TextInputType.emailAddress,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 8),
            hintText: hint,
            border: InputBorder.none),
      ),
    );
  }

  Widget myAppBar({context, GlobalKey<InnerDrawerState> innerDrawerKey, bool hasDrawer= false}) {
    UserPreferences userPref = UserPreferences();
    return AppBar(
      leading: hasDrawer ? IconButton(
        onPressed: () {
          innerDrawerKey.currentState.open();
        },
        icon: Image.asset("assets/icon/menu.png"),
      ) : IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_rounded),
      ),
      titleSpacing: 0.1,
      title: Row(
        children: [
          Image.asset(
            "assets/images/nawa-logo.png",
            height: 34.0,
          ),
          SizedBox(
            width: 7.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("جمعية نوى للثقافة والفنون",
                  style: TextStyle(
                      fontFamily: 'Almarai',
                      fontSize: 11.0,
                      fontWeight: FontWeight.w100)),
              SizedBox(
                height: 5.0,
              ),
              Text("Nawa for Culture and Arts Association",
                  style: TextStyle(
                      fontFamily: 'Almarai',
                      fontSize: 11.0,
                      fontWeight: FontWeight.w100)),
            ],
          )
        ],
      ),
      actions: [
        FutureBuilder<bool>(
          future: userPref.getSubscription(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.hasData){
              if(snapshot.data){
                return Container(
                  padding: EdgeInsets.only(bottom: 10, left: 10, top: 10),
                  child: OutlineButton(
                    child: Text("مشترك", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 14.0),),
                    borderSide: null,
                    highlightedBorderColor: Theme.of(context).accentColor,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(7.0)), onPressed: () {  },
                  ),
                );
              }else{
                return Container(
                  padding: EdgeInsets.only(bottom: 10, left: 10, top: 10),
                  child: OutlineButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => SubscribeScreen(),
                      ));
                    },
                    child: Text("إشتراك", style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.w400, fontSize: 14.0),),
                    borderSide: BorderSide(color: Theme.of(context).accentColor,),
                    highlightedBorderColor: Theme.of(context).accentColor,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(7.0)),
                  ),
                );
              }
            }

            return Container() ;
          },
        )
      ],
    );
  }

}