import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wa3y/colors/app-colors.dart';
import 'package:wa3y/screens/all_categories_screen.dart';
import 'package:wa3y/screens/article_screen.dart';
import 'package:wa3y/screens/favourites_screen.dart';
import 'package:wa3y/screens/home-screen.dart';
import 'package:wa3y/screens/large_article_screen.dart';
import 'package:wa3y/screens/listed_cards_subjects.dart';
import 'package:wa3y/screens/login_screen.dart';
import 'package:wa3y/screens/ninty_day_counter.dart';
import 'package:wa3y/screens/settings_screen.dart';
import 'package:wa3y/screens/test_inside.dart';
import 'package:wa3y/screens/test_result_screen.dart';
import 'package:wa3y/screens/tests_home_screen.dart';

////////////////////////////////////////////////////////////////
///////////////////////// =====THE CLASS======//////////////////
class NavigateTo {
  final String title;

  final bool onlyPop;
  final bool onlyPush;
  final bool pushAndReplace;
  final bool popThenPush;
  final IconData icon;
  final Widget route;
  Function onPressed;

  NavigateTo( //BuildContext context,
      {
    this.title = "الرئيسية",
    this.onlyPop = false,
    this.onlyPush = false,
    this.pushAndReplace = false,
    this.icon = Icons.add,
    this.popThenPush = false,
    this.route = const HomeScreen(),
  }) {
    this.onPressed = (BuildContext context) {
//    BuildContext context;
      if (this.onlyPop) {
        Navigator.pop(context);
        debugPrint("I POPPED OUT !!");
      } else if (this.onlyPush) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => route),
        );
        debugPrint("I'm gonna to ${this.route} !");
      } else if (this.pushAndReplace) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => route),
        );
        debugPrint("I'm gonna to ${this.route} !");
      } else if (this.popThenPush) {
        Navigator.pop(context);

        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => route),
        );
        debugPrint("I'm gonna to ${this.route} !");
      }
    };
  }
}

/////////////////////////////////////////////////////////////////
/////////////////////////////Custom Drawer Widget///////////////////////
class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Container(
        color: darkColor,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              color: bgColor,
              child: ListTile(
                title: Text(
                  "واعي",
                  style: TextStyle(
                      color: darkColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    "assets/images/messenger-logo.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                addRepaintBoundaries: false,
                itemCount: drawerTiles.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: index.isOdd
                        ? Colors.black.withOpacity(0.1)
                        : Colors.transparent,
                    child: ListTile(
                      title: Text(
                        drawerTiles[index].title,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.normal),
                      ),
                      leading: Icon(
                        drawerTiles[index].icon,
                        color: pinkishColor,
                      ),
                      onTap: () => drawerTiles[index].onPressed(context),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  },
}

/////////////////////////////////////////////////////////////////
/////////////////////====ThE LIST OF CLASSES====/////////////////
List<NavigateTo> drawerTiles = [
  NavigateTo(title: "الرئيسية", onlyPop: true, icon: Icons.home),
  NavigateTo(
      title: "العداد",
      icon: MdiIcons.counter,
      popThenPush: true,
      route: Counter90()),
  NavigateTo(
      title: "صفحة بقوائم",
      icon: MdiIcons.newspaper,
      popThenPush: true,
      route: ListedCardsBySubjects()),
  NavigateTo(
      title: "اختبارات الإدمان",
      icon: MdiIcons.testTube,
      popThenPush: true,
      route: TestsHomeScreen()),
  NavigateTo(
      title: "صفحة مقال طويل",
      icon: MdiIcons.commentText,
      popThenPush: true,
      route: LargeArticleScreen()),
  NavigateTo(
      title: "داخل الاختبار",
      icon: MdiIcons.selectionEllipseArrowInside,
      popThenPush: true,
      route: InsideTest()),
  NavigateTo(
      title: "نتيجة الاختبار",
      icon: MdiIcons.chartBarStacked,
      popThenPush: true,
      route: TestResult()),
  NavigateTo(
      title: "الإعدادات",
      icon: MdiIcons.settings,
      popThenPush: true,
      route: SettingsScreen()),
  NavigateTo(
      title: "جميع الأقسام",
      icon: MdiIcons.formatListBulleted,
      popThenPush: true,
      route: AllCategories()),
  NavigateTo(
      title: "تسجيل الدخول",
      icon: MdiIcons.login,
      popThenPush: true,
      route: LoginScreen()),
  NavigateTo(
      title: "مقال", icon: MdiIcons.book, popThenPush: true, route: Article()),
  NavigateTo(
      title: "المفضلة",
      icon: MdiIcons.heart,
      popThenPush: true,
      route: FavouritesScreen()),
];
