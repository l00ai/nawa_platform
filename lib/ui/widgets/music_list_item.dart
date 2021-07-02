import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nawa_platform/helper/AppColors.dart';
import 'package:nawa_platform/model/story.dart';
import 'package:nawa_platform/ui/screen/ss.dart';

class MusicListItem extends StatefulWidget {
  final Story story;

  MusicListItem({this.story});

  @override
  _MusicListItemState createState() => _MusicListItemState();
}

class _MusicListItemState extends State<MusicListItem> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          backgroundColor: AppColors.bgMusicTileColor.withOpacity(0.4),
          trailing: Wrap(
            spacing: 12,
            children: [
              InkWell(
                  onTap: () {},
                  child: SvgPicture.asset('assets/icon/heart.svg')),
              InkWell(
                  onTap: () {},
                  child: SvgPicture.asset('assets/icon/download.svg')),
              InkWell(
                  onTap: () {},
                  child: SvgPicture.asset('assets/icon/share.svg')),
            ],
          ),
          leading: Stack(
            children: [
              Image.asset(
                'assets/images/image_bg.png',
                height: 70,
                width: 70,
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                    child: Image.network(
                      'http://nawa.accessline.ps/Uploads/Images/' +
                          widget.story.thumbnail,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            widget.story.name ?? "",
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor),
          ),
          subtitle: Text(
            widget.story.details ?? "",
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: AppColors.TextColorPrimary),
          ),
          children: <Widget>[
            Container(
              child: FlatButton(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => SS(),
                  // ));
                }, child: Container(
                child: SS(URL: 'http://nawa.accessline.ps/' + widget.story.videoLink,),
              ),
              ),
            )
          ],
        ),
        Divider(
          color: AppColors.bgMusicTileColor,
        )
      ],
    );
  }
}
