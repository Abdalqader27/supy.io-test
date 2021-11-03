import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:supy_io_test/common/widgets/classic_app_bar.dart';
import 'package:supy_io_test/common/widgets/loading_widget.dart';
import 'package:supy_io_test/features/employee/presentation/pages/all_employee/widgets/all_employee_body.dart';
import 'package:supy_io_test/features/employee/presentation/redux/employee_state.dart';
import 'package:supy_io_test/features/employee/presentation/redux/employee_thunks.dart';
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
        body: RPadding.all16(
          child: Column(
            children: [
              const ClassicAppBar(title: "Hey", subTitle: 'Nice to meet sir  '),
              const RSizedBox.v32(),
              Expanded(
                child: StoreConnector<EmployeeState, dynamic>(
                  converter: (convert) => convert.state,
                  onInit: (store) => store..dispatch(getEmployeesThunks()),
                  builder: (context, state) {
                    if (state is SuccessState) {
                      final employeeList = state.employeeList!;
                      if (employeeList.isEmpty) {
                        return const Text("Empty");
                      }
                      return AllEmployeeBody(allEmployeeList: employeeList);
                    } else if (state is FailureState) {
                      return Text(state.message);
                    } else {
                      return const LottieWidget.loading();
                    }
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
