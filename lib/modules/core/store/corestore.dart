import 'package:puppeteer/puppeteer.dart';

class CoreStore {
  static Page? currentPage;
  static Map<String, dynamic> data = {};
  static List<String> rapidTagsKeywords = [];
  static List<String> keywordToolsKeywords = [];
}
