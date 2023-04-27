import 'package:dart_seo_robot/modules/env.dart';

abstract class Config {
  static String get searchKey => SEARCH_KEY;

  static bool get isHeadless => IS_HEADLESS;
}
