import 'package:catcher/catcher.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:supy_io_test/libraries/config_app/catcher_config.dart';

import '../configs_models.dart';
import 'initializers/easy_localization/easy_localization_initializer.dart';
import 'initializers/run_app/export_packages.dart';
import 'initializers/run_app/init_app.dart';

///* 1- device preview
/// 2- easy localization
/// 3- catcher
///  Config = > { moor inspector - color - logs  . .... . .}

runApplication({
  required Widget Function() builder,
  AppConfig appConfig = const AppConfig(),
}) async {
  await InitApp.init(appConfig: appConfig);

  Widget app =
      _devicePreview(builder: builder, enable: appConfig.enableDevicePreview);

  final easyLocalizationConfig = appConfig.easyLocalizationConfig;

  if (easyLocalizationConfig != null) {
    app = _easyLocalization(app: app, config: easyLocalizationConfig);
  }

  final catcherConfig = appConfig.catcherConfig;

  if (catcherConfig != null &&
      (kReleaseMode || (kDebugMode && catcherConfig.enableInDebugMode))) {
    _initCatcher(app: app, config: catcherConfig);
  } else {
    runApp(app);
  }
}

Widget _devicePreview(
    {required Widget Function() builder, required bool enable}) {
  return DevicePreview(
    builder: (context) => builder(),
    enabled: enable,
  );
}

Widget _easyLocalization(
    {required Widget app, required EasyLocalizationConfig config}) {
  return EasyLocalizationInitializer(
    config: config,
    app: app,
  );
}

dynamic _initCatcher({required Widget app, required CatcherConfig config}) {
  // Debug configuration with dialog report mode and console handler.
  // It will show dialog and once user accepts it, error will be shown
  // in console
  CatcherOptions debugOptions = CatcherOptions.getDefaultDebugOptions();

  // Release configuration. Same as above, but once user accepts dialog,
  // user will be prompted to send email with crash to support.
  CatcherOptions releaseOptions = CatcherOptions(
    SilentReportMode(),
    [config.emailAutoHandler],
  );

  return Catcher(
    rootWidget: app,
    debugConfig: debugOptions,
    releaseConfig: releaseOptions,
    navigatorKey: Catcher.navigatorKey,
  );
}
