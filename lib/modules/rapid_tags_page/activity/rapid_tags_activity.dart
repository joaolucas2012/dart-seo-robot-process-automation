import 'package:dart_seo_robot/modules/rapid_tags_page/elements/rapid_tags_elements.dart';
import 'package:dart_seo_robot/modules/shared/interfaces/activity_interface.dart';

class RapidTagsActivity extends Activity {
  Future<void> _doActionsInRapidTags() async {
    await RapidTagsElements().build();
  }

  @override
  Future<void> build() async {
    await _doActionsInRapidTags();
  }
}
