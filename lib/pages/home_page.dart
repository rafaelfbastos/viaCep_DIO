import 'package:flutter/material.dart';
import 'package:via_cep_dio/controller/app_controller.dart';

class HomePage extends StatelessWidget {
  final AppController _controller;

  const HomePage({Key? key, required AppController controller})
      : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
    );
  }
}
