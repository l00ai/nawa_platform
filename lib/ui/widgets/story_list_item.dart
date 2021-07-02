import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nawa_platform/helper/AppColors.dart';
import 'package:nawa_platform/helper/common.dart';
import 'package:nawa_platform/model/story.dart';
import 'package:nawa_platform/ui/screen/story_details_screen.dart';

class StoryListItem extends StatelessWidget {
  final Story story;
  StoryListItem({this.story});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
           builder: (context) => StoryDetailsScreen(story: story,),
        ));
      },
      child: Container(
        height: 350,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: 300,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
              color: AppColors.bgMainScreenColor,
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
              Expanded(
                  child: ClipRRect(
                    borderRadius:BorderRadius.only(
                        topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                    child: FutureBuilder(
                      future: Common().downloadImage(story.thumbnail),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done){
                          return snapshot.data ;
                        }

                        return Container();
                      },
                    ),
                  )
              ),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(child: Text(story.name ?? "",style: TextStyle(color: Theme.of(context).accentColor, fontSize: 12, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,)),
                        SizedBox(height: 5.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("اسم الكاتب:",style: TextStyle(color: AppColors.TextColorPrimary2, fontSize: 10, fontWeight: FontWeight.w600),),
                                Text("دار النشر:",style: TextStyle(color: AppColors.TextColorPrimary2, fontSize: 10, fontWeight: FontWeight.w600),),
                                Text("الفئة المستهدفة:",style: TextStyle(color: AppColors.TextColorPrimary2, fontSize: 10, fontWeight: FontWeight.w600),),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(story.authorTxt ?? "",style: TextStyle(color: AppColors.TextColorPrimary2, fontSize: 10, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,),
                                  Text(story.publishingHouseTxt ?? "",style: TextStyle(color: AppColors.TextColorPrimary2, fontSize: 10, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,),
                                  Text(story.targetGroupTxt ?? "",style: TextStyle(color: AppColors.TextColorPrimary2, fontSize: 10, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
