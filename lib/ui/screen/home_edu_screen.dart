import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nawa_platform/helper/AppColors.dart';
import 'package:nawa_platform/helper/common.dart';
import 'package:nawa_platform/model/title.dart' as t;
import 'package:nawa_platform/ui/screen/school_curriculum.dart';
import 'package:nawa_platform/ui/widgets/radio_button.dart';
import 'package:nawa_platform/ui/widgets/wave_clipper.dart';

import 'edu_subscribe_screen.dart';

class HomeEduScreen extends StatefulWidget {
  final titles;

  HomeEduScreen({this.titles});

  @override
  _HomeEduScreenState createState() => _HomeEduScreenState();
}

class _HomeEduScreenState extends State<HomeEduScreen> {
  @override
  Widget build(BuildContext context) {
    // final portalService = RepositoryProvider.of<PortalRepository>(context);
    return Scaffold(
        backgroundColor: AppColors.bgSplashScreenColor,
        appBar: Common().myAppBar(context: context),
        body: _MainScreen(
          titles: widget.titles,
        )
        // BlocProvider<SliderBloc>(
        //   create: (context) => SliderBloc(portalService)..add(GetSliderData(context: context)),
        //   child: _MainScreen(titles: widget.titles,),
        // ),
        );
  }
}

class _MainScreen extends StatelessWidget {
  final List<t.Title> titles;

  _MainScreen({this.titles});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowGlow();
          return true;
        },
        child: _Body(
          titles: titles,
        ));
  }
}

class _Body extends StatefulWidget {
  final List<t.Title> titles;

  _Body({this.titles});

  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  final TextEditingController controller = TextEditingController();

  Widget categoryItem(String id, String image, String type) {
    var obj = widget.titles.firstWhere((element) => element.id == id);
    var name =
        obj.name.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), ' ') ??
            'لا يوجد نبذة';
    var title =
        obj.title.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), ' ') ??
            'لا يوجد عنوان';

    return InkWell(
      highlightColor: Color.fromRGBO(50, 50, 100, 0.1),
      borderRadius: BorderRadius.circular(13),
      onTap: () {
        if(type == "HeritagePlatform"){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EduSubscribeScreen(),
          ));
        }else if(type == "StoriesPlatForm"){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SchoolCurriculum(titles: widget.titles,),
          ));
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(4, 4), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              height: 200,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.TextColorPrimary,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  String title;
  String name;
  String mapTitle;
  String mapName;

  @override
  void initState() {
    super.initState();

    var obj = widget.titles
        .firstWhere((element) => element.id == 'EducationPlatForm');
    name = obj.name.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), ' ') ??
        'لا يوجد نبذة';
    title = obj.title.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), ' ') ??
        'لا يوجد عنوان';

    var obj2 = widget.titles
        .firstWhere((element) => element.id == 'Map');
    mapName = obj2.name.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), ' ') ??
        'لا يوجد نبذة';
    mapTitle = obj2.title.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), ' ') ??
        'لا يوجد عنوان';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(
                      top: 7.0, right: 25.0, left: 25.0, bottom: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                            color: AppColors.TextColorPrimary, fontSize: 13.0),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Row(
                  children: [
                    SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      "إذهب إلى",
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      "assets/icon/right-drawn-arrow.png",
                      height: 50.0,
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 25.0,
              ),
              categoryItem("CurriculumTales", "assets/images/story_indergarten_curriculum.png", "HeritagePlatform"),
              categoryItem("CurriculumSchool", "assets/images/school_curriculum.png", "StoriesPlatForm"),
            ],
          ),
          Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        mapTitle,
                        style: TextStyle(
                            color: AppColors.TextColorPrimary,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 35,),
                      Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Theme.of(context).accentColor),
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                child: Text(
                                  mapName,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.TextColorPrimary,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Image.asset("assets/images/map_of_the_week.png",),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        'الخريطة',
                        style: TextStyle(
                            color: AppColors.TextColorPrimary,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: AppColors.bgSplashScreenColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        'إختيار المرحلة الدراسية',
                        style: TextStyle(
                            color: AppColors.TextColorPrimary,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      CustomRadio()
                    ],
                  ),
                ),
              ),
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: AppColors.bgSplashScreenColor,
                  height: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

