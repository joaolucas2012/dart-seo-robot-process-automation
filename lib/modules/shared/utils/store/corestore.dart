import 'package:dart_seo_robot/modules/shared/utils/log_type.dart';
import 'package:puppeteer/puppeteer.dart';

class CoreStore {
  static Page? currentPage;
  static String keywordEntry = "";
  static bool isHeadless = false;
  static Map<String, dynamic> data = {};
  static List<String> rapidTagsKeywords = [];
  static List<String> keywordToolsKeywords = [];
  static Map<LogType, dynamic> possiblePrints = {};
}
