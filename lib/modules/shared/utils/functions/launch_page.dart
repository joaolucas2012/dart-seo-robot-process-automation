import 'package:puppeteer/puppeteer.dart';

Future<List> launchPage(String? url) async {
  var browser = await puppeteer.launch(
    headless: false,
    args: ["--start-maximized"],
    defaultViewport: null,
  );

  var page = await browser.newPage();
  await page.goto("$url");

  List list = [browser, page];
  return list;
}
