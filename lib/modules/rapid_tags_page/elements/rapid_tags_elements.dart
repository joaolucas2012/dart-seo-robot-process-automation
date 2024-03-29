import 'package:dart_seo_robot/modules/shared/utils/store/corestore.dart';
import 'package:dart_seo_robot/modules/shared/classes/navigator.dart';
import 'package:dart_seo_robot/modules/shared/interfaces/activity_interface.dart';
import 'package:dart_seo_robot/modules/shared/utils/functions/print_colored.dart';
import 'package:dart_seo_robot/modules/shared/utils/functions/delay.dart';
import 'package:dart_seo_robot/modules/shared/utils/enumerators/evaluate_enum.dart';
import 'package:dart_seo_robot/modules/shared/utils/enumerators/xpaths_enum.dart';
import 'package:puppeteer/puppeteer.dart';

class RapidTagsElements extends Activity {
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
        await Navigator().getElement(Xpaths.inputKeywordRapid.value);

    searchButtonEl = await Navigator().getElement(Xpaths.searchBtnRapid.value);

    resultingKeywordsDivEl =
        await Navigator().getElement(Xpaths.resultingKeywordsDivElRapid.value);
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
      await delay(3);

      final result = List<String>.from(await resultingKeywordsDivEl
          .evaluate<List>(Evaluates.getRapidTagsResult.value)
          .then((value) => value as List));

      CoreStore.rapidTagsKeywords.addAll(result);
    } catch (e, s) {
      printError("$e $s");
    }
  }
}
