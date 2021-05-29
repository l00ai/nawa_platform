import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nawa_platform/helper/AppColors.dart';
import 'package:nawa_platform/ui/widgets/app_par.dart';
import 'package:nawa_platform/ui/widgets/story_list_item.dart';

class StoryPlatformScreen extends StatefulWidget {
  final String title ;
  StoryPlatformScreen({this.title});

  @override
  _StoryPlatformScreenState createState() => _StoryPlatformScreenState();
}

class _StoryPlatformScreenState extends State<StoryPlatformScreen > {

  int _letterId;
  List<Letter> _letters = [];
  List<Letter> _searchType = [];

  @override
  void initState() {
    _letters.add(Letter(areaId: 1, name: "أ"));
    _letters.add(Letter(areaId: 2, name: "ب"));
    _letters.add(Letter(areaId: 3, name: "ت"));
    _letters.add(Letter(areaId: 4, name: "أ"));
    _letters.add(Letter(areaId: 5, name: "س"));
    _letters.add(Letter(areaId: 6, name: "ض"));
    _letters.add(Letter(areaId: 7, name: "ص"));
    _letters.add(Letter(areaId: 8, name: "ث"));
    _letters.add(Letter(areaId: 9, name: "غ"));
    _letters.add(Letter(areaId: 10, name: "غ"));
    _letters.add(Letter(areaId: 11, name: "ن"));
    _letters.add(Letter(areaId: 12, name: "ؤ"));

    _searchType.add(Letter(areaId: 1, name: "الحرف"));
    _searchType.add(Letter(areaId: 2, name: "الإسم"));
    _searchType.add(Letter(areaId: 3, name: "النوع"));
    _searchType.add(Letter(areaId: 4, name: "الأكثر قراءة"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("المنصة القصصية", style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Text(widget.title , style: TextStyle(color: AppColors.TextColorPrimary, fontSize: 13.0),),
                ],
              ),
            ),
            searchBox(),
            SizedBox(height: 15.0,),
            header(title: 'قصص الأطفال'),
            GridView.extent(
              maxCrossAxisExtent: 200,
              primary: false,
                shrinkWrap: true,
                childAspectRatio: 7.5 / 9.0,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  StoryListItem(),
                  StoryListItem(),
                  StoryListItem(),
                  StoryListItem(),
                  StoryListItem(),
                ],
            ),
            header(title: 'قصص الأجداد'),
            GridView.extent(
              maxCrossAxisExtent: 200,
              primary: false,
              shrinkWrap: true,
              childAspectRatio: 7.5 / 9.0,
              physics: NeverScrollableScrollPhysics(),
              children: [
                StoryListItem(),
                StoryListItem(),
                StoryListItem(),
                StoryListItem(),
                StoryListItem(),
              ],
            )
          ],
        ),
      )
    );
  }

  Widget header({String title}){
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      padding: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: AppColors.OrangeColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),)),
    );
  }

  Widget searchBox() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(4, 4), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("بحث حسب", style: TextStyle(fontSize: 12,),),
                StatefulBuilder(
                  builder: (context, setState) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      width: 100.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey[300])),
                      child: DropdownButton<int>(
                        hint: Text(
                          "إختر",
                          style: TextStyle(fontFamily: 'Coconnext', color: Colors.grey[500], fontSize: 12,),
                        ),
                        value: _letterId,
                        isExpanded: true,
                        underline: Container(),
                        items: _searchType
                            .map((e) =>
                            DropdownMenuItem<int>(
                              child: Text(
                                e.name,
                                style: TextStyle(fontFamily: 'Coconnext', fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              value: e.areaId,
                            )).toList(),
                        onChanged: (value) {
                          this._letterId = value;
                          setState(() {});
                        },
                      ),
                    );
                  },
                )
              ],
            )
          ),
          SizedBox(width: 15.0,),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("الأحرف", style: TextStyle(fontSize: 12,),),
                  StatefulBuilder(
                    builder: (context, setState) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        width: 70.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey[300])),
                        child: DropdownButton<int>(
                          hint: Text(
                            "إختر",
                            style: TextStyle(fontFamily: 'Coconnext', color: Colors.grey[500], fontSize: 12,),
                          ),
                          value: _letterId,
                          isExpanded: true,
                          underline: Container(),
                          items: _letters
                              .map((e) =>
                              DropdownMenuItem<int>(
                                child: Text(
                                  e.name,
                                  style: TextStyle(fontFamily: 'Coconnext', fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                                value: e.areaId,
                              )).toList(),
                          onChanged: (value) {
                            this._letterId = value;
                            setState(() {});
                          },
                        ),
                      );
                    },
                  )
                ],
              )
          ),
        ],
      ),
    );
  }

}


class Letter {
  int areaId;
  String name;

  Letter({this.areaId, this.name});

}