import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:supy_io_test/common/widgets/classic_app_bar.dart';
import 'package:supy_io_test/common/widgets/loading_widget.dart';
import 'package:supy_io_test/features/employee/presentation/pages/details_search/widgets/body_details_screen.dart';
import 'package:supy_io_test/features/employee/presentation/redux/employee_state.dart';
import 'package:supy_io_test/features/employee/presentation/redux/employee_thunks.dart';
import 'package:supy_io_test/generated/assets.dart';
import 'package:supy_io_test/libraries/el_widgets/el_widgets.dart';
import 'package:supy_io_test/libraries/el_widgets/widgets/responsive_padding.dart';
import 'package:supy_io_test/libraries/el_widgets/widgets/responsive_sized_box.dart';

class DetailsSearchPage extends StatefulWidget {
  final String id;

  const DetailsSearchPage({Key? key, required this.id}) : super(key: key);

  @override
  _DetailsSearchPageState createState() => _DetailsSearchPageState();
}

class _DetailsSearchPageState extends State<DetailsSearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RPadding.all16(
          child: Column(
            children: [
              const ClassicAppBar(title: "Search"),
              const RSizedBox.v32(),
              Expanded(
                child: StoreConnector<EmployeeState, dynamic>(
                  converter: (convert) => convert.state,
                  onInit: (store) =>
                      store..dispatch(getEmployeeByIdThunks(widget.id)),
                  builder: (context, state) {
                    if (state is SuccessState) {
                      final employee = state.employee!;
                      return BodyDetailsSearchScreen(employeeModel: employee);
                    } else if (state is EmptyState) {
                      return const LottieWidget.notFound();
                    } else if (state is FailureState) {
                      return Center(
                          child: MaterialText.headLine6(state.message));
                    } else {
                      return const LottieWidget.loading(
                          path: Assets.lottieSearch);
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
