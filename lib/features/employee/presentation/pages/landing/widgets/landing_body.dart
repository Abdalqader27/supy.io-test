import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:supy_io_test/common/config/theme/colors.dart';
import 'package:supy_io_test/features/employee/presentation/pages/all_employee/all_employee_page.dart';
import 'package:supy_io_test/features/employee/presentation/pages/details_search/details_search_screen.dart';
import 'package:supy_io_test/features/employee/presentation/pages/landing/widgets/search_bar.dart';
import 'package:supy_io_test/generated/assets.dart';
import 'package:supy_io_test/libraries/el_widgets/el_widgets.dart';
import 'package:supy_io_test/libraries/flutter_screenutil/flutter_screenutil.dart';
import 'package:supy_io_test/libraries/init_app/initializers/run_app/export_packages.dart'
    hide Column;
import 'package:theme_provider/theme_provider.dart';

class LandingBody extends StatelessWidget {
  LandingBody({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            RPadding.all8(
                child: Lottie.asset(Assets.lottieTeam, height: 0.4.sh)),
            const MaterialText.headLine5('Welcome'),
            const MaterialText.bodyText2('Nice to meet you !!'),
            const RSizedBox.v64(),
            SearchBar(
              keyboardType: TextInputType.number,
              editingController: controller,
              onTapSearch: onSearch,
            ),
            const RSizedBox.v32(),
            TextButton(
              onPressed: () => Get.to(() => const AllEmployeePage()),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.transparent,
                  border: Border.all(width: 4, color: kSecondary),
                ),
                height: 45.r,
                width: .45.sw,
                child: const Center(
                    child: MaterialText.button("Show All Employee")),
              ),
            ),
            CupertinoSwitch(
              onChanged: (bool value) =>
                  ThemeProvider.controllerOf(context).nextTheme(),
              value: Theme.of(context).brightness == Brightness.light,
            ),
          ],
        ),
      ),
    );
  }

  onSearch() {
    if (controller.text.isNumericOnly) {
      Get.to(() => DetailsSearchPage(id: controller.text));
    } else {
      BotToast.showText(
          text: 'Please make sure your field is not empty and is number');
    }
  }
}
