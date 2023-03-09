import 'package:via_cep_dio/models/cep_model.dart';

abstract class ViacepRepository {
  Future<CepModel> buscarCep(String cep);
}
