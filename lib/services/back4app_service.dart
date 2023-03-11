import '../models/cep_model.dart';

abstract class Back4appService {
  Future<CepModel?> buscarCep(String cep);
  Future<List<CepModel>> buscarTodosCep();
  Future<int> salvarCep(CepModel cepModel);
  Future<int> deleteCep(CepModel cepModel);
}
