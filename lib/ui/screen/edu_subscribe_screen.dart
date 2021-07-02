import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nawa_platform/helper/AppColors.dart';
import 'package:nawa_platform/helper/common.dart';

class EduSubscribeScreen extends StatefulWidget {

  @override
  _EduSubscribeScreenState createState() => _EduSubscribeScreenState();
}

class _EduSubscribeScreenState extends State<EduSubscribeScreen> {
  final TextEditingController controller = TextEditingController();

  int _radioValue1 = -1;
  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset('assets/images/education.png', width: MediaQuery.of(context).size.width * 0.7,)),
                SizedBox(height: 15,),
                Common().textField(controller: controller, hint: "البريد الإلكتروني", email: true),
                Common().textField(controller: controller, hint: "كلمة المرور هنا", obscure: true),
                SizedBox(height: 15,),
                Text("إختار المرحلة العمرية:", style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.TextColorPrimary)),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Radio(
                      value: 0,
                      groupValue: _radioValue1,
                      onChanged: _handleRadioValueChange1,
                    ),
                    new Text(
                      'رعاية',
                      style: new TextStyle(fontSize: 16.0),
                    ),

                    new Radio(
                      value: 1,
                      groupValue: _radioValue1,
                      onChanged: _handleRadioValueChange1,
                    ),
                    new Text(
                      'بستان',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),

                    new Radio(
                      value: 2,
                      groupValue: _radioValue1,
                      onChanged: _handleRadioValueChange1,
                    ),
                    new Text(
                      'تمهيدي',
                      style: new TextStyle(fontSize: 16.0),
                    ),

                  ],
                ),
                SizedBox(height: 15,),
                GestureDetector(
                  onTap: () {},
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

              ],
            ),
          ),
        ),
      ),
    );
  }
}

