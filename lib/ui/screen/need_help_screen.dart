import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawa_platform/helper/common.dart';
import 'package:nawa_platform/repository/portal_repository.dart';

class NeedHelpScreen extends StatefulWidget {

  @override
  _NeedHelpScreenState createState() => _NeedHelpScreenState();
}

class _NeedHelpScreenState extends State<NeedHelpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  bool loading = false;

  _subscribe(BuildContext context) async {

    final portalService = RepositoryProvider.of<PortalRepository>(context);
    var email = emailController.text ?? "";
    var name = nameController.text ;
    var phone = phoneController.text ;
    var text = textController.text ;
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

    if(name.isEmpty || phone.isEmpty || text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: new Text("إملىء جميع الحقول")));
    }else{
      if(emailValid){
        setState(() {
          loading = true;
        });
        await portalService.needHelp(context,
            {
          "ID": "null",
          "FullName": name,
          "Mobile": phone,
          "Email": email,
          "Msg": text
        }).then(
                (value) {
              if(value != null){
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: new Text("تم الإرسال بنجاح"), backgroundColor: Colors.green,));
              }else{
                setState(() {
                  loading = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: new Text("فشلت عمليه الإرسال"), backgroundColor: Colors.redAccent,));
              }
            });
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: new Text("أدخل بريد إلكتروني صالح")));
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: Common().myAppBar(context : context, ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("تحتاج إلى مساعدة؟", style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),),
              SizedBox(height: 10,),
              Common().textField(controller: nameController, hint: "الإسم كامل"),
              Common().textField(controller: phoneController, hint: "رقم التواصل"),
              Common().textField(controller: emailController, hint: "البريد الإلكتروني", email: true),
              Common().textField(controller: textController, hint: "نص الرسالة", mulit: true),
              if(!loading)
              GestureDetector(
                onTap: () {
                  _subscribe(context);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
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
                      'إرسال الرسالة',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              if(loading)
               Center(child: CircularProgressIndicator(),)
            ],
          ),
        ),
      ),
    );
  }
}
