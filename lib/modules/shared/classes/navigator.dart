import 'package:dart_seo_robot/modules/config.dart';
import 'package:dart_seo_robot/modules/core/store/corestore.dart';
import 'package:puppeteer/puppeteer.dart';

class Navigator {
  late Browser browser;
  late Page currentPage;

  Future<void> navigateTo(String? url) async {
    await _launchBrowser();
    await _startPage(url);
  }

  Future<void> _launchBrowser() async {
    browser = await puppeteer.launch(
        headless: Config.isHeadless,
        defaultViewport: null,
        args: [
          '--disable-setuid-sandbox',
          '--no-sandbox',
          "--start-maximized"
        ]);
  }

  /// Private method to initialiaze a page with puppeteer.
  Future<void> _startPage(String? url) async {
    final b = browser;
    final page = (await b.pages)[0];
    await page.goto("$url", wait: Until.domContentLoaded);
    CoreStore.currentPage = page;
  }

  /// Method to find an `ElementHandle` by xpath.
  Future<ElementHandle> getElementByXpath(String xpath) async {
    late ElementHandle element;

    try {
      await CoreStore.currentPage.waitForXPath(xpath);
      element = (await CoreStore.currentPage.$x(xpath)).first;
    } catch (e) {
      print("$e");
    }

    return element;
  }

  /// Method to get the Data from page DOM.
  Future<List> getDataFromPageDOM(Page page, String? selector) async {
    List items = await page.evaluate<List>(r'''selector => {
        const rowsList = document.querySelector(selector).firstElementChild.children[1].children;
        let items = [];
        for(let i = 0; i<rowsList.length; i++){
          let obj = {
            title: rowsList[i].children[2].firstChild.innerText,
            author: rowsList[i].children[4].firstChild.innerText,
            category: rowsList[i].children[6].innerText,
            description: rowsList[i].children[7].innerText,
            status: rowsList[i].children[12].innerText,
            link: rowsList[i].children[2].firstChild.href
          };
          items.push(obj);
        }
        return items;
    }''', args: [selector]);
    return items;
  }
}
