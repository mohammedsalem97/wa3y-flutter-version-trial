import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wa3y/colors/app-colors.dart';

double FontScaleFactor = 1.0;

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _lockEnable = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ///Function triggered when the [Switch] value changed
  void _onChange(bool value) {
    setState(() {
      _lockEnable = value;
      debugPrint("///////////////////////\n===>value is $_lockEnable");
    });
  }

  ///Function triggered when the [SeekBar] value changed
  void _onChangeFontSize(double value) {
    setState(() {
      FontScaleFactor = value;
      debugPrint("===========\n===>value is $FontScaleFactor");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("الإعدادات"),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
            child: ListTile(
              title: Text(
                "قفل التطبيق بكلمة سـر",
                style: TextStyle(fontWeight: FontWeight.bold, color: darkColor),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              onTap: () {
                setState(() {
                  _lockEnable = !_lockEnable;
                });
                showDialog(
                    context: context,
                    builder: (context) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                        child: Dialog(
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Container(
                            decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            padding: EdgeInsets.all(0.0),
                            constraints: BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height >
                                      MediaQuery.of(context).size.width
                                  ? MediaQuery.of(context).size.height / 1.5
                                  : MediaQuery.of(context).size.height / 1.2,
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.95,
                            ),
                            child: Center(
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "قفل التطبيق بكلمة سر",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: darkColor),
                                      strutStyle: StrutStyle(
                                          height: 2.0, forceStrutHeight: true),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      "برجاء إدخال كلمة سر القفل",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.0,
                                          color: pinkishColor.withOpacity(0.8)),
                                      strutStyle: StrutStyle(
                                          height: 2.0, forceStrutHeight: true),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: "كلمة السر",
                                            contentPadding:
                                                EdgeInsets.all(10.0)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: "إعادة كتابة كلمة السر",
                                            contentPadding:
                                                EdgeInsets.all(10.0)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40.0,
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          FlatButton(
                                            onPressed: () {},
                                            child: Text(
                                              "حفظ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            color: darkColor,
                                            splashColor: pinkishColor,
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "إلغاء",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            color: pinkishColor,
                                            splashColor: pinkishColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              },
              trailing: Switch(
                value: _lockEnable,
                onChanged: (value) {
                  _onChange(value);
                },
                activeColor: pinkishColor,
              ),
            ),
          ),
          Container(
//            color: Colors.green,
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            margin: EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "حجم الخط داخل المقال",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: darkColor),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.font_download, size: 20.0, color: darkColor),
                      Expanded(
                        child: Slider(
                          max: 2.0,
                          min: 1,
                          divisions: 4,
                          inactiveColor: darkColor,
                          activeColor: pinkishColor,
                          label: "$FontScaleFactor",
                          value: FontScaleFactor,
                          onChanged: (double value) {
                            _onChangeFontSize(value);
                          },
                        ),
                      ),
                      Icon(Icons.font_download, size: 30.0, color: darkColor),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.0,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: Text(
                "حجم الخط",
                textScaleFactor: FontScaleFactor,
                style: TextStyle(
                  color: darkColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
          )
        ],
      ),
    );
  }
}
