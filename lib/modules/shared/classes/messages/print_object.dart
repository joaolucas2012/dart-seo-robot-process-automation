// ignore_for_file: depend_on_referenced_packages

import 'package:dart_seo_robot/modules/shared/utils/color_handler.dart';
import 'package:dart_seo_robot/modules/shared/utils/print_types_enum.dart';

class PrintObject {
  final String message;
  final PrintTypes typeOfPrint;

  PrintObject(this.message, this.typeOfPrint);

  /// Method to print a `PrintObject` message according to its `typeOfPrint` attribute.
  Future<void> printMessage() async {
    Map<PrintTypes, dynamic>.from({
      PrintTypes.error: printError,
      PrintTypes.success: printSuccess,
      PrintTypes.info: printInfo,
      PrintTypes.colored: printColored,
    })[typeOfPrint](message);
  }
}
