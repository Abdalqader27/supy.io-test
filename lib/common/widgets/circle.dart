import 'package:flutter/material.dart';
import 'package:supy_io_test/libraries/el_widgets/el_widgets.dart';
import 'package:supy_io_test/libraries/flutter_screenutil/flutter_screenutil.dart';

class Circle extends StatelessWidget {
  final Widget? child;
  final Color? backGroundColor;
  final VoidCallback onTap;
  final double? dim;
  final double? widthOfBorder;

  const Circle(
      {Key? key,
      this.dim,
      this.backGroundColor,
      this.child,
      required this.onTap,
      this.widthOfBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: dim!.r,
          height: dim!.r,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: backGroundColor,
              border: Border.all(width: 2, color: backGroundColor!)),
          child: RPadding.all12(child: Center(child: child)),
        ));
  }
}
