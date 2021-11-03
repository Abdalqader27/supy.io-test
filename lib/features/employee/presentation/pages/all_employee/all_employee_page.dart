import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:supy_io_test/_injections.dart';
import 'package:supy_io_test/common/widgets/classic_app_bar.dart';
import 'package:supy_io_test/common/widgets/loading_widget.dart';
import 'package:supy_io_test/features/employee/presentation/pages/all_employee/widgets/all_employee_body.dart';
import 'package:supy_io_test/features/employee/presentation/redux/app_state.dart';
import 'package:supy_io_test/features/employee/presentation/redux/thunks.dart';
import 'package:supy_io_test/libraries/el_widgets/el_widgets.dart';

class AllEmployeePage extends StatefulWidget {
  const AllEmployeePage({Key? key}) : super(key: key);

  @override
  _AllEmployeePageState createState() => _AllEmployeePageState();
}

class _AllEmployeePageState extends State<AllEmployeePage> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: serviceLocator<Store<AppState>>(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: RPadding.all16(
            child: Column(
              children: [
                const ClassicAppBar(
                    title: "Hey", subTitle: 'Nice to meet sir  '),
                const RSizedBox.v32(),
                Expanded(
                  child: StoreConnector<AppState, dynamic>(
                    converter: (convert) => convert.state.employeeList,
                    onInit: (store) => store..dispatch(getEmployeesThunks()),
                    builder: (context, viewModel) {
                      return viewModel.map(success: (data) {
                        return AllEmployeeBody(allEmployeeList: data.data);
                      }, failure: (e) {
                        return const Text("Bugs");
                      }, empty: (_) {
                        return const Text("Empty");
                      }, loading: (_) {
                        return const LoadingWidget();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
