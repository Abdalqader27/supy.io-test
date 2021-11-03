import 'package:flutter/material.dart';
import 'package:supy_io_test/common/widgets/image_network_cached.dart';
import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';
import 'package:supy_io_test/libraries/el_widgets/el_widgets.dart';
import 'package:supy_io_test/libraries/flutter_screenutil/flutter_screenutil.dart';

class BodyDetailsSearchScreen extends StatelessWidget {
  final EmployeeModel employeeModel;

  const BodyDetailsSearchScreen({Key? key, required this.employeeModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Column(
        children: [
          ClipRRect(
            child: ImageNetwork(path: employeeModel.avatar),
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(20.r),
          ),
          const RSizedBox.v16(),
          MaterialText.headLine6(employeeModel.name.toString()),
          MaterialText.subTitle1(employeeModel.description.toString()),
        ],
      ),
    ));
  }
}
