import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:via_cep_dio/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        controller: context.read(),
      ),
    );
  }
}
