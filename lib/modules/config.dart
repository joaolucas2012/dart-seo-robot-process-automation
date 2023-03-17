import 'package:dart_seo_robot/env.dart';

abstract class Config {
  static String get url => URL;

  static String get searchKey => SEARCH_KEY;

  static bool get isHeadless => IS_HEADLESS;
}
