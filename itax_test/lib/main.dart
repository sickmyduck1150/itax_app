import 'package:flutter/material.dart';
import 'package:itax_test/widget/login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  // Intl.defaultLocale = "TH";
  // initializeDateFormatting();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
            child: child,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0));
      },
      //locale: const Locale('th', 'TH'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('th', 'TH'), // Thai
      ],
      home: Login(),
      theme: ThemeData(fontFamily: 'Mitr'),
      debugShowCheckedModeBanner: false,
    );
  }
}
