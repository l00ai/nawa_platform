import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nawa_platform/helper/AppColors.dart';
import 'package:nawa_platform/helper/common.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class StoryDetailsScreen extends StatefulWidget {
  final story;

  StoryDetailsScreen({this.story});

  @override
  _StoryDetailsScreenState createState() => _StoryDetailsScreenState();
}

class _StoryDetailsScreenState extends State<StoryDetailsScreen> {
  YoutubePlayerController _controller ;
  var videoId ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    // videoId = widget.story.videoLink.split('v=')[1];
    // var ampersandPosition = videoId.indexOf('&');
    // if(ampersandPosition != -1) {
    //   videoId = videoId.substring(0, ampersandPosition);
    // }

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.story.videoLink),
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common().myAppBar(context: context),
      body: ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          YoutubePlayer(
            controller: _controller,
            liveUIColor: Theme.of(context).accentColor,
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                      color: Colors.black12,
                      offset: Offset(5, 5),
                      blurRadius: 10,
                    ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black12)
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StatefulBuilder(
                          builder: (context, setState) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: 100.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(5),),
                              child: Center(
                                child: Text(
                                   "دليل الأنشطة",
                                   style: TextStyle(color: Colors.white, fontSize: 12,),
                                 ),
                              ),
                              // child: DropdownButton<int>(
                              //   hint: Text(
                              //     "إختر",
                              //     style: TextStyle(fontFamily: 'Coconnext', color: Colors.grey[500], fontSize: 12,),
                              //   ),
                              //   value: _letterId,
                              //   isExpanded: true,
                              //   underline: Container(),
                              //   items: _searchType
                              //       .map((e) =>
                              //       DropdownMenuItem<int>(
                              //         child: Text(
                              //           e.name,
                              //           style: TextStyle(fontFamily: 'Coconnext', fontSize: 12, fontWeight: FontWeight.bold),
                              //         ),
                              //         value: e.id,
                              //       )).toList(),
                              //   onChanged: (value) {
                              //     this._letterId = value;
                              //     setState(() {});
                              //   },
                              // ),
                            );
                          },
                        ),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: IconButton(
                              icon: Icon(Icons.share),
                              color: Colors.white,
                              iconSize: 15,
                              onPressed: (){}),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: FutureBuilder(
                          future: Common().downloadImage(widget.story.thumbnail),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.done){
                              return snapshot.data ;
                            }

                            return Container();
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.story.name?? "", style: TextStyle(color: Theme.of(context).accentColor, fontSize: 16, fontWeight: FontWeight.bold),),
                          Row(
                            children: [
                              Text("الكاتب : ", style: TextStyle(color: AppColors.TextColorPrimary, fontWeight: FontWeight.bold, fontSize: 12),),
                              Text(widget.story.authorTxt ?? "", style: TextStyle(fontSize: 12),),
                            ],
                          ),
                          Row(
                            children: [
                              Text("رسوم : ", style: TextStyle(color: AppColors.TextColorPrimary, fontWeight: FontWeight.bold, fontSize: 12),),
                              Text(widget.story.painterTxt ?? "", style: TextStyle(fontSize: 12),),
                            ],
                          ),
                          Row(
                            children: [
                              Text("نشر : ", style: TextStyle(color: AppColors.TextColorPrimary, fontWeight: FontWeight.bold, fontSize: 12),),
                              Text(widget.story.publishingHouseTxt ?? "", style: TextStyle(fontSize: 12),),
                            ],
                          ),
                          Row(
                            children: [
                              Text("مناسب للمراحل : ", style: TextStyle(color: AppColors.TextColorPrimary, fontWeight: FontWeight.bold, fontSize: 12),),
                              Text(widget.story.targetGroupTxt ?? "", style: TextStyle(fontSize: 12),),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  child: Text(widget.story.details ?? "", style: TextStyle(fontSize: 13),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
