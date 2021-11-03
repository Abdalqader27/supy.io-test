import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';
import 'package:supy_io_test/libraries/el_widgets/el_widgets.dart';

class EmployeeHeader extends StatelessWidget {
  final EmployeeModel employeeModel;

  const EmployeeHeader({Key? key, required this.employeeModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
      duration: const Duration(milliseconds: 1500),
      child: SlideAnimation(
        horizontalOffset: -50.0,
        child: FadeInAnimation(
          child: RPadding.all16(
            child: Card(
              child: RPadding.all16(
                child: ListTile(
                  leading: const Icon(LineariconsFree.users),
                  title: MaterialText.headLine6(employeeModel.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const RSizedBox.v16(),
                      MaterialText.bodyText2(employeeModel.id),
                      const RSizedBox.v16(),
                      MaterialText.bodyText2(employeeModel.createdAt),
                      const RSizedBox.v16(),
                      MaterialText.bodyText2(employeeModel.description),
                      const RSizedBox.v16(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
