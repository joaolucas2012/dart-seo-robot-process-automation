import 'package:dart_seo_robot/modules/config.dart';
import 'package:dart_seo_robot/modules/core/store/corestore.dart';
import 'package:dart_seo_robot/modules/shared/utils/delay.dart';
import 'package:puppeteer/puppeteer.dart';

class Navigator {
  late Browser browser;
  late Page currentPage;

  Future<void> navigateTo(String? url) async {
    await _launchBrowser();
    await _startPage(url);
  }

  Future<void> _launchBrowser() async {
    browser = (CoreStore.currentPage != null)
        ? CoreStore.currentPage!.browser
        : await puppeteer.launch(
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
    await Time.delay(2);
    CoreStore.currentPage = CoreStore.currentPage ?? page;
  }

  /// Method to find an `ElementHandle` by xpath.
  Future<ElementHandle> getElement(String xpath) async {
    late ElementHandle element;

    try {
      await CoreStore.currentPage!.waitForXPath(xpath);
      element = (await CoreStore.currentPage!.$x(xpath)).first;
    } catch (e) {
      print("$e");
    }

    return element;
  }

  Future<void> closePage() async {
    await CoreStore.currentPage!.browser.close();
  }
}
