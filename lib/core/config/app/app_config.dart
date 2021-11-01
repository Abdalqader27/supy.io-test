import 'dart:ui';

import 'package:supy_io_test/libraries/configs_models.dart';

import '../../../libraries/config_app/catcher_config.dart';

final kAppConfig = AppConfig(
  enableDevicePreview: false,
  enableFirebase: false,
  enableBlocObserver: false,
  enableEasyLocalization: false,
  catcherConfig: CatcherConfig(
      enableInDebugMode: true,
      emailAutoHandler: ElkoodEmailAutoHandler(
        recipients: ['abdalqader27.najjar@gmail.com'],
      )),
);
const kEasyLocalizationConfig = EasyLocalizationConfig(
  fallbackLocale: Locale('ar'),
  startLocale: Locale('ar'),
  supportedLocales: [Locale('ar')],
  translationsPath: 'res/translation',
);
