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
          imageCircleNetwork(
              'https://cdn.fakercloud.com/avatars/kazaky999_128.jpg'),
          const RSizedBox.h4(),
          Expanded(
            child: Card(
              child: RPadding.all4(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RPadding.all8(
                        child: MaterialText.headLine6(
                          employee.name,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      RPadding.all8(
                        child: MaterialText.subTitle1(employee.description),
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
        child: SizedBox(
            width: 70.0.r,
            height: 70.0.r,
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
