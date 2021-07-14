import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wa3y/screens/home-screen.dart';

import 'colors/app-colors.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      color: darkColor,
      title: "واعي",
      theme: ThemeData(
        fontFamily: "Jozoor",
        accentColor: Colors.transparent,
        primaryColor: darkColor,
        textSelectionColor: yellowishColor.withOpacity(0.5),
        textSelectionHandleColor: pinkishColor,
        tooltipTheme:
            TooltipThemeData(decoration: BoxDecoration(color: pinkishColor)),
        appBarTheme: AppBarTheme(
            textTheme: TextTheme(
              title: TextStyle(
                color: whitishColor,
                fontFamily: "Jozoor",
                fontWeight: FontWeight.normal,
                fontSize: 16.0,
              ),
            ),
            color: darkColor,
            iconTheme: IconThemeData(color: whitishColor, size: 25.0),
            elevation: 0.0),
        scaffoldBackgroundColor: bgColor,
        cardTheme: CardTheme(
          elevation: 5.0,
          color: whitishColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),

      /// Localization Settings
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("ar", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("ar", "IR"),
      // OR Locale('ar', 'AE') OR Other RTL locales,
      home: HomeScreen(),
    ),
  );
}
