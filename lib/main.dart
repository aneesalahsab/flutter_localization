import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterloc/home.dart';
import 'package:flutterloc/localization/localizations.dart';
import 'package:flutterloc/localization/scope_model_wrapper.dart';
import 'package:flutterloc/localization/scoped_model.dart';

void main() => runApp(new ScopeModelWrapper());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(builder: (context, child, model) =>
        MaterialApp(locale: model.appLocal,
          localizationsDelegates: [
            const AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [const Locale('ar', ''), // Arabic
            const Locale('en', ''), // English
          ],
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue,),
          title: "Arabic Flutter",
          home: MyHomePage(),),
    );
  }
}

class MyHomePage extends StatefulWidget {
//    notifyListeners();
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(leading: ScopedModelDescendant<AppModel>(
        builder: (context, child, model) =>
            IconButton(icon: Icon(Icons.translate), onPressed: () {
              model.changeDirection();
            })),

      title: Center(
          child: Text(AppLocalizations.of(context).translate('title'))),),
      body: Center(child: Container(
        color: Colors.blueAccent, child: FlatButton.icon(onPressed: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()),);
      },
        icon: Icon(Icons.home),
        label: Text(AppLocalizations.of(context).translate('gotohome')),),),),);
  }
}
