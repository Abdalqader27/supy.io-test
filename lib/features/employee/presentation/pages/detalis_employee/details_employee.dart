import 'package:flutter/material.dart';
import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';
import 'package:supy_io_test/features/employee/presentation/pages/detalis_employee/widgets/employee_header.dart';
import 'package:supy_io_test/libraries/el_widgets/el_widgets.dart';

import 'widgets/header_image.dart';

class DetailsEmployee extends StatefulWidget {
  final EmployeeModel employeeModel;

  const DetailsEmployee({Key? key, required this.employeeModel})
      : super(key: key);

  @override
  _DetailsEmployeeState createState() => _DetailsEmployeeState();
}

class _DetailsEmployeeState extends State<DetailsEmployee> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          slivers: [
            HeaderImage(
              image: widget.employeeModel.avatar,
              backButtonColor: themeData.backgroundColor,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  EmployeeHeader(employeeModel: widget.employeeModel),
                  const RSizedBox.v12(),
                  // InfoHeader(doctor: doctor),
                  // PersonalInfo(doctor: doctor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
