import 'dart:io';

import 'package:dart_seo_robot/modules/config.dart';
import 'package:dart_seo_robot/modules/rapid_tags_page/activity/rapid_tags_activity.dart';
import 'package:dart_seo_robot/modules/shared/classes/navigator.dart';

class CoreActivity {
  Future<void> _runCoreActivity() async {
    try {
      await Navigator().navigateTo(Config.url);
      await RapidTagsActivity().build();
      exit(0);
    } catch (error, stackTrace) {
      print("$error $stackTrace");
    }
  }

  Future<void> build() async {
    await _runCoreActivity();
  }
}
