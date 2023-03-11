import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:provider/provider.dart';
import 'package:via_cep_dio/controller/app_controller.dart';
import 'package:via_cep_dio/pages/registros_page.dart';

import 'cep_page.dart';

class HomePage extends StatefulWidget {
  final AppController _controller;

  const HomePage({Key? key, required AppController controller})
      : _controller = controller,
        super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget._controller.addListener(() {
      if (widget._controller.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(widget._controller.errorMensagem),
          backgroundColor: Colors.red,
        ));
      }
      widget._controller.loading ? Loader.show(context) : Loader.hide();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca Cep'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: context.watch<AppController>().pageController,
              onPageChanged: (value) => widget._controller.mudarPagina(value),
              children: const [
                CepPage(),
                RegistrosPage(),
              ],
            ),
          ),
          BottomNavigationBar(
              currentIndex: context.watch<AppController>().page,
              onTap: (value) =>
                  context.read<AppController>().mudarPagina(value),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.view_headline),
                  label: "Cep Salvos",
                ),
              ])
        ],
      ),
    );
  }
}
