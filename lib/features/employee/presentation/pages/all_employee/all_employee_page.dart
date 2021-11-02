import 'package:flutter/material.dart';
import 'package:supy_io_test/common/widgets/classic_app_bar.dart';
import 'package:supy_io_test/common/widgets/loading_widget.dart';
import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';
import 'package:supy_io_test/features/employee/presentation/pages/all_employee/widgets/all_employee_body.dart';
import 'package:supy_io_test/libraries/el_widgets/el_widgets.dart';

class AllEmployeePage extends StatefulWidget {
  const AllEmployeePage({Key? key}) : super(key: key);

  @override
  _AllEmployeePageState createState() => _AllEmployeePageState();
}

class _AllEmployeePageState extends State<AllEmployeePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: RPadding.all16(
          child: Column(
            children: [
              const ClassicAppBar(
                title: "Hey",
                subTitle: 'Nice to meet sir  ',
              ),
              const RSizedBox.v32(),
              Expanded(
                child: FutureBuilder(
                  builder: (context, snapshotData) {
                    if (snapshotData.data != null) {
                      return const LoadingWidget();
                    }
                    return AllEmployeeBody(
                      allEmployeeList: [
                        EmployeeModel(
                            createdAt: "createdAt",
                            name: "Abd Alqader Alnajjar ",
                            avatar: "avatar",
                            description: "description",
                            id: "id"),
                        EmployeeModel(
                            createdAt: "createdAt",
                            name: "createdAt",
                            avatar: "avatar",
                            description: "description",
                            id: "id"),
                        EmployeeModel(
                            createdAt: "createdAt",
                            name: "createdAt",
                            avatar: "avatar",
                            description: "description",
                            id: "id"),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
