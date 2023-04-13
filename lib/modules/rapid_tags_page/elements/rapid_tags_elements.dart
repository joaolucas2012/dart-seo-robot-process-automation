import 'package:dart_seo_robot/modules/config.dart';
import 'package:dart_seo_robot/modules/core/store/corestore.dart';
import 'package:dart_seo_robot/modules/shared/classes/navigator.dart';
import 'package:dart_seo_robot/modules/shared/utils/delay.dart';
import 'package:dart_seo_robot/modules/shared/utils/evaluate_enum.dart';
import 'package:dart_seo_robot/modules/shared/utils/xpaths_enum.dart';
import 'package:puppeteer/puppeteer.dart';

class RapidTagsElements {
  late ElementHandle inputKeywordEl;
  late ElementHandle searchButtonEl;
  late ElementHandle resultingKeywordsDivEl;

  Future<void> _initialize() async {
    await Time.delay(2);
    inputKeywordEl =
        await Navigator().getElement(Xpaths.inputKeywordElRapid.value);

    searchButtonEl =
        await Navigator().getElement(Xpaths.searchButtonElRapid.value);

    resultingKeywordsDivEl =
        await Navigator().getElement(Xpaths.resultingKeywordsDivElRapid.value);
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
      await Time.delay(3);

      final result = List<String>.from(await resultingKeywordsDivEl
          .evaluate<List>(Evaluates.getRapidTagsResult.value)
          .then((value) => value as List));

      CoreStore.rapidTagsKeywords.addAll(result);
    } catch (e, s) {
      print("$e $s");
    }
  }

  Future<void> build() async {
    await _initialize();
    await _searchKeyWord();
    await _getKeywordsFromResult();
  }
}
