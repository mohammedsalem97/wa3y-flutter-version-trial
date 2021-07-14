import 'package:flutter/material.dart';
import 'package:wa3y/colors/app-colors.dart';
import 'package:wa3y/screens/test_result_screen.dart';

class InsideTest extends StatefulWidget {
  @override
  _InsideTestState createState() => _InsideTestState();
}

class _InsideTestState extends State<InsideTest> {
  final int _itmesCount = 5;
  ScrollController _listViewScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return Hero(
      tag: "testsHome",
      child: Scaffold(
        appBar: AppBar(
          title: Text("داخل الاختبار"),
        ),
        body: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: _listViewScrollController,
            itemCount: _itmesCount,
            itemBuilder: (context, index) {
              return Container(
                width: _screenWidth,
                child: Center(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
                    child: Container(
                      width: _screenWidth * 0.95,
                      height: null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Card(
                            clipBehavior: Clip.antiAlias,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 15.0),
                              width: _screenWidth * 0.95,

                              height: null,
                              child: Center(
                                child: Text(
                                  "سؤال معقول سؤال معقول سؤال معقول سؤال معقول سؤال معقول سؤال معقول سؤال معقول سؤال معقول سؤال معقول سؤال معقول سؤال معقول سؤال معقول",
                                  textAlign: TextAlign.center,
                                  strutStyle: StrutStyle(
                                      height: 1.9, forceStrutHeight: true),
                                  style: TextStyle(
                                      color: darkColor.withOpacity(0.65),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                              ),
                              color: whitishColor,
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),

                          /// The First Button [YES]
                          RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                _nextQuestion(context: context, index: index);
                              });
                            },
                            fillColor: darkColor,
                            textStyle: TextStyle(
                                color: whitishColor,
                                fontFamily: "Jozoor",
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.check_circle_outline,
                                    size: 21.0,
                                    color: whitishColor,
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Text("نعـم"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),

                          /// The Second Button [NO]
                          RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                _nextQuestion(context: context, index: index);
                              });
                            },
                            fillColor: pinkishColor,
                            textStyle: TextStyle(
                                color: whitishColor,
                                fontFamily: "Jozoor",
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.highlight_off,
                                    size: 21.0,
                                    color: whitishColor,
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Text("لا"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Text(
                            "$_itmesCount / ${index + 1}",
                            style:
                                TextStyle(color: pinkishColor, fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  ///Function to handle the Scrolling of the question
  void _nextQuestion({int index, BuildContext context}) {
    if (index != this._itmesCount - 1) {
      _listViewScrollController.animateTo(
        _listViewScrollController.offset + MediaQuery.of(context).size.width,
        duration: Duration(milliseconds: 500),
//      curve: Curves.fastLinearToSlowEaseIn,
        curve: index == 0 ? Curves.easeOut : Curves.easeInOutQuint,

        /// FASHEEKHA
      );
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => TestResult()));
    }
  }
}
