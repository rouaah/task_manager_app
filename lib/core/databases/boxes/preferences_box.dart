import 'dart:developer';
// ignore: depend_on_referenced_packages
import 'package:colorize/colorize.dart';

import 'package:hive_flutter/hive_flutter.dart';

class PreferencesBox {
  static const boxName = 'preferencesBox';
  static const languageCode = 'languageCode';

  final Box box;
  const PreferencesBox(this.box);

  int getLanguageCode() => box.get(languageCode, defaultValue: 1);
  setLanguage(int newLanguageCode) => _setValue(languageCode, newLanguageCode);

  _setValue(String key, Object value) async {
    box.put(key, value);
    final coloredMessage = Colorize('$key : $value saved now!').apply(Styles.RED);
    log('$coloredMessage');
  }
}
