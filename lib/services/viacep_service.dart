import '../models/cep_model.dart';

abstract class ViacepService {
  Future<CepModel> buscarCep(String cep);
}
