import 'package:flutter/material.dart';
import 'package:wa3y/colors/app-colors.dart';
import 'package:wa3y/screens/test_inside.dart';

/// List of [key : value] pairs of Tests' titles and corresponding image asset URL

List<Map<String, dynamic>> testsCards = [
  {"title": "اختبار شخصي للإدمان", "image": "assets/images/lab-exams.png"},
  {"title": "اختبار تقييم آثار ومخاطر", "image": "assets/images/couples.png"},
  {
    "title": "اختبار تقييم آثار ومخاطر البسطرمة على الشباب",
    "image": "assets/images/professor.png"
  },
];

class TestsHomeScreen extends StatefulWidget {
  @override
  _TestsHomeScreenState createState() => _TestsHomeScreenState();
}

class _TestsHomeScreenState extends State<TestsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "testsHome",
      child: Scaffold(
        appBar: AppBar(
          title: Text("اختبارات إدمان الشاي"),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < testsCards.length; i++)
                  Card(
                    margin: EdgeInsets.only(bottom: 15.0),
                    color: whitishColor,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: pinkishColor,
                        radius: 30,
                        child: Image.asset("${testsCards[i]["image"]}"),
                      ),
                      title: Text(
                        testsCards[i]["title"],
                        strutStyle:
                            StrutStyle(height: 1.6, forceStrutHeight: true),
                        style: TextStyle(
                          color: darkColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      onTap: () {
                        debugPrint("ListTile was tapped !");
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => InsideTest()));
                      },
                      contentPadding:
                          EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
