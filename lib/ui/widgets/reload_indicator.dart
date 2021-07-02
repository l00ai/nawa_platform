import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReloadIndicator extends StatelessWidget {
  final BuildContext context;
  final Function reload;
  final String msg;

  ReloadIndicator({@required this.context,@required this.reload,@required this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icon/no.svg', height: 120,),
          SizedBox(height: 30,),
          Text(msg, style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),),
          SizedBox(height: 30,),
          RaisedButton(
            onPressed: reload,
            color: Theme.of(context).accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text('إعادة التحميل', style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),),
          )
        ],
      ),
    );
  }
}

