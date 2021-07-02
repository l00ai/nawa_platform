import 'package:flutter/material.dart';
import 'package:audio_manager/audio_manager.dart';


class SS extends StatefulWidget {
  final String URL ;
  SS({this.URL});

  @override
  _SSState createState() => _SSState();
}

class _SSState extends State<SS> {
  bool isPlaying = false;
  Duration _duration;
  Duration _position;
  double _slider;
  num curIndex = 0;
  PlayMode playMode = AudioManager.instance.playMode;

  final list = [
    {
      "title": "",
      "desc": "",
      "url": "",
      "coverUrl": "assets/images/nawa-logo.png"
    }
  ];

  @override
  void initState() {
    super.initState();
    setupAudio();
  }

  @override
  void dispose() {
    AudioManager.instance.release();
    super.dispose();
  }

  void setupAudio() {
    List<AudioInfo> _list = [];
    list.forEach((item) => _list.add(AudioInfo(widget.URL,
        title: item["title"], desc: item["desc"], coverUrl: item["coverUrl"])));

    AudioManager.instance.audioList = _list;
    AudioManager.instance.intercepter = true;
    AudioManager.instance.play(auto: true);

    AudioManager.instance.onEvents((events, args) {
      print("$events, $args");
      switch (events) {
        case AudioManagerEvents.start:
          print(
              "start load data callback, curIndex is ${AudioManager.instance.curIndex}");
          _position = AudioManager.instance.position;
          _duration = AudioManager.instance.duration;
          _slider = 0;
          setState(() {});
          break;
        case AudioManagerEvents.ready:
          print("ready to play");
          _position = AudioManager.instance.position;
          _duration = AudioManager.instance.duration;
          setState(() {});
          // if you need to seek times, must after AudioManagerEvents.ready event invoked
          // AudioManager.instance.seekTo(Duration(seconds: 10));
          break;
        case AudioManagerEvents.seekComplete:
          _position = AudioManager.instance.position;
          _slider = _position.inMilliseconds / _duration.inMilliseconds;
          setState(() {});
          print("seek event is completed. position is [$args]/ms");
          break;
        case AudioManagerEvents.buffering:
          print("buffering $args");
          break;
        case AudioManagerEvents.playstatus:
          isPlaying = AudioManager.instance.isPlaying;
          setState(() {});
          break;
        case AudioManagerEvents.timeupdate:
          _position = AudioManager.instance.position;
          _slider = _position.inMilliseconds / _duration.inMilliseconds;
          setState(() {});
          AudioManager.instance.updateLrc(args["position"].toString());
          break;
        case AudioManagerEvents.error:
          setState(() {});
          break;
        case AudioManagerEvents.ended:
          AudioManager.instance.next();
          break;
        case AudioManagerEvents.volumeChange:
          setState(() {});
          break;
        default:
          break;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return bottomPanel() ;
  }

  Widget bottomPanel() {
    return Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: songProgress(context),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              onPressed: () async {
                bool playing = await AudioManager.instance.playOrPause();
                print("await -- $playing");
              },
              padding: const EdgeInsets.all(0.0),
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: 48.0,
                color: Colors.black,
              ),
            ),
            // IconButton(
            //     icon: Icon(
            //       Icons.stop,
            //       color: Colors.black,
            //     ),
            //     onPressed: () => AudioManager.instance.stop()),
          ],
        ),
      ),
    ]);
  }


  Widget songProgress(BuildContext context) {
    var style = TextStyle(color: Colors.black);
    return Column(
      children: <Widget>[
        Row(
          children: [
            Text(
              _formatDuration(_duration),
              style: style,
            ),
            Text(
              " / ",
              style: style,
            ),
            Text(
              _formatDuration(_position),
              style: style,
            ),
          ],
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 7,
                  thumbShape: RoundSliderThumbShape(
                    disabledThumbRadius: 0,
                    enabledThumbRadius: 0,
                  ),
                  overlayShape: RoundSliderOverlayShape(
                    overlayRadius: 0,
                  ),
                  activeTrackColor: Theme.of(context).accentColor,
                  inactiveTrackColor: Color(0xffEBAB5A),
                ),
                child: Slider(
                  value: _slider ?? 0,
                  onChanged: (value) {
                    setState(() {
                      _slider = value;
                    });
                  },
                  onChangeEnd: (value) {
                    if (_duration != null) {
                      Duration msec = Duration(
                          milliseconds:
                          (_duration.inMilliseconds * value).round());
                      AudioManager.instance.seekTo(msec);
                    }
                  },
                )),
          ),


      ],
    );
  }

  String _formatDuration(Duration d) {
    if (d == null) return "--:--";
    int minute = d.inMinutes;
    int second = (d.inSeconds > 60) ? (d.inSeconds % 60) : d.inSeconds;
    String format = ((minute < 10) ? "0$minute" : "$minute") +
        ":" +
        ((second < 10) ? "0$second" : "$second");
    return format;
  }

}