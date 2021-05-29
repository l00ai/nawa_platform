import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawa_platform/block/authentication/authentication_bloc.dart';
import 'package:nawa_platform/helper/AppColors.dart';
import 'package:nawa_platform/model/title.dart' as titl ;
import 'package:nawa_platform/model/title_response.dart';

class SplashScreen extends StatefulWidget {
  final TitleResponse titles;
  SplashScreen({this.titles});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  AuthenticationBloc _authBloc ;
  titl.Title _title ;

  @override
  void initState() {
    _title = widget.titles.titles.firstWhere((element) => element.id == "NawaPlatform") ;
    _authBloc = BlocProvider.of<AuthenticationBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _authBloc.add(UserLoggedIn(context: context));
        },
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(12.0)),
        child: Icon(Icons.arrow_back_ios_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 35.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/nawa-logo.png", height: 55.0,),
                      SizedBox(width: 15.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("جمعية نوى للثقافة والفنون", style: TextStyle(fontFamily: 'Almarai')),
                          SizedBox(height: 5.0,),
                          Text("Nawa for Culture and Arts Association", style: TextStyle(fontFamily: 'Almarai',)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30.0,),
                  Image.asset("assets/images/splash-logo.png", height: 250.0,),
                  SizedBox(height: 30.0,),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(25.0), topLeft: Radius.circular(25.0)),
                        color: AppColors.bgSplashScreenColor,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_title.title ?? "منصة نوى الالكترونية", style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold, fontSize: 18.0),),
                          Text(_title.name ?? "منصة نوى الإلكترونية مجموعة من المنصات تهتم بإثراء المحتوى العربي على الإنترنت وتسهل على الطلبة الوصول للمواد التعليمية عن طريق الإنترنت من أي مكان، وتعد هذه المنصة حلاً لمشكلة استئناف الدوام الوجاهي في ظل جائحة كورونا المستمرة إلى اليوم، وسنسعى جاهدين لتوفير كل ما يحتاجه الطالب عبر هذه المنصة.", style: TextStyle(color: AppColors.TextColorPrimary, fontSize: 15.0),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
