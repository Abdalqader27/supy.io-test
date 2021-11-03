import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supy_io_test/common/config/theme/colors.dart';
import 'package:supy_io_test/libraries/el_widgets/el_widgets.dart';
import 'package:supy_io_test/libraries/flutter_screenutil/flutter_screenutil.dart';

import 'circle.dart';

class CloseWidget extends StatelessWidget {
  final Color? backButtonColor;
  final IconData? icon;
  final double? dim;

  const CloseWidget({Key? key, this.backButtonColor, this.dim, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RPadding.all8(
      child: Circle(
        child: Icon(icon),
        backGroundColor: backButtonColor ?? kGREY,
        onTap: () => Get.back(),
        dim: dim ?? 47.r,
      ),
    );
  }
}
