import 'package:dart_seo_robot/modules/config.dart';
import 'package:dart_seo_robot/modules/core/store/corestore.dart';
import 'package:dart_seo_robot/modules/shared/classes/navigator.dart';
import 'package:dart_seo_robot/modules/shared/utils/delay.dart';
import 'package:puppeteer/puppeteer.dart';

class RapidTagsElements {
  late ElementHandle inputKeywordEl;
  late ElementHandle searchButtonElXpath;
  late ElementHandle resultingKeywordsDivEl;

  Future<void> _initialize() async {
    await Time.delay(2);
    inputKeywordEl = await Navigator()
        .getElementByXpath("/html/body/form/div/div[1]/label/input");

    searchButtonElXpath = await Navigator()
        .getElementByXpath("/html/body/form/div/div[1]/label/button");

    resultingKeywordsDivEl = await Navigator()
        .getElementByXpath("/html/body/form/div/div[2]/div/div[1]");
  }

  Future<void> _searchKeyWord() async {
    try {
      await inputKeywordEl.type(Config.searchKey);
      await searchButtonElXpath.click();
    } catch (e, s) {
      print("$e $s");
    }
  }

  Future<void> _getKeywordsFromResult() async {
    try {
      await Future.delayed(Duration(seconds: 3));

      final result =
          List<String>.from(await resultingKeywordsDivEl.evaluate<List>('''
node => {
  let keywords = [];
  const elements = node.children;

  for(let i = 0; i<elements.length; i ++){
    keywords.push(elements[i].textContent);
  }

  return keywords;
}''').then((value) => value as List));

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
