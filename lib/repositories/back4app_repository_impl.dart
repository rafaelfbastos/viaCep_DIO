import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:via_cep_dio/models/cep_model.dart';
import 'package:via_cep_dio/repositories/back4app_repository.dart';

class Back4appRepositoryImpl extends Back4appRepository {
  late final Dio _dio;

  Back4appRepositoryImpl() {
    _dio = Dio();
    _dio.options.headers["X-Parse-Application-Id"] =
        dotenv.env["X-Parse-Application-Id"];
    _dio.options.headers["X-Parse-REST-API-Key"] =
        dotenv.env["X-Parse-REST-API-Key"];
    _dio.options.headers["Content-Type"] = dotenv.env["Content-Type"];
    _dio.options.baseUrl = "https://parseapi.back4app.com/classes";
  }

  @override
  Future<CepModel> buscarCep(String cep) async {
    final url = "/cep?where={ \"cep\":\"$cep\"}";
    final response = await _dio.get(url);
    final data = response.data["results"][0] as Map<String, dynamic>;
    return CepModel.fromMap(data);
  }

  @override
  Future<int> salvarCep(CepModel cepModel) async {
    final response = await _dio.post("/cep", data: cepModel.toJson());

    if (response.statusCode != 201) {
      throw Exception("Erro ao gravar");
    }
    return response.statusCode!;
  }

  @override
  Future<List<CepModel>> buscarTodosCep(String cep) async {
    final response = await _dio.get("/cep");
    final data = response.data["results"] as List;
    return data
        .map((e) => CepModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}
