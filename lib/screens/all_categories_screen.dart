import 'package:flutter/material.dart';
import 'package:wa3y/colors/app-colors.dart';

class AllCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("جميع الأقسام"),
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 10.0),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              color: index.isOdd ? Colors.grey[100] : Colors.white,
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              margin: EdgeInsets.only(bottom: 5.0),
              child: ListTile(
                title: Text(
                  "قسم من الأقسام",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: darkColor.withOpacity(0.75)),
                ),
                leading: Icon(
                  Icons.arrow_back_ios,
                  color: index.isEven ? pinkishColor : darkColor,
                  size: 20.0,
                ),
                onTap: () {},
              ),
            );
          }),
    );
  }
}
