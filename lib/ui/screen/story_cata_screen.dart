import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawa_platform/helper/AppColors.dart';
import 'package:nawa_platform/helper/common.dart';
import 'package:nawa_platform/model/letter.dart';
import 'package:nawa_platform/model/stories_response.dart';

import 'package:nawa_platform/repository/portal_repository.dart';
import 'package:nawa_platform/ui/widgets/reload_indicator.dart';
import 'package:nawa_platform/ui/widgets/story_list_item.dart';

class StoryCataScreen extends StatefulWidget {
  final titles ;
  final String typeId ;
  final String typeTxt ;
  final screenType ;
  StoryCataScreen({this.titles, this.typeId, this.typeTxt, this.screenType});

  @override
  _StoryCataScreenState createState() => _StoryCataScreenState();
}

class _StoryCataScreenState extends State<StoryCataScreen > {

  String _letterId;
  List<Letter> _letters = Common().listOfLetter;
  List<Letter> _searchType = Common().listSearchType;
  String title ;
  String name ;

  @override
  void initState() {

    if(widget.screenType == 1){
      var ogj = widget.titles.firstWhere((element) => element.typeID == widget.typeId, orElse: () => null);
      name = ogj?.name?.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), ' ')  ?? 'لا يوجد نبذة';

      var obj2 = widget.titles.firstWhere((element) => element.typeID == widget.typeId, orElse: () => null);
      title = obj2?.title?.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), ' ')  ?? 'لا يوجد عنوان';

    }else{
      var ogj = widget.titles.firstWhere((element) => (widget.typeId == '11' ? "SongHeritage" : 'VideoHeritage') == element.id , orElse: () => null);
      name = ogj?.name?.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), ' ')  ?? 'لا يوجد نبذة';

      var obj2 = widget.titles.firstWhere((element) => (widget.typeId == '11' ? "SongHeritage" : 'VideoHeritage') == element.id , orElse: () => null);
      title = obj2?.title?.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), ' ')  ?? 'لا يوجد عنوان';

    }


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Common().myAppBar(context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
                  Text(title , style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold, fontSize: 16.0),),
                  SizedBox(height: 10,),
                  Text(name , style: TextStyle(color: AppColors.TextColorPrimary, fontSize: 13.0),),
                ],
              ),
            ),
            searchBox(),
            SizedBox(height: 15.0,),
            FutureBuilder<StoriesResponse>(
              future: widget.screenType == 1
                  ? RepositoryProvider.of<PortalRepository>(context).getStoriesAsType(context, widget.typeId)
                  : RepositoryProvider.of<PortalRepository>(context).getHeritageAsType(context, widget.typeId),
              builder: (context, snapshot) {

                if(snapshot.connectionState == ConnectionState.waiting){
                  return CircularProgressIndicator();
                }

                if(snapshot.hasData){
                  final data = snapshot.data.stories ;
                  if(data.length > 0){
                    return Column(
                      children: [
                        header(title: widget.typeTxt ?? ""),
                        GridView.extent(
                          maxCrossAxisExtent: 200,
                          primary: false,
                          shrinkWrap: true,
                          childAspectRatio: 0.78,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            ...data.map((e) => StoryListItem(story: e,))
                          ],
                        ),
                      ],
                    );
                  }
                }
                void reload() {
                  setState(() {});
                }

                return ReloadIndicator(context: context, msg: snapshot.error, reload: reload,);
              },
            ),
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
                      child: DropdownButton<String>(
                        hint: Text(
                          "إختر",
                          style: TextStyle(fontFamily: 'Coconnext', color: Colors.grey[500], fontSize: 12,),
                        ),
                        value: _letterId,
                        isExpanded: true,
                        underline: Container(),
                        items: _searchType
                            .map((e) =>
                            DropdownMenuItem<String>(
                              child: Text(
                                e.name,
                                style: TextStyle(fontFamily: 'Coconnext', fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              value: e.name,
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
                        child: DropdownButton<String>(
                          hint: Text(
                            "إختر",
                            style: TextStyle(fontFamily: 'Coconnext', color: Colors.grey[500], fontSize: 12,),
                          ),
                          value: _letterId,
                          isExpanded: true,
                          underline: Container(),
                          items: _letters
                              .map((e) =>
                              DropdownMenuItem<String>(
                                child: Text(
                                  e.name,
                                  style: TextStyle(fontFamily: 'Coconnext', fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                                value: e.name,
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

