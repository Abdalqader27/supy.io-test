import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:supy_io_test/generated/assets.dart';
import 'package:supy_io_test/libraries/el_widgets/widgets/responsive_padding.dart';
import 'package:supy_io_test/libraries/flutter_screenutil/flutter_screenutil.dart';

class DetailsSearchPage extends StatefulWidget {
  const DetailsSearchPage({Key? key}) : super(key: key);

  @override
  _DetailsSearchPageState createState() => _DetailsSearchPageState();
}

class _DetailsSearchPageState extends State<DetailsSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RPadding.all8(
          child: Lottie.asset(Assets.lottieSearch, height: 0.2.sh)),
    );
  }
}
