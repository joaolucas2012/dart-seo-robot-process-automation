import 'package:dart_seo_robot/modules/get_entries/activity/get_entries_activity.dart';
import 'package:dart_seo_robot/modules/keyword_tool_page/activity/keyword_tool_activity.dart';
import 'package:dart_seo_robot/modules/rapid_tags_page/activity/rapid_tags_activity.dart';
import 'package:dart_seo_robot/modules/shared/bot/bot.dart';
import 'package:dart_seo_robot/modules/shared/utils/functions/print_colored.dart';

class CoreActivity {
  Future<void> start() async {
    try {
      await GetEntriesActivity().start();
      await KeywordToolActivity().start();
      await RapidTagsActivity().start();
      await Bot.destroy();
    } catch (error, stackTrace) {
      printError("$error $stackTrace");
    }
  }
}
