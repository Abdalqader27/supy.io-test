import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';
import 'package:supy_io_test/libraries/el_widgets/widgets/responsive_sized_box.dart';

import 'employee_item.dart';

class AllEmployeeBody extends StatelessWidget {
  final List<EmployeeModel> allEmployeeList;

  const AllEmployeeBody({Key? key, required this.allEmployeeList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: allEmployeeList.length,
        separatorBuilder: (_, index) => RSizedBox.v8(),
        itemBuilder: (_, index) => AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 1000),
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
              child: EmployeeItem(
                index: index,
                employee: allEmployeeList[index],
                tap: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
