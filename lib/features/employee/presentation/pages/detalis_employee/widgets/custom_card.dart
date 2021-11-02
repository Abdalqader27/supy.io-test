import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Function onTap;

  const CustomCard({
    required this.child,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
      duration: const Duration(milliseconds: 1500),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
            child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          child: GestureDetector(
            child: child,
            onTap: onTap(),
          ),
        )),
      ),
    );
  }
}
