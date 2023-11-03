import 'dart:io';

import 'package:dart_seo_robot/modules/shared/utils/store/corestore.dart';
import 'package:dart_seo_robot/modules/shared/interfaces/activity_interface.dart';
import 'package:dart_seo_robot/modules/shared/utils/color_handler.dart';
import 'package:dart_seo_robot/modules/shared/utils/headless_options_enum.dart';

class GetEntriesActivity implements Activity {
  @override
  Future<void> start() async {
    try {
      await _getUserEntries();
    } catch (e, s) {
      printError("$e $s");
    }
  }

  Future<void> _getUserEntries() async {
    String entry = "";
    bool headless = false;

    while (entry.isEmpty) {
      printColored("Type a keyword to search for: ");
      entry = stdin.readLineSync()!;

      printColored(
          "\nDo you want to watch the process? (Type 1 for true or 2 for false): ");
      String watch = stdin.readLineSync()!.toLowerCase();

      if (watch.isNotEmpty) {
        headless = HeadlessOptions.values
            .firstWhere((option) => option.key == watch)
            .value;
      }
    }

    CoreStore.keywordEntry = entry;
    CoreStore.isHeadless = headless;
  }
}
