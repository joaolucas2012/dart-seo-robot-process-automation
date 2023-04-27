import 'dart:io';

import 'package:dart_seo_robot/modules/shared/classes/navigator.dart';

class Bot {
  static Future<void> destroy() async {
    await Navigator().closePage();
    exit(0);
  }
}
