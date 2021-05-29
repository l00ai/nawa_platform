import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nawa_platform/helper/AppColors.dart';

class StoryListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
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
                child: CachedNetworkImage(imageUrl: 'http://nawa.accessline.ps/Uploads/Images/d5886c1e-7226-4a58-9c79-52a59c84593e.jpeg'
                  , fit: BoxFit.cover, width: MediaQuery.of(context).size.width * 0.5,),
              )
          ),
          Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(child: Text("علاء الدين والمصباح العجيب",style: TextStyle(color: Theme.of(context).accentColor, fontSize: 12, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,)),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("أحمد علي",style: TextStyle(color: AppColors.TextColorPrimary2, fontSize: 10, fontWeight: FontWeight.w600),),
                            Text("الهدى للنشر",style: TextStyle(color: AppColors.TextColorPrimary2, fontSize: 10, fontWeight: FontWeight.w600),),
                            Text("الأطفال",style: TextStyle(color: AppColors.TextColorPrimary2, fontSize: 10, fontWeight: FontWeight.w600),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
