import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawa_platform/helper/AppColors.dart';
import 'package:nawa_platform/helper/common.dart';
import 'package:nawa_platform/model/letter.dart';
import 'package:nawa_platform/model/stories_response.dart';
import 'package:nawa_platform/model/story.dart';
import 'package:nawa_platform/repository/portal_repository.dart';
import 'package:nawa_platform/ui/screen/story_cata_screen.dart';
import 'package:nawa_platform/ui/widgets/heritage_list_item.dart';
import 'package:nawa_platform/ui/widgets/music_list_item.dart';
import 'package:nawa_platform/ui/widgets/story_list_item.dart';

class StoryPlatformScreen extends StatefulWidget {
  final titles ;
  final int screenType;
  StoryPlatformScreen({this.titles, this.screenType});

  @override
  _StoryPlatformScreenState createState() => _StoryPlatformScreenState();
}

class _StoryPlatformScreenState extends State<StoryPlatformScreen > {

  String _letterId = "أ" ;
  String _searchTypeId = "الإسم" ;
  List<Letter> _letters = Common().listOfLetter;
  List<Letter> _searchType = Common().listSearchType;
  String name ;
  String title ;



  Future<StoriesResponse> _response;

  @override
  void initState() {
    if(widget.screenType == 1){
      var obj =  widget.titles.firstWhere((element) => element.id == 'StoriesPlatForm');
      name =  obj.name.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), ' ') ?? 'لا يوجد نبذة';
      title =  obj.title.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), ' ') ?? 'لا يوجد عنوان';

    }else if(widget.screenType == 2){
      var obj = widget.titles.firstWhere((element) => element.id == 'HeritagePlatform');
      name = obj.name.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), ' ')  ?? 'لا يوجد نبذة';
      title = obj.title.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), ' ')  ?? 'لا يوجد عنوان';
    }

    if(widget.screenType == 1){
      _response =  RepositoryProvider.of<PortalRepository>(context).getStoriesForHome(context);
    }else if(widget.screenType == 2){
      _response =  RepositoryProvider.of<PortalRepository>(context).getHeritageForHome(context);
    }
    else if(widget.screenType == 3){
    }

    super.initState();
  }


  Future<StoriesResponse> _getData(String a){

      if(a == null){
        if(widget.screenType == 1){
          _response =  RepositoryProvider.of<PortalRepository>(context).getStoriesForHome(context);
        }else if(widget.screenType == 2){
          _response =  RepositoryProvider.of<PortalRepository>(context).getHeritageForHome(context);
        }

      }else{
        if(widget.screenType == 1){
          _response =  RepositoryProvider.of<PortalRepository>(context).getStoriesQ(context, a);
        }else if(widget.screenType == 2){
          _response =  RepositoryProvider.of<PortalRepository>(context).getHeritageQ(context, a);
        }

      }

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
                  Text(title, style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold, fontSize: 16.0),),
                  SizedBox(height: 10,),
                  Text(name , style: TextStyle(color: AppColors.TextColorPrimary, fontSize: 13.0),),
                ],
              ),
            ),
            searchBox(),
            SizedBox(height: 15.0,),
            FutureBuilder<StoriesResponse>(
              future: _response,
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return CircularProgressIndicator();
                }
                if(snapshot.hasData){
                  final data = snapshot.data.stories ;
                  if(data.length > 0){
                    return Column(
                      children: [
                        ...groupBy(data, (obj) => obj.type).entries.map(
                                (items) => categoriesList(items.value)).toList()
                      ],
                    );
                  }
                }
                return Container();
              },
            ),
          ],
        ),
      )
    );
  }

  Widget categoriesList(List<Story> stories){
    return Column(
      children: [
        header(title: stories[0].typeTxt),
        if(stories[0].type != "11")
        GridView.extent(
          maxCrossAxisExtent: 200,
          primary: false,
          shrinkWrap: true,
          childAspectRatio: 0.78,
          physics: NeverScrollableScrollPhysics(),
          children: [
            ...stories.map((e) => widget.screenType == 1 ? StoryListItem(story: e) : HeritageListItem(story: e,))
          ],
        ),
        if(stories[0].type == "11")
        ListView(
          primary: false,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            ...stories.map((e) =>  MusicListItem(story: e,))
          ],
        ),
        if(stories[0].type != "11")
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Divider(height: 1, color: Colors.black12,)),
            SizedBox(width: 12,),
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => StoryCataScreen(typeId: stories[0].type, titles: widget.titles, typeTxt: stories[0].typeTxt, screenType: widget.screenType,),
                  ));
                },
                child: Text("عرض المزيد")),
            SizedBox(width: 12,),
            Expanded(child: Divider(height: 1, color: Colors.black12,))
          ],
        ),
        SizedBox(height: 10,)
      ],
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
                        value: _searchTypeId,
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
                          this._searchTypeId = value;
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
                          onChanged: (value) async {
                            this._letterId = value;
                          // _getData(this._letterId);
                            setState(() {
                             // _getData(this._letterId);
                            });
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
