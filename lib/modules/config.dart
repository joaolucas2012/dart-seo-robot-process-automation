import 'package:dart_seo_robot/env.dart';

abstract class Config {
  static String get urlRapidTags => URL_RT;

  static String get urlKeywordTools => URL_KT;

  static String get searchKey => SEARCH_KEY;

  static bool get isHeadless => IS_HEADLESS;
}
