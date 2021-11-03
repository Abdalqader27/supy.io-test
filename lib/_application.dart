import 'package:catcher/catcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'common/config/app/app_config.dart';
import 'common/config/theme/theme_config.dart';
import 'features/employee/presentation/pages/landing/landing_page.dart';
import 'libraries/flutter_screenutil/flutter_screenutil.dart';
import 'libraries/init_app/initializers/easy_localization/easy_localization_initializer.dart';
import 'libraries/init_app/initializers/theme_provider/theme_provider_initializer.dart';

// This class for init App
class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalizationInitializer(
      config: kEasyLocalizationConfig,
      app: ScreenUtilInit(
        builder: () => ThemeProviderInitializer(
          themeProviderConfig: kThemeProviderConfig,
          // using getMaterial for Navigation Route
          builder: (context, theme) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: Catcher.navigatorKey,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: theme,
              // We should use VRout Navigation
              home: const SafeArea(child: LandingPage())),
        ),
      ),
    );
  }
}
