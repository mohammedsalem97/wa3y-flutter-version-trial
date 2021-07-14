import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wa3y/colors/app-colors.dart';

import 'package:wa3y/screens/settings_screen.dart';

import 'large_article_screen.dart';

List<Map<String, int>> _shareIcons = [
  //Facebook
  {
    "hexData": 0xea90,
    "color": 0xff3b5998,
  },
  //Twitter
  {
    "hexData": 0xe90e,
    "color": 0xff38A1F3,
  },
  //WhatsApp
  {
    "hexData": 0xe90f,
    "color": 0xff25D366,
  },
];

class Article extends StatefulWidget {
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  bool _isFavourite = false;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("مقال"),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          ListView(
            children: <Widget>[
              Stack(
                overflow: Overflow.visible,
                alignment: Alignment.topCenter,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      "https://i.ytimg.com/vi/BfCwN4iy6T8/maxresdefault.jpg",
                    ),
                  ),
                  Positioned(
                    top: 25.0,
                    left: 00.0,
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: _screenWidth > _screenHeight
                              ? _screenWidth / 5.0
                              : _screenWidth / 2.5),
                      color: darkColor,
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color: pinkishColor,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          Expanded(
                            child: Text(
                              "Jun 16, 2019",
                              textDirection: TextDirection.ltr,
                              strutStyle: StrutStyle(
                                  height: 1.6, forceStrutHeight: true),
                              style: TextStyle(color: Colors.white,fontSize: 14.0),
                            ),
                          ),
                          SizedBox(
                            width: 4.0,
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 5.0,
                color: pinkishColor,
              ),

              /// Title of the article
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                margin: EdgeInsets.only(bottom: 5.0),
                child: Text(
                  "عنوان المقال عنوان المقال عنوان المقال عنوان المقال عنوان المقال عنوان المقال ",
                  strutStyle: StrutStyle(
                      height: FontScaleFactor > 1.25 ? 5.0 : 1.6,
                      forceStrutHeight: true),
                  maxLines: 5,
                  style: TextStyle(
                      color: darkColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600),
                ),
              ),

              /// Share Buttons
              Card(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                elevation: 6.0,
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5000.0)),
                child: Container(
                  padding: EdgeInsets.only(top: 0.0, bottom: 0.0, right: 10.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "شارك ",
                        style: TextStyle(color: darkColor),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                color: pinkishColor.withOpacity(0.9),
                                child: IconButton(
                                  icon: Icon(Icons.share),
                                  color: Colors.white,
                                  splashColor: pinkishColor,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            ///Facebook, Twitter and Whatsapp icons
                            for (var item in _shareIcons)
                              Expanded(
                                child: Container(
                                  color: Color(item["color"]).withOpacity(0.9),
                                  child: IconButton(
                                    icon: Icon(
                                      IconData(item["hexData"],
                                          fontFamily: "Socialmedia"),
                                    ),
                                    color: Colors.white,
                                    splashColor: Color(item["color"]),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            Expanded(
                              child: Container(
//                                color: Color(0xff962FBF).withOpacity(0.9),
                                color: Color(0xffF46F30).withOpacity(0.9),
                                child: IconButton(
                                  icon: Icon(
                                    MdiIcons.instagram,
                                    size: 25.0,
                                  ),
                                  color: Colors.white,
                                  splashColor: Color(0xff962FBF),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
//                color: Colors.green,
                child: Text(
                  longString,
                  textScaleFactor: FontScaleFactor,
                  strutStyle: StrutStyle(height: 2.0, forceStrutHeight: true),
                  style: TextStyle(
                    color: darkColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _isFavourite ? Icons.favorite : Icons.favorite_border,
          size: 26.0,
          color: whitishColor,
        ),
        elevation: 20.0,
        tooltip: "إضافة للمفضلة",
        backgroundColor: pinkishColor,
        splashColor: pinkishColor,
        onPressed: () {
          setState(() {
            _isFavourite = !_isFavourite;
          });
        },
      ),
    );
  }
}
