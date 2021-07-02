import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawa_platform/helper/common.dart';
import 'package:nawa_platform/repository/portal_repository.dart';

class SubscribeScreen extends StatefulWidget {

  @override
  _SubscribeScreenState createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> {
  final TextEditingController _email = TextEditingController();
  bool loading = false;

  _subscribe(BuildContext context) async {
    setState(() {
      loading = true;
    });
    final portalService = RepositoryProvider.of<PortalRepository>(context);
    var email = _email.text ?? "";
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if(emailValid){
      await portalService.subscriptions(context, {"Email" : email}).then(
              (value) {
                if(value != null){
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: new Text("تم الإشتراك بنجاح"), backgroundColor: Colors.green,));
                }else{
                  setState(() {
                    loading = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: new Text("فشلت عمليه الإشتراك"), backgroundColor: Colors.redAccent,));
                }
              });
    }else{
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: new Text("أدخل بريد إلكتروني صالح")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Image.asset('assets/images/store.png', width: MediaQuery.of(context).size.width * 0.7,)),
                SizedBox(height: 10,),
                Text("إشترك في ", style: TextStyle(fontWeight: FontWeight.w600),),
                SizedBox(height: 10,),
                Text("نشرتنا الإخبارية", style: TextStyle(fontSize: 22 ,fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),),
                SizedBox(height: 10,),
                Text("إنضم الى قائمتنا البريدة لتصلك أخر الأخبار والتحديثات من فريقنا", style: TextStyle(fontWeight: FontWeight.w600,),textAlign: TextAlign.center,),
                SizedBox(height: 15,),
                Common().textField(controller: _email, hint: "البريد الإلكتروني", email: true),
                if(!loading)
                GestureDetector(
                  onTap: () {
                    _subscribe(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(5, 5),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'الإشتراك',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                if(loading)
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
