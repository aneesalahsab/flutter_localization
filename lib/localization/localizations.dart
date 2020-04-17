import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Localization',
      'hometitle': 'Main',
      'gotohome': 'Go To Home',
      'item1': 'Item 1',
      'item2': 'Item 2',
      'item3': 'Item 3',
      'item4': 'Item 4', 'lang': 'عربي',

    },
    'ar': {
      'title': ' اللغات',
      'hometitle': 'الرئيسية',
      'gotohome': 'اذهب الى الرئيسية',
      'item1': 'العنصر 1',
      'item2': 'العنصر 2',
      'item3': 'العنصر 3',
      'item4': 'العنصر 4', 'lang': 'English',

    },
  };

  String translate(key) {
    return _localizedValues[locale.languageCode][key];
  }

  static Stringof(BuildContext context, String key) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)
        .translate(key);
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
