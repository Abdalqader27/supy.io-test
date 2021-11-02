import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:supy_io_test/generated/assets.dart';
import 'package:supy_io_test/libraries/flutter_screenutil/flutter_screenutil.dart';

class LoadingWidget extends StatelessWidget {
  final int? width;

  const LoadingWidget({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        Assets.lottieNewLoader,
        width: 160.0.r,
      ),
    );
  }
}
