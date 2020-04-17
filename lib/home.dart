
import 'package:flutter/material.dart';
import 'package:flutterloc/localization/localizations.dart';
import 'package:flutterloc/localization/scope_model_wrapper.dart';
import 'package:flutterloc/localization/scoped_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _appLocale;

  @override
  void initState() {
    _appLocale = Locale('en');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Center(child: Text(AppLocalizations.of(context).translate('hometitle'),),),),
      drawer: _drawDrawerBody(context),
      body: Center(child: Text('Home Page'),),);
  }

  Widget _drawDrawerBody(BuildContext context) {
    return Drawer(child: Column(children: <Widget>[
      Container(height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        color: Colors.blueAccent,
        child: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),),
          backgroundColor: Colors.transparent,
          elevation: 0,),),
      ListView(shrinkWrap: true,
        children: <Widget>[
          ScopedModelDescendant<AppModel>(builder: (context, child, model) =>
              FlatButton(
                  child: Text(AppLocalizations.of(context).translate('lang')),
                  onPressed: () {
                    model.changeDirection();
                  })),

          ListTile(title: Text(AppLocalizations(_appLocale).translate('item1')),
            leading: Icon(Icons.layers, color: Theme.of(context).primaryColor,),
            onTap: () {},),
          ListTile(title: Text(AppLocalizations.of(context).translate('item2')),
            leading: Icon(Icons.layers, color: Theme.of(context).primaryColor,),
            onTap: () {},),
          ListTile(title: Text(AppLocalizations.of(context).translate('item3')),
            leading: Icon(Icons.layers, color: Theme.of(context).primaryColor,),
            onTap: () {},),
          ListTile(title: Text(AppLocalizations.of(context).translate('item4')),
            leading: Icon(Icons.layers, color: Theme.of(context).primaryColor,),
            onTap: () {},),
        ],)
    ],),); //_drawDrawerBody(context),
  }
}
