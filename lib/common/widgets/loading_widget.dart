import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:supy_io_test/generated/assets.dart';
import 'package:supy_io_test/libraries/flutter_screenutil/flutter_screenutil.dart';

class LottieWidget extends StatelessWidget {
  final double width;
  final String path;

  const LottieWidget({Key? key, required this.path, required this.width})
      : super(key: key);

  const factory LottieWidget.loading({
    Key? key,
    double width,
    String path,
  }) = _Loading;

  const factory LottieWidget.notFound({
    Key? key,
    double width,
    String path,
  }) = _NotFound;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        path,
        width: width.r,
      ),
    );
  }
}

class _Loading extends LottieWidget {
  const _Loading({
    Key? key,
    double width = 160.0,
    String path = Assets.lottieNewLoader,
  }) : super(path: path, width: width);
}

class _NotFound extends LottieWidget {
  const _NotFound({
    Key? key,
    double width = 300,
    String path = Assets.lottieErorr,
  }) : super(path: path, width: width);
}
