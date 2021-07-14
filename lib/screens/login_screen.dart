import 'package:flutter/material.dart';
import 'package:wa3y/colors/app-colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return OrientationBuilder(builder: (context, orientation) {
      return Scaffold(
        backgroundColor: darkColor,
        body: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
//            color: Colors.green,
              margin: EdgeInsets.only(
                top: orientation == Orientation.landscape
                    ? MediaQuery.of(context).padding.top * 3.0
                    : 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 75.0,
                    child: Image.asset(
                      "assets/images/messenger-logo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    "برجاء إدخال كلمة السر",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      shadows: [
                        Shadow(
                            color: Colors.black.withOpacity(0.7),
                            blurRadius: 5,
                            offset: Offset(3.0, 3.0))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    width: _screenWidth * 0.92,
//                  color: Colors.orange,
                    child: Column(
                      children: <Widget>[
                        TextField(
                          style: TextStyle(
                              color: darkColor.withOpacity(0.64),
                              fontSize: 19.0),
                          cursorColor: darkColor.withOpacity(0.5),
                          textInputAction: TextInputAction.go,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(_screenWidth),
                                borderSide: BorderSide.none),
                            hintText: "كلمة السر",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10.0),
                            fillColor: bgColor,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.lock_open,
                              color: pinkishColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        RawMaterialButton(
                          onPressed: () {},
                          constraints: BoxConstraints(
                            minWidth: _screenWidth * 0.92,
                            minHeight: 45.0,
                          ),
                          child: Text("تسجيل الدخول"),
                          fillColor: pinkishColor,
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontFamily: "Jozoor",
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(_screenWidth)),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
