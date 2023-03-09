import 'dart:ffi';

import 'package:via_cep_dio/models/cep_model.dart';

abstract class Back4appRepository {
  Future<CepModel> buscarCep(String cep);
  Future<List<CepModel>> buscarTodosCep(String cep);
  Future<int> salvarCep(CepModel cepModel);
}
