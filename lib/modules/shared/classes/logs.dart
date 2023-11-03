// ignore_for_file: depend_on_referenced_packages

import 'package:dart_seo_robot/modules/shared/utils/store/corestore.dart';
import 'package:dart_seo_robot/modules/shared/classes/data/log_information.dart';
import 'package:dart_seo_robot/modules/shared/classes/handlers/print_handler.dart';
import 'package:dart_seo_robot/modules/shared/utils/functions/print_colored.dart';

class Logs {
  final printHandler = PrintHandler();

  /// Function to display logs in console with the provided information.
  Future<void> show(LogInfo data) async {
    try {
      await printHandler.createPossiblePrintsToShow(data);
      await CoreStore.possiblePrints[data.type].printMessage();
    } catch (error, stackTrace) {
      printError("$error $stackTrace");
    }
  }
}
