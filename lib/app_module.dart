import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:via_cep_dio/app_widget.dart';
import 'package:via_cep_dio/controller/app_controller.dart';
import 'package:via_cep_dio/repositories/viacep_repository.dart';
import 'package:via_cep_dio/repositories/viacep_repository_impl.dart';
import 'package:via_cep_dio/services/viacep_service.dart';
import 'package:via_cep_dio/services/viacep_service_impl.dart';

class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ViacepRepository>(
          create: (_) => ViacepRepositoryImpl(),
        ),
        Provider<ViacepService>(
          create: (context) => ViacepServiceImpl(repository: context.read()),
        ),
        ChangeNotifierProvider(
            create: (context) => AppController(service: context.read()))
      ],
      child: const AppWidget(),
    );
  }
}
