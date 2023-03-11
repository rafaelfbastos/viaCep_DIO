import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:via_cep_dio/controller/app_controller.dart';
import 'package:via_cep_dio/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<AppController>();
    return MaterialApp(
      home: HomePage(
        controller: controller,
      ),
    );
  }
}
