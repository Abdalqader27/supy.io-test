import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';
import 'package:supy_io_test/libraries/el_widgets/el_widgets.dart';
import 'package:supy_io_test/libraries/flutter_screenutil/flutter_screenutil.dart';

class EmployeeItem extends StatelessWidget {
  const EmployeeItem(
      {Key? key,
      required this.index,
      required this.tap,
      required this.employee})
      : super(key: key);

  final VoidCallback tap;
  final EmployeeModel employee;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          imageCircleNetwork(employee.avatar),
          SizedBox(width: 2.0.w),
          Container(
            width: 70.0.w,
            child: Card(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RPadding.all8(
                        child: MaterialText.headLine6('${employee.name}'),
                      ),
                      RPadding.all8(
                        child:
                            MaterialText.headLine6('${employee.description}'),
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget imageCircleNetwork(image) {
    return Hero(
      tag: index.toString(),
      child: ClipOval(
        child: Container(
            width: 14.0.w,
            height: 14.0.w,
            child: CachedNetworkImage(
              errorWidget: (context, url, error) =>
                  SvgPicture.asset('icons/user.svg'),
              imageUrl: image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
