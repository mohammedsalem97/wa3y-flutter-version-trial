import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttery_seekbar/fluttery_seekbar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wa3y/colors/app-colors.dart';
import 'package:wa3y/helper_files/drawer-element-mapping.dart';

class Counter90 extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter90> {
  double progress = 0.3;
  bool toggleContent = false;

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    return OrientationBuilder(builder: (context, orientation) {
      bool _isLandScape = orientation == Orientation.landscape ? true : false;
      return Scaffold(
        drawerScrimColor: darkColor.withOpacity(0.9),
        endDrawer: MyDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: darkColor, size: 25.0),
          backgroundColor: whitishColor,
          automaticallyImplyLeading: true,
          title: Text(
            "90 يوماً بدون شاي",
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: darkColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                /// First Portion of the page [Dark background and chart]
                Stack(
                  overflow: Overflow.clip,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      constraints: BoxConstraints(
                        minHeight: !_isLandScape
                            ? _screenHeight * 0.45
                            : _screenHeight * 0.6,
                      ),
                      color: darkColor,
                    ),
                    Positioned(
                      bottom: orientation == Orientation.portrait
                          ? -(_screenWidth * 0.75) / 2.0
                          : -(_screenWidth * 0.55) / 2.0,
                      child: Container(
                        width: orientation == Orientation.portrait
                            ? _screenWidth * 0.75
                            : _screenWidth * 0.55,
                        height: orientation == Orientation.portrait
                            ? _screenWidth * 0.75
                            : _screenWidth * 0.55,
                        child: Transform.rotate(
                          angle: (pi / 2) * 3,
                          child: RadialSeekBar(
                            progress: progress / 2.0,
                            progressColor: pinkishColor,
                            trackColor: Colors.black12,
                            trackWidth: 10.0,
                            progressWidth: 15.0,
                          ),
                        ),
                      ),
                    ),

                    ///The Badge Widget like[بطل حديدي]
                    Positioned(
                      top: 25.0,
                      left: 0.0,
                      child: Container(
                        constraints: BoxConstraints(
                            maxWidth: _screenWidth > _screenHeight
                                ? _screenWidth / 5.0
                                : _screenWidth / 2.5),
                        decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(_screenHeight),
                              bottomRight: Radius.circular(_screenHeight),
                            )),
                        padding: EdgeInsets.all(4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 3.0,
                            ),
                            Icon(
                              MdiIcons.humanGreeting,
                              color: darkColor,
                              size: 17.0,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Expanded(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 2.0),
                                  child: Text(
                                    "بطل حديدي",
                                    textDirection: TextDirection.rtl,
                                    strutStyle: StrutStyle(
                                        height: 2.0, forceStrutHeight: true),
                                    style: TextStyle(
                                        color: darkColor.withOpacity(0.68),
                                        fontSize: 14.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                /// Second Portion of the page [Detailed Info]
                Stack(
                  alignment: Alignment.center,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          top: orientation == Orientation.portrait
                              ? (_screenWidth * 0.2) + 50.0
                              : (_screenWidth * 0.2) + 50.0,
                          bottom: 30.0),
                      width: _screenWidth,
                      child: Column(
                        children: <Widget>[
                          /// First Card [Elapsed Days]
                          _buildDayCard(context,
                              title: "عدد الأيام بدون نيسكافيه", days: 60),
                          SizedBox(
                            height: 40.0,
                          ),

                          /// Second Card [Remaining Days]
                          _buildDayCard(context,
                              title: "عدد الأيام المتبقية",
                              days: 30,
                              color: pinkishColor),
                          SizedBox(
                            height: 40.0,
                          ),

                          /// Start Date and Finish date potion
                          Card(
                            margin: EdgeInsets.zero,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15.0),
                              color: whitishColor,
                              child: Row(
                                children: <Widget>[
                                  _buildDateSection(
                                    title: "بدأ التحدي يوم",
                                  ),
                                  Container(
                                    color: darkColor.withOpacity(0.7),
                                    width: 1.0,
                                    height: 80.0,
                                  ),
                                  _buildDateSection(
                                      title: "يكتمل التحدي يوم",
                                      date: "19/19/2019"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35.0,
                          ),

                          /// Repeat and Stop Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,

                            children: <Widget>[
                              SizedBox(width: 15.0,),
                              Expanded(
                                child: RaisedButton(
                                  onPressed: () {},
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 10.0),
                                  color: darkColor,
                                  elevation: 5.0,
                                  textColor: Colors.white,
                                  child: Text(
                                    "إعادة العداد للصفر",
                                    style: TextStyle(
                                        shadows: [
                                          Shadow(
                                              color: Colors.black,
                                              offset: Offset(3.0, 5.0),
                                              blurRadius: 15.0)
                                        ],
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                              SizedBox(width: 15.0,),
                              Expanded(
                                child: RaisedButton(
                                  onPressed: () {},
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 10.0),
                                  color: pinkishColor,
                                  elevation: 5.0,
                                  textColor: Colors.white,
                                  child: Text(
                                    "إيقاف العداد",
                                    style: TextStyle(
                                        shadows: [
                                          Shadow(
                                              color: Colors.black,
                                              offset: Offset(3.0, 5.0),
                                              blurRadius: 15.0)
                                        ],
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                              SizedBox(width: 15.0,),
                            ],
                          ),
                        ],
                      ),
//                      color: Colors.green,
                    ),
                    Positioned(
                      top: orientation == Orientation.portrait
                          ? -(_screenWidth * 0.2)
                          : -(_screenWidth * 0.2),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            toggleContent = !toggleContent;
                          });
                        },
                        child:
                            _buildAvatar(context, toggleContent: toggleContent),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  /// ----------------------------------------------------------------------------------
  /// Function to build Cards which contain text title,days count and corresponding colors
  /// ----------------------------------------------------------------------------------
  Widget _buildDayCard(BuildContext context,
      {String title = "++++",
      Color color = const Color(0xff433F67),
      int days = 0}) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.center,
      children: <Widget>[
        Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 3.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_screenWidth)),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(_screenWidth)),
            height: 45.0,
            width: _screenWidth * 0.95,
            padding: EdgeInsets.only(right: 40.0),
            child: Center(
              child: Text(
                title,
//                "عدد الأيام بدون نيسكافيه",
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: darkColor.withOpacity(0.54)),
              ),
            ),
          ),
        ),
        Positioned(
          right: -3.0,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: bgColor,
                width: 8.0,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(_screenWidth),
              ),
            ),
            child: CircleAvatar(
              backgroundColor: color,
              maxRadius: 28.0,
              child: Text(
                "$days",
                style: TextStyle(
                    color: whitishColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(2.0, 3.0),
                          blurRadius: 5.0)
                    ]),
              ),
            ),
          ),
        ),
      ],
    );
  }

  ///-----------------------------------------------------------------
  /// Function to build the Expanded widgets under the colored cards
  ///-----------------------------------------------------------------
  Widget _buildDateSection(
      {String title = "++++", String date = "13/13/2013"}) {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
//            "بدأ التحدي يوم",
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: darkColor.withOpacity(0.54),
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
//            "01/03/2019",
            date,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: darkColor,
                fontSize: 14.0,
                letterSpacing: 2.0,
                ),
          ),
        ],
      ),
    );
  }
}

///------------------------------------------------------------
///Function that builds the CircleAvatar
///------------------------------------------------------------
Widget _buildAvatar(BuildContext context, {bool toggleContent = false}) {
  double _screenWidth = MediaQuery.of(context).size.width;
  double _screenHeight = MediaQuery.of(context).size.width;
  var shownContent = !toggleContent
      ? Text(
          "ابدأ",
          style: TextStyle(
            color: whitishColor,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        )
      : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 6.0,
              ),
              Text(
                "90 / 60",
                style: TextStyle(
                  color: whitishColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 26.0,
                ),
              ),
              Text(
                "يوم",
                style: TextStyle(
                  color: darkColor.withOpacity(0.54),
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              )
            ],
          ),
        );
  return OrientationBuilder(builder: (context, orientation) {
    return Container(
      foregroundDecoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.2),
          width: 8.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(_screenWidth),
        ),
      ),
      child: CircleAvatar(
        backgroundColor: pinkishColor,
        maxRadius:
//        orientation == Orientation.portrait
            _screenWidth > _screenHeight
                ? _screenWidth * 0.35
                : _screenWidth * 0.2,
        //: _screenWidth * 0.05,
        child: shownContent,
      ),
    );
  });
}
