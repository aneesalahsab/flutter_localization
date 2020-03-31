import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterloc/home.dart';
import 'package:flutterloc/localization/localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('ar', 'SA'),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage() ;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(AppLocalizations.of(context).translate('title'))),
      ),
      body: Center(
        child: Container(
           color: Colors.blueAccent,
          child: FlatButton.icon(
            onPressed: () {           Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen(
                  )),
            );},
            icon: Icon(Icons.home),
            label: Text(AppLocalizations.of(context).translate('gotohome')),
          ),
        ),
      ),
    );
  }
}
