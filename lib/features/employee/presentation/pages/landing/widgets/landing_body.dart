import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:supy_io_test/core/config/theme/colors.dart';
import 'package:supy_io_test/features/employee/presentation/pages/all_employee/all_employee_page.dart';
import 'package:supy_io_test/features/employee/presentation/pages/details_search/details_search_screen.dart';
import 'package:supy_io_test/features/employee/presentation/pages/landing/widgets/search_bar.dart';
import 'package:supy_io_test/generated/assets.dart';
import 'package:supy_io_test/libraries/el_widgets/el_widgets.dart';
import 'package:supy_io_test/libraries/flutter_screenutil/flutter_screenutil.dart';
import 'package:supy_io_test/libraries/init_app/initializers/run_app/export_packages.dart'
    hide Column;

class LandingBody extends StatelessWidget {
  const LandingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RPadding.all8(child: Lottie.asset(Assets.lottieTeam, height: 0.4.sh)),
          const MaterialText.headLine5('Welcome'),
          const MaterialText.bodyText2('Nice to meet you !!'),
          const RSizedBox.v64(),
          SearchBar(
            onTapSearch: () {
              Get.to(() => const DetailsSearchPage());
            },
          ),
          // RawMaterialButton(
          //   fillColor: kPRIMARY,
          //   onPressed: () {},
          //   child: MaterialText.button('Show All Employee'),
          // ),
          const RSizedBox.v32(),

          TextButton(
            onPressed: () {
              Get.to(() => const AllEmployeePage());
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.transparent,
                border: Border.all(width: 4, color: kSecondary),
              ),
              height: 45.r,
              width: .45.sw,
              child: const Center(
                child: Text(
                  "Show All Employee",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
