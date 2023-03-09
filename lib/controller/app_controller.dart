// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:via_cep_dio/services/viacep_service_impl.dart';

class AppController extends ChangeNotifier {
  final ViacepServiceImpl _service;

  AppController({
    required ViacepServiceImpl service,
  }) : _service = service;
}
