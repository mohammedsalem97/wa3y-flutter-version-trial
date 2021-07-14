import 'package:flutter/material.dart';

import 'package:wa3y/colors/app-colors.dart';
import 'package:wa3y/helper_files/drawer-element-mapping.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawerScrimColor: darkColor.withOpacity(0.9),
      endDrawer: MyDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "الرئيسية",
          textDirection: TextDirection.rtl,
        ),
      ),
      body: Container(
        width: _screenWidth,
        child: OrientationBuilder(
          builder: (context, orientation) {
            return GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
              shrinkWrap: false,
              childAspectRatio: 1,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 3.0,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 3.0),
              children: <Widget>[
                for (int i = 0; i < homeScreenListItems.length; i++)
                  Card(
                    margin: EdgeInsets.all(3.0),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    elevation: 10.0,
                    child: Container(
                      color: Colors.white,
                      width: 100.0,
                      height: 100.0,
                      child: InkWell(
                        onTap: () {
                          debugPrint(
                              "${homeScreenListItems[i]["title"]} was tapped");
                        },
                        splashColor: pinkishColor.withOpacity(0.5),
                        highlightColor: pinkishColor.withOpacity(0.5),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "${homeScreenListItems[i]["image"]}",
                                width: 70.0,
                                height: 70.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "${homeScreenListItems[i]["title"]}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                strutStyle: StrutStyle(
                                    height: 1.3, forceStrutHeight: true),
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.0,
                                  color: darkColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}

///The kist of (key:value) pairs known as [Map]
///Contains the titles and the corresponding image asset URL to each
///element of the [HomeScreen] GridView

List<Map<String, dynamic>> homeScreenListItems = [
  {
    "title": "حكايتنا",
    "image": "assets/images/story.png",
  },
  {
    "title": "الأضرار الكاملة للبسطرمة",
    "image": "assets/images/analysis.png",
  },
  {
    "title": "كيف تقلع عن البسطرمة",
    "image": "assets/images/cup.png",
  },
  {
    "title": "للفتيات فقط",
    "image": "assets/images/girls.png",
  },
  {
    "title": "للمتزوجين  فقط",
    "image": "assets/images/couples.png",
  },
  {
    "title": "كيف توقف النزيف",
    "image": "assets/images/fight.png",
  },
  {
    "title": "ماذا تفعل بعد الافتكاسة",
    "image": "assets/images/go-back.png",
  },
  {
    "title": "هوايات وعادات",
    "image": "assets/images/calendar.png",
  },
  {
    "title": "دليل الآباء لحماية الأبناء",
    "image": "assets/images/professor.png",
  },
  {
    "title": "عداد الـ90 يوماُ",
    "image": "assets/images/counter90.png",
  },
  {
    "title": "سؤال وجواب",
    "image": "assets/images/QandA.png",
  },
  {
    "title": "محاضرات صوتية",
    "image": "assets/images/sound-lectures.png",
  },
  {
    "title": "برنامج العلاج",
    "image": "assets/images/cure-program.png",
  },
  {
    "title": "أدوات مساعدة",
    "image": "assets/images/life-saver.png",
  },
];
