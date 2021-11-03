import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:supy_io_test/common/widgets/classic_app_bar.dart';
import 'package:supy_io_test/common/widgets/loading_widget.dart';
import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';
import 'package:supy_io_test/features/employee/presentation/redux/employee_state.dart';
import 'package:supy_io_test/features/employee/presentation/redux/employee_thunks.dart';
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
              const ClassicAppBar(title: "Hey", subTitle: 'Nice to meet sir  '),
              const RSizedBox.v32(),
              Expanded(
                child: StoreConnector<EmployeeState, dynamic>(
                  converter: (convert) => convert.state.employee,
                  onInit: (store) =>
                      store.dispatch(getEmployeeByIdThunks(widget.id)),
                  builder: (context, viewModel) {
                    print(viewModel);
                    if (viewModel == null) {
                      return const LoadingWidget();
                    }
                    return viewModel.when(
                      success: (EmployeeModel data) {
                        return MaterialText.headLine6(data.name.toString());
                      },
                      failure: (e) {
                        return Text("$e");
                      },
                      empty: () {
                        return const Text("Empty");
                      },
                      loading: () {
                        return const LoadingWidget();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // Center(
        //     child: RPadding.all8(
        //         child: Lottie.asset(Assets.lottieSearch, height: 0.2.sh)),
        //   ),
      ),
    );
  }
}
