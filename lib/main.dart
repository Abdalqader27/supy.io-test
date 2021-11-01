import 'package:supy_io_test/_injections.dart' as injection;

import '_application.dart';
import 'core/config/app/app_config.dart';
import 'libraries/init_app/run_app.dart';

void main() async {
  /// for injection all your objects as singleton or factory or else .....
  await injection.init();

  runApplication(
    appConfig: kAppConfig,
    builder: () => const Application(),
  );
}
