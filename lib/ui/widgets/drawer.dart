import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nawa_platform/helper/AppColors.dart';

class AppDrawer extends StatelessWidget {
  final context;

  AppDrawer({@required this.context});

  Widget _createDrawerItem(
      {Widget icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          icon,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: AppColors.TextColorDrawer),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 120.0,),
          _createDrawerItem(
            icon: SvgPicture.asset(
              "assets/icon/global.svg",
            ),
            text: 'مواقع مفيدة',
          ),
          _createDrawerItem(
            icon: SvgPicture.asset(
              "assets/icon/call.svg",
            ),
            text: 'تواصل معنا',
          ),
          _createDrawerItem(
            icon: SvgPicture.asset(
              "assets/icon/cv.svg",
            ),
            text: 'عن المنصة',
          ),
          Divider(),
          _createDrawerItem(
            icon: Icon(Icons.logout, color: Theme.of(context).accentColor),
            text: 'تسجيل الخروج',
          ),
          // ListTile(
          //   title: Text('0.0.1'),
          //   onTap: () {},
          // ),
        ],
      ),
    );
  }
}
