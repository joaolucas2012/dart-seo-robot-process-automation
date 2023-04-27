// ignore_for_file: depend_on_referenced_packages

import 'package:chalkdart/chalk.dart';
import 'package:dart_seo_robot/modules/core/store/corestore.dart';
import 'package:dart_seo_robot/modules/shared/classes/data/log_information.dart';
import 'package:dart_seo_robot/modules/shared/classes/messages/print_object.dart';
import 'package:dart_seo_robot/modules/shared/utils/log_type.dart';
import 'package:dart_seo_robot/modules/shared/utils/print_types_enum.dart';

class PrintHandler {
  /// Method to add the possible PrintObjects in ``[CoreStore.possiblePrints]``
  /// based in the supplied `LogInfo` instance.
  Future<void> createPossiblePrintsToShow(LogInfo data) async {
    try {
      CoreStore.possiblePrints = {
        LogType.empty:
            PrintObject("-- Getting the previous date...", PrintTypes.info),
      };
    } catch (error, stackTrace) {
      print(chalk.red("$error $stackTrace"));
    }
  }
}
