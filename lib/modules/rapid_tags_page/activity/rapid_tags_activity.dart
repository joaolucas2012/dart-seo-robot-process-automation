import 'package:dart_seo_robot/modules/config.dart';
import 'package:dart_seo_robot/modules/rapid_tags_page/elements/rapid_tags_elements.dart';
import 'package:dart_seo_robot/modules/shared/classes/navigator.dart';
import 'package:dart_seo_robot/modules/shared/interfaces/activity_interface.dart';

class RapidTagsActivity extends Activity {
  @override
  Future<void> build() async {
    await _doActionsInRapidTags();
  }

  Future<void> _doActionsInRapidTags() async {
    await Navigator().navigateTo(Config.urlRapidTags);
    await RapidTagsElements().build();
  }
}
