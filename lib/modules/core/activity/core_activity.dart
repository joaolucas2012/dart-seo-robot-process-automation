import 'package:dart_seo_robot/modules/keyword_tool_page/activity/keyword_tool_activity.dart';
import 'package:dart_seo_robot/modules/rapid_tags_page/activity/rapid_tags_activity.dart';
import 'package:dart_seo_robot/modules/shared/bot/bot.dart';
import 'package:dart_seo_robot/modules/shared/utils/color_handler.dart';

class CoreActivity {
  Future<void> start() async {
    await _runCoreActivity();
  }

  Future<void> _runCoreActivity() async {
    try {
      await KeywordToolActivity().start();
      await RapidTagsActivity().start();
      await Bot.destroy();
    } catch (error, stackTrace) {
      printError("$error $stackTrace");
    }
  }
}
