import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supy_io_test/libraries/el_widgets/el_widgets.dart';

class CloseWidget extends StatelessWidget {
  final Color? backButtonColor;
  final IconData? icon;
  final double? dim;

  const CloseWidget({Key? key, this.backButtonColor, this.dim, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RPadding.all8(
      child: FloatingActionButton(
        child: Icon(icon),
        onPressed: () => Get.back(),
      ),
    );
  }
}
