import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

Widget myAppBar({context, GlobalKey<InnerDrawerState> innerDrawerKey, bool hasDrawer= false}) {
  return AppBar(
    leading: hasDrawer ? IconButton(
      onPressed: () {
        innerDrawerKey.currentState.open();
      },
      icon: Image.asset("assets/icon/menu.png"),
    ) : IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_rounded),
    ),
    titleSpacing: 0.1,
    title: Row(
      children: [
        Image.asset(
          "assets/images/nawa-logo.png",
          height: 34.0,
        ),
        SizedBox(
          width: 7.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("جمعية نوى للثقافة والفنون",
                style: TextStyle(
                    fontFamily: 'Almarai',
                    fontSize: 11.0,
                    fontWeight: FontWeight.w100)),
            SizedBox(
              height: 5.0,
            ),
            Text("Nawa for Culture and Arts Association",
                style: TextStyle(
                    fontFamily: 'Almarai',
                    fontSize: 11.0,
                    fontWeight: FontWeight.w100)),
          ],
        )
      ],
    ),
    actions: [
      Container(
        padding: EdgeInsets.only(bottom: 10, left: 10, top: 10),
        child: OutlineButton(
          onPressed: () {},
          child: Text("إشتراك", style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.w400, fontSize: 14.0),),
          borderSide: BorderSide(color: Theme.of(context).accentColor,),
          highlightedBorderColor: Theme.of(context).accentColor,
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(7.0)),
        ),
      )
    ],
  );
}
