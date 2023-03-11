import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:via_cep_dio/controller/app_controller.dart';
import 'package:via_cep_dio/widgets/cep_widget.dart';

class RegistrosPage extends StatelessWidget {
  const RegistrosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children:
                context.select<AppController, List<CepWidget>>((controller) =>
                    controller.cepList
                        ?.map((e) => CepWidget(
                              cepModel: e,
                              editavel: true,
                            ))
                        .toList() ??
                    []),
          ),
        ),
      ),
    );
  }
}
