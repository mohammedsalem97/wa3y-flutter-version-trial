import 'package:flutter/material.dart';
import 'package:wa3y/colors/app-colors.dart';
import 'package:wa3y/helper_files/drawer-element-mapping.dart';

class FavouritesScreen extends StatefulWidget {
  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  bool favFound = false;

  @override
  Widget build(BuildContext context) {
    var _content = favFound
        ? ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
            physics: BouncingScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.only(bottom: 10.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                elevation: 3.0,
                color: index.isOdd ? Colors.grey[100] : Colors.white,
                child: InkWell(
                  onTap: () {},
                  splashColor: pinkishColor.withOpacity(0.5),
                  child: Container(
//                color: Colors.green,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
                    child: Center(
                      child: Text(
                        "عنصر من عناصر المفضلة",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Center(
            child: Text(
              "لا توجد عناصر في المفضلة",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
          );
    return Scaffold(
      drawerScrimColor: darkColor.withOpacity(0.9),
      endDrawer: MyDrawer(),
      appBar: AppBar(
        elevation: 5.0,
        iconTheme: IconThemeData(color: darkColor, size: 25.0),
        backgroundColor: whitishColor,
        automaticallyImplyLeading: true,
        title: GestureDetector(
          onTap: () {
            setState(() {
              favFound = !favFound;
            });
          },
          child: Text(
            "المفضلة",
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: darkColor,
            ),
          ),
        ),
      ),
      body: _content,
    );
  }
}
