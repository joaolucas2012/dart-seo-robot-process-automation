import 'package:dart_seo_robot/modules/config.dart';
import 'package:dart_seo_robot/modules/core/store/corestore.dart';
import 'package:dart_seo_robot/modules/shared/classes/navigator.dart';
import 'package:dart_seo_robot/modules/shared/utils/delay.dart';
import 'package:dart_seo_robot/modules/shared/utils/evaluate_enum.dart';
import 'package:dart_seo_robot/modules/shared/utils/xpaths_enum.dart';
import 'package:puppeteer/puppeteer.dart';

class KeywordToolsElements {
  late ElementHandle inputKeywordEl;
  late ElementHandle searchButtonEl;
  late ElementHandle resultingKeywordsDivEl;

  Future<void> build() async {
    await _initialize();
    await _searchKeyWord();
    await _getKeywordsFromResult();
  }

  Future<void> _initialize() async {
    await Time.delay(2);
    inputKeywordEl =
        await Navigator().getElement(Xpaths.inputKeywordElTools.value);

    searchButtonEl =
        await Navigator().getElement(Xpaths.searchButtonElTools.value);
  }

  Future<void> _searchKeyWord() async {
    try {
      await inputKeywordEl.type(Config.searchKey);
      await searchButtonEl.click();
    } catch (e, s) {
      print("$e $s");
    }
  }

  Future<void> _getKeywordsFromResult() async {
    try {
      await Time.delay(4);

      resultingKeywordsDivEl = await Navigator()
          .getElement(Xpaths.resultingKeywordsDivElTools.value);

      final result = List<String>.from(await resultingKeywordsDivEl
          .evaluate<List>(Evaluates.getResults.value)
          .then((value) => value as List));

      CoreStore.keywordToolsKeywords.addAll(result);
    } catch (e, s) {
      print("$e $s");
    }
  }
}
