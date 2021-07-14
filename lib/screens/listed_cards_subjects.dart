import 'package:flutter/material.dart';
import 'package:wa3y/colors/app-colors.dart';

import 'article_screen.dart';

class ListedCardsBySubjects extends StatefulWidget {
  @override
  _ListedCardsBySubjectsState createState() => _ListedCardsBySubjectsState();
}

class _ListedCardsBySubjectsState extends State<ListedCardsBySubjects> {
  ///This function is responsible to build cards which are being shown when
  ///there is an internet connection case
  Widget _buildCard(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Article(),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.only(
          bottom: 15.0,
        ),
        clipBehavior: Clip.antiAlias,
        elevation: 15.0,
        child: Container(
          height: 110.0,
          color: whitishColor,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.network(
                    "https://www.lalalounger.com/wp-content/uploads/2017/09/0052-zigzag-pink-gallery-2-900x900-1.jpg",
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "أحلى عنوان لأحلى مقال في أحلى أبلكيشن",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: darkColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                        strutStyle:
                            StrutStyle(height: 1.6, forceStrutHeight: true),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color: Colors.grey[400],
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "2019-09-15",
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 14.0),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool IsNetwork = false;
  bool _searchField = false;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    var _contentShown = IsNetwork
        ? ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 20,
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 25.0),
            itemBuilder: (context, index) {
              return _buildCard(context);
            },
          )
        : Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 15.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
//                      Icon(Icons.highlight_off),
//                      Icon(Icons.perm_scan_wifi),
                      Icon(
                        Icons.signal_wifi_off,
                        size: 120.0,
                        color: darkColor.withOpacity(0.5),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        "خطأ, لا يوجد اتصال بالإنترنت برجاء التحقق من اتصالك بالإنترنت.",
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        strutStyle:
                            StrutStyle(height: 2.0, forceStrutHeight: true),
                        style: TextStyle(color: darkColor, fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      RaisedButton(
                        color: darkColor,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        textColor: whitishColor,
                        child: Text(
                          "إعـادة المـحاولة",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 14.0),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
//        Container();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: GestureDetector(
          onTap: () {
            setState(() {
              IsNetwork = !IsNetwork;
            });
          },
          child: Text(
            "مقالات",
            textDirection: TextDirection.rtl,
          ),
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(left: 20.0),
            tooltip: "بحث",
            onPressed: () {},
            icon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _searchField = !_searchField;
                });
              },
            ),
          ),
        ],
        bottom: _searchField
            ? PreferredSize(
                child: Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 20.0),
                    color: pinkishColor,
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: TextField(
                              cursorColor: whitishColor,
                              cursorWidth: 1.0,
                              style: TextStyle(
                                  color: whitishColor, fontSize: 14.0),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 10.0),
                                  hintText: "كلمة البحث...",
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(style: BorderStyle.none)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(style: BorderStyle.none)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(style: BorderStyle.none)),
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.7))),
                              textInputAction: TextInputAction.search,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                preferredSize: Size(_screenWidth, 50.0),
              )
            : PreferredSize(
                child: Container(), preferredSize: Size(_screenWidth, 0.0)),
      ),
      body: _contentShown,
    );
  }
}
