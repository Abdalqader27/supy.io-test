import 'package:flutter/material.dart';

import '../../../../../libraries/init_app/initializers/run_app/export_packages.dart';
import 'widgets/landing_body.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LandingBody(),
    );
  }
}
