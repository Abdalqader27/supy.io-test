import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supy_io_test/core/config/theme/colors.dart';
import 'package:supy_io_test/libraries/el_widgets/el_widgets.dart';
import 'package:supy_io_test/libraries/flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController? editingController;
  final keyboardType;
  final iconColor;
  final focusNode;
  final mainContext;
  final int maxLines;
  final double paddingHorizontal;
  final maxNumber;
  final VoidCallback? tap;
  final VoidCallback onTapSearch;
  final ValueChanged<String>? onChange;

  const SearchBar(
      {Key? key,
      this.editingController,
      this.keyboardType,
      this.iconColor,
      this.focusNode,
      this.mainContext,
      this.maxNumber,
      this.tap,
      this.onChange,
      this.maxLines = 1,
      this.paddingHorizontal = 3.0,
      required this.onTapSearch})
      : super(key: key);

  @override
  Widget build(context) {
    return SizedBox(
      width: .85.sw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: kSecondary,
                  borderRadius: BorderRadius.circular(30.0.sp),
                ),
                child: Center(
                  child: TextFormField(
                    maxLines: 1,
                    minLines: 1,
                    onTap: tap,
                    readOnly: tap != null,
                    controller: editingController,
                    focusNode: focusNode,
                    textAlign: TextAlign.center,
                    decoration: _inputDecoration(),
                    autofocus: false,
                    onChanged: onChange,
                    textInputAction: TextInputAction.done,
                    maxLength: maxNumber,
                  ),
                )),
          ),
          RPadding.all4(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0.sp),
                  color: kSecondary),
              child: AnimatedContainer(
                  curve: Curves.ease,
                  duration: const Duration(milliseconds: 2000),
                  child: Visibility(
                    visible: true,
                    child: IconButton(
                        icon: Icon(Icons.search, size: 20.0.r),
                        onPressed: onTapSearch),
                    replacement: Container(),
                  )),
            ),
          ),
          Container(
            height: 55.0.r,
            clipBehavior: Clip.antiAlias,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(15.0.sp)),
            child: AnimatedContainer(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 2000),
                child: Visibility(
                  visible: false,
                  child: SizedBox(
                    child: IconButton(
                        icon: Icon(Icons.close, size: 20.0.r), onPressed: null),
                  ),
                  replacement: Container(),
                )),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
        border: InputBorder.none, hintText: 'Employee Searching.....');
  }
}
