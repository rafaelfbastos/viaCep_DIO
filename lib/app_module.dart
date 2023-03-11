import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:via_cep_dio/app_widget.dart';
import 'package:via_cep_dio/controller/app_controller.dart';
import 'package:via_cep_dio/repositories/back4app_repository_impl.dart';
import 'package:via_cep_dio/repositories/viacep_repository_impl.dart';
import 'package:via_cep_dio/services/back4app_service_impl.dart';
import 'package:via_cep_dio/services/viacep_service_impl.dart';

class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ViacepRepositoryImpl>(
          create: (__) => ViacepRepositoryImpl(),
        ),
        Provider<ViacepServiceImpl>(
          create: (context) => ViacepServiceImpl(repository: context.read()),
        ),
        Provider<Back4appRepositoryImpl>(
          create: (__) => Back4appRepositoryImpl(),
        ),
        Provider<Back4appServiceImpl>(
          create: (context) => Back4appServiceImpl(
            repository: context.read(),
          ),
        ),
        ChangeNotifierProvider<AppController>(
          create: (context) => AppController(
            service: context.read(),
            backService: context.read(),
          ),
        )
      ],
      child: const AppWidget(),
    );
  }
}
