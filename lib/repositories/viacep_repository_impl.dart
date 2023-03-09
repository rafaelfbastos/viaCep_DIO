import 'package:dio/dio.dart';
import 'package:via_cep_dio/models/cep_model.dart';
import 'package:via_cep_dio/repositories/viacep_repository.dart';

class ViacepRepositoryImpl implements ViacepRepository {
  @override
  Future<CepModel> buscarCep(String cep) async {
    final dio = Dio();
    final response = await dio.get("https://viacep.com.br/ws/$cep/json/");
    final data = response.data as Map<String, dynamic>;
    if (data.keys.contains("erro")) {
      throw ArgumentError("Cep não encontrado");
    }
    return CepModel.fromMap(data);
  }
}
