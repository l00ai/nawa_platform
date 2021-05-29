import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'drawer.dart';

Widget myInnerDrawer({BuildContext context, Widget scaffold, GlobalKey<InnerDrawerState> innerDrawerKey,}) {
  return InnerDrawer(
      key: innerDrawerKey,
      onTapClose: true, // default false
      swipe: true, // default true
      //When setting the vertical offset, be sure to use only top or bottom
      offset: IDOffset.only(bottom: 0.0, right: 0.0, left: 0.45),

    //  colorTransitionScaffold: Theme.of(context).accentColor.withAlpha(40),


      scale: IDOffset.horizontal(1), // set the offset in both directions

      leftAnimationType: InnerDrawerAnimation.linear, // default static
      //rightAnimationType: InnerDrawerAnimation.quadratic,
      backgroundDecoration: BoxDecoration(color: Colors.white ), // default  Theme.of(context).backgroundColor

      //when a pointer that is in contact with the screen and moves to the right or left
      onDragUpdate: (double val, InnerDrawerDirection direction) {
      //  print(val);
      //  print(direction==InnerDrawerDirection.start);
      },
     //innerDrawerCallback: (a) => print(a),
      leftChild: AppDrawer(context: context,),
      //rightChild: Container(color: Colors.blue,),

      scaffold: scaffold
  );
}