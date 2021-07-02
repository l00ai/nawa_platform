import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nawa_platform/block/slider/slider_bloc.dart';
import 'package:nawa_platform/helper/AppColors.dart';
import 'package:nawa_platform/helper/common.dart';
import 'package:nawa_platform/model/slider_item.dart';
import 'package:nawa_platform/model/title_response.dart';
import 'package:nawa_platform/repository/portal_repository.dart';
import 'package:nawa_platform/ui/screen/story_platform_screen.dart';
import 'package:nawa_platform/ui/widgets/my_inner_drawer.dart';
import 'package:nawa_platform/ui/widgets/reload_indicator.dart';
import 'package:nawa_platform/ui/widgets/wave_clipper.dart';
import 'package:shimmer/shimmer.dart';

import 'home_edu_screen.dart';
import 'need_help_screen.dart';

class HomeScreen extends StatefulWidget {
  final TitleResponse titles;
  HomeScreen({this.titles});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();

  @override
  Widget build(BuildContext context) {
    final portalService = RepositoryProvider.of<PortalRepository>(context);
    return myInnerDrawer(
        context: context,
        innerDrawerKey: _innerDrawerKey,
        scaffold: Scaffold(
          backgroundColor: AppColors.bgSplashScreenColor,
          appBar: Common().myAppBar(context : context, innerDrawerKey: _innerDrawerKey, hasDrawer: true),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => NeedHelpScreen(),
              ));
            },
             label: Text("تحتاج إلى مساعدة ؟", style: TextStyle(fontSize: 12),),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          body: BlocProvider<SliderBloc>(
            create: (context) =>
                SliderBloc(portalService)..add(GetSliderData(context: context)),
            child: _MainScreen(titles: widget.titles,),
          ),
        ));
  }
}

class _MainScreen extends StatelessWidget {
  final TitleResponse titles;
  _MainScreen({this.titles});
  
  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowGlow();
          return true;
        },
        child: _Body(titles: titles,));
  }
}

class _Body extends StatefulWidget {
  final TitleResponse titles;
  _Body({this.titles});

  
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  final TextEditingController controller = TextEditingController();

  Widget header() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icon/fa-quote-right.svg",
            height: 12,
            color: Theme.of(context).accentColor,
          ),
          Text(" قوة الثقافة في مواجهة ثقافة القوة ",
              style: TextStyle(
                  fontFamily: 'Almarai',
                  fontSize: 16.0,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold)),
          SvgPicture.asset(
            "assets/icon/fa-quote-left.svg",
            height: 12,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          color: AppColors.bgSplashScreenColor,
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: [
          SvgPicture.asset("assets/icon/search.svg"),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: TextField(
              style: TextStyle(
                fontSize: 15.0,
              ),
              controller: controller,
              maxLines: 1,
              minLines: 1,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  hintText: "بحث",
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget sliderItem(SliderItem slider) {
    return InkWell(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(
        //   builder: (context) => StoryDetailsScreen(story: slider,),
        // ));
      },
      child: Center(
        child: Container(
          height: 220.0,
          margin: EdgeInsets.symmetric(horizontal: 7.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(4, 4), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FutureBuilder(
                  future: Common().downloadImage(slider.image),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done){
                      return snapshot.data ;
                    }
                    return Container();
                  } ,
                ),
              ),
              Container(
                height: 220.0,
                width: 170.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0.1,
                        0.3,
                        0.5,
                        0.8,
                        1,
                      ],
                      colors: [
                        AppColors.GradientColor_4.withOpacity(0.30),
                        AppColors.GradientColor_3.withOpacity(0.32),
                        AppColors.GradientColor_2.withOpacity(0.35),
                        AppColors.GradientColor_2.withOpacity(0.85),
                        AppColors.GradientColor_1
                      ],
                    )),
              ),
              Positioned(
                bottom: 5,
                right: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 205,
                        child: Text(
                          '  ' + slider?.name ?? '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    // Container(
                    //     width: 205,
                    //     child: Text(
                    //       slider?.name ?? '',
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 8.0,
                    //         fontWeight: FontWeight.normal,
                    //       ),
                    //     )),
                    Container(
                      height: 25.0,
                      margin: EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        color: slider?.type == "1" ? AppColors.GreenColor : AppColors.CuminColor,
                      ),
                      child: Text(
                        slider?.typeTxt ?? "",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 10.0),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryItem(String title, String image, String type) {
    // final String storiesPlatFormName = widget.titles.titles.firstWhere((element) => element.id == 'StoriesPlatForm')
    //     .name.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), ' ') ?? 'لا يوجد نبذة';
    //
    // final String heritagePlatformName = widget.titles.titles.firstWhere((element) => element.id == 'HeritagePlatform')
    //     .name.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), ' ')  ?? 'لا يوجد نبذة';

    //    -- Screen Types --
    //  1 - StoriesPlatForm
    //  2 - HeritagePlatform
    //  3 -

    return InkWell(
      highlightColor: Color.fromRGBO(50, 50, 100, 0.1),
      borderRadius: BorderRadius.circular(13),
      onTap: (){
        if(type == 'StoriesPlatForm') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                StoryPlatformScreen(
                  titles: widget.titles.titles, screenType: 1,)),
          );
        }else if(type == 'HeritagePlatform') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                StoryPlatformScreen(
                  titles: widget.titles.titles, screenType: 2,)),
          );
        }else if(type == 'EducationPlatForm'){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                HomeEduScreen(
                  titles: widget.titles.titles,)),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
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
            Image.asset(
              image,
              height: 200,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          header(),
          Container(
              color: Colors.white,
              //padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              padding: const EdgeInsets.only(bottom: 7, left: 16, top: 22, right: 16),
              child: searchBox()),
          BlocBuilder<SliderBloc, SliderState>(
            builder: (context, state) {
              void reload() {
                BlocProvider.of<SliderBloc>(context)
                    .add(GetSliderData(context: context));
              }

              if (state is GetSliderFailure) {
                return ReloadIndicator(context: context, msg: state.error, reload: reload,);
              }

              if (state is GetSliderSuccess) {
                // log(state.sections[0].subject.toJson().toString());
                return Container(
                  color: Colors.white,
                  height: 250.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...state.sliders.map((e) => sliderItem(e))
                    ],
                  ),
                );
              }
              return Container(
                height: 250.0,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  enabled: true,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, __) => Center(
                      child: Container(
                        height: 220.0,
                        margin: EdgeInsets.symmetric(horizontal: 7.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: Offset(4, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: 220.0,
                            width: 170.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    itemCount: 10,
                  ),
                ),
              );
            },
          ),
          Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      color: Colors.white,
                      height: 65,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 16.0,
                        ),
                        Text(
                          "إذهب إلى",
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Image.asset(
                          "assets/icon/right-drawn-arrow.png",
                          height: 50.0,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              categoryItem("المنصة التعليمية", "assets/images/education.png", "EducationPlatForm"),
              categoryItem("المنصة القصصية", "assets/images/store.png", "StoriesPlatForm"),
              categoryItem("المنصة التراثية", "assets/images/cul.png", "HeritagePlatform"),
              Stack(
                children: [
                  Container(
                    color: Colors.white,
                    height: 30,
                  ),
                  ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      color: AppColors.bgSplashScreenColor,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
