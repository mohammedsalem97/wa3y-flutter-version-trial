import 'package:flutter/material.dart';
import 'package:wa3y/colors/app-colors.dart';
import 'package:fluttery_seekbar/fluttery_seekbar.dart';
import 'package:wa3y/screens/tests_home_screen.dart';

class TestResult extends StatelessWidget {
  final double _percent = 0.94;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("نتيجة الاختبار"),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 32.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: orientation == Orientation.portrait
                            ? _screenWidth * 0.7
                            : _screenWidth * 0.35,
                        height: orientation == Orientation.portrait
                            ? _screenWidth * 0.7
                            : _screenWidth * 0.35,
                        child: Transform.rotate(
                          angle: 0.0,
                          child: RadialSeekBar(
                            progress: _percent,
                            progressColor: pinkishColor,
                            trackColor: Colors.grey[300],
                            trackWidth: 10.0,
                            progressWidth: 15.0,
                          ),
                        ),
                      ),
                      Container(
                        foregroundDecoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black.withOpacity(0.2),
                            width: 8.0,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(_screenWidth),
                          ),
                        ),
                        child: Hero(
                          tag: "testsHome",
                          child: CircleAvatar(
                            backgroundColor: pinkishColor,
                            maxRadius: orientation == Orientation.portrait
                                ? _screenWidth * 0.2
                                : _screenWidth * 0.105,
                            child: Text(
                              "% ${(_percent * 100.0).toInt()}",
                              style: TextStyle(
                                color: whitishColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.0,
                  ),

                  /// First Line
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "نسبة الإدمان :",
                          style: TextStyle(
                              color: darkColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "% ${(_percent * 100).toInt()}",
                          style: TextStyle(
                              color: pinkishColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),

                  /// Second Line
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "الحالة :",
                          style: TextStyle(
                              color: darkColor,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          "مدمن أوي فشخ",
                          style: TextStyle(
                              color: pinkishColor,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TestsHomeScreen()));
                    },
                    color: darkColor,
                    textColor: whitishColor,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 60.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(500.0)),
                    child: Text(
                      "العودة للاختبارات",
                      style: TextStyle(
                          color: whitishColor, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
