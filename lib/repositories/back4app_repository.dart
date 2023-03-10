import 'package:via_cep_dio/models/cep_model.dart';

abstract class Back4appRepository {
  Future<CepModel?> buscarCep(String cep);
  Future<List<CepModel>> buscarTodosCep();
  Future<int> salvarCep(CepModel cepModel);
  Future<int> deleteCep(CepModel cepModel);
}
