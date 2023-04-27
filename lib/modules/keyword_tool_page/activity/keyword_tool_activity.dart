import 'package:dart_seo_robot/modules/config.dart';
import 'package:dart_seo_robot/modules/keyword_tool_page/elements/keyword_tools_elements.dart';
import 'package:dart_seo_robot/modules/shared/classes/navigator.dart';
import 'package:dart_seo_robot/modules/shared/interfaces/activity_interface.dart';

class KeywordToolActivity extends Activity {
  @override
  Future<void> build() async {
    await _doActionsInKeywordTools();
  }

  Future<void> _doActionsInKeywordTools() async {
    await Navigator().navigateTo(Config.urlKeywordTools);
    await KeywordToolsElements().build();
  }
}
