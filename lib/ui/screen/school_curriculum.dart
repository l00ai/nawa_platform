import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nawa_platform/helper/AppColors.dart';
import 'package:nawa_platform/helper/common.dart';

class SchoolCurriculum extends StatefulWidget {
  final titles ;
  SchoolCurriculum({this.titles});

  @override
  _SchoolCurriculumState createState() => _SchoolCurriculumState();
}

class _SchoolCurriculumState extends State<SchoolCurriculum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Common().myAppBar(context: context),
        body: _MainScreen(titles: widget.titles,)
    );
  }
}

class _MainScreen extends StatelessWidget {
  final titles;
  _MainScreen({this.titles});


  Widget categoryItem(String id, String image, BuildContext context) {

    var obj = titles.firstWhere((element) => element.id == id);
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
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.bgSchoolCurriculumCardColor,
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          categoryItem("EduWorkSheet", "assets/images/edu_worksheets.png", context),
          categoryItem("EduGame", "assets/images/edu_games.png", context),
          categoryItem("EduStory", "assets/images/edu_stories.png", context),
        ],
      ),
    );
  }
}

