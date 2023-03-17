import 'package:dart_seo_robot/modules/config.dart';
import 'package:dart_seo_robot/modules/core/store/corestore.dart';
import 'package:dart_seo_robot/modules/shared/classes/navigator.dart';
import 'package:dart_seo_robot/modules/shared/utils/delay.dart';
import 'package:puppeteer/puppeteer.dart';

class KeywordToolsElements {
  late ElementHandle inputKeywordEl;
  late ElementHandle searchButtonEl;
  late ElementHandle resultingKeywordsDivEl;

  Future<void> _initialize() async {
    await Time.delay(2);
    inputKeywordEl = await Navigator().getElementByXpath(
        "/html/body/div[2]/main/div[1]/div/div/div/div/div/div/div[3]/div/form/div/div[1]/input");

    searchButtonEl = await Navigator().getElementByXpath(
        "/html/body/div[2]/main/div[1]/div/div/div/div/div/div/div[3]/div/form/div/div[3]/button");
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

      resultingKeywordsDivEl = await Navigator().getElementByXpath(
          "/html/body/div[2]/main/div/div/div/div/div[2]/div/div[4]/div[1]/div/div/table/tbody");

      final result =
          List<String>.from(await resultingKeywordsDivEl.evaluate<List>('''
node => {
  let keywords = [];
  for(let i = 0; i<10; i++){
      keywords.push(node.children[i].children[1].innerText);
  }

  return keywords;
}''').then((value) => value as List));

      CoreStore.keywordToolsKeywords.addAll(result);
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
