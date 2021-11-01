import 'package:flutter/material.dart';
import 'package:supy_io_test/features/employee/presentation/pages/landing/widgets/landing_body.dart';
import 'package:supy_io_test/libraries/init_app/initializers/run_app/export_packages.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LandingBody(),
    );
  }
}
