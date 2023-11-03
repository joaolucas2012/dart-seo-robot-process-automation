import 'package:dart_seo_robot/modules/keyword_tool_page/elements/keyword_tools_elements.dart';
import 'package:dart_seo_robot/modules/shared/classes/navigator.dart';
import 'package:dart_seo_robot/modules/shared/interfaces/activity_interface.dart';
import 'package:dart_seo_robot/modules/shared/utils/enumerators/website_links.dart';

class KeywordToolActivity extends Activity {
  @override
  Future<void> start() async {
    await Navigator().navigateTo(WebsiteLinks.urlKeywordTool.value);
    await KeywordToolsElements().start();
  }
}
