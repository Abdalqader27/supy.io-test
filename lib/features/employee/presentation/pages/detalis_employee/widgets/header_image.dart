import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supy_io_test/common/widgets/close_widget.dart';
import 'package:supy_io_test/common/widgets/image_network_cached.dart';
import 'package:supy_io_test/libraries/flutter_screenutil/flutter_screenutil.dart';

import 'clip_info_app_bar.dart';

class HeaderImage extends StatelessWidget {
  final String image;
  final Color backButtonColor;

  const HeaderImage(
      {Key? key, required this.image, required this.backButtonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Container(),
      expandedHeight: 400.0.h,
      collapsedHeight: 100.0.h,
      toolbarHeight: 40.0.h,
      stretch: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: ClipPath(
          clipper: CurvedClipper(),
          child: Stack(
            children: const [
              Positioned.fill(
                  child: ImageNetwork(
                      path:
                          'https://cdn.fakercloud.com/avatars/kazaky999_128.jpg')),
              CloseWidget(
                icon: Icons.arrow_back_ios_sharp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
