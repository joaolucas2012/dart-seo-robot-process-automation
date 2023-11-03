import 'package:dart_seo_robot/modules/rapid_tags_page/elements/rapid_tags_elements.dart';
import 'package:dart_seo_robot/modules/shared/classes/navigator.dart';
import 'package:dart_seo_robot/modules/shared/interfaces/activity_interface.dart';
import 'package:dart_seo_robot/modules/shared/utils/enumerators/website_links.dart';

class RapidTagsActivity extends Activity {
  @override
  Future<void> start() async {
    await Navigator().navigateTo(WebsiteLinks.urlRapidTags.value);
    await RapidTagsElements().start();
  }
}
