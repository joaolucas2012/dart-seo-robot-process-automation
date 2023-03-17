import 'dart:io';

import 'package:dart_seo_robot/modules/keyword_tool_page/activity/keyword_tool_activity.dart';
import 'package:dart_seo_robot/modules/rapid_tags_page/activity/rapid_tags_activity.dart';
import 'package:dart_seo_robot/modules/shared/classes/navigator.dart';

class CoreActivity {
  Future<void> _runCoreActivity() async {
    try {
      await RapidTagsActivity().build();
      await KeywordToolActivity().build();
      await Navigator().closePage();
      exit(0);
    } catch (error, stackTrace) {
      print("$error $stackTrace");
    }
  }

  Future<void> build() async {
    await _runCoreActivity();
  }
}
