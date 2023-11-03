import 'package:dart_seo_robot/modules/shared/utils/store/corestore.dart';
import 'package:dart_seo_robot/modules/shared/classes/navigator.dart';
import 'package:dart_seo_robot/modules/shared/interfaces/activity_interface.dart';
import 'package:dart_seo_robot/modules/shared/utils/functions/print_colored.dart';
import 'package:dart_seo_robot/modules/shared/utils/functions/delay.dart';
import 'package:dart_seo_robot/modules/shared/utils/enumerators/evaluate_enum.dart';
import 'package:dart_seo_robot/modules/shared/utils/enumerators/xpaths_enum.dart';
import 'package:puppeteer/puppeteer.dart';

class KeywordToolsElements extends Activity {
  late ElementHandle inputKeywordEl;
  late ElementHandle searchButtonEl;
  late ElementHandle resultingKeywordsDivEl;

  @override
  Future<void> start() async {
    await _initialize();
    await _searchKeyWord();
    await _getKeywordsFromResult();
  }

  Future<void> _initialize() async {
    await delay(2);
    inputKeywordEl =
        await Navigator().getElement(Xpaths.inputKeywordTools.value);

    searchButtonEl = await Navigator().getElement(Xpaths.searchBtnTools.value);
  }

  Future<void> _searchKeyWord() async {
    try {
      await inputKeywordEl.type(CoreStore.keywordEntry);
      await searchButtonEl.click();
    } catch (e, s) {
      printError("$e $s");
    }
  }

  Future<void> _getKeywordsFromResult() async {
    try {
      await delay(4);

      resultingKeywordsDivEl =
          await Navigator().getElement(Xpaths.resultingKeywordsDivTools.value);

      final result = List<String>.from(await resultingKeywordsDivEl
          .evaluate<List>(Evaluates.getResults.value)
          .then((value) => value as List));

      CoreStore.keywordToolsKeywords.addAll(result);

      print(CoreStore.keywordToolsKeywords);
    } catch (e, s) {
      printError("$e $s");
    }
  }
}
