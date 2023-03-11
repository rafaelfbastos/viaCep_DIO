// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:via_cep_dio/models/cep_model.dart';
import 'package:via_cep_dio/repositories/back4app_repository_impl.dart';

import 'back4app_service.dart';

class Back4appServiceImpl implements Back4appService {
  final Back4appRepositoryImpl _repository;

  Back4appServiceImpl({
    required Back4appRepositoryImpl repository,
  }) : _repository = repository;

  @override
  Future<CepModel?> buscarCep(String cep) => _repository.buscarCep(cep);

  @override
  Future<List<CepModel>> buscarTodosCep() => _repository.buscarTodosCep();

  @override
  Future<int> deleteCep(CepModel cepModel) => _repository.deleteCep(cepModel);

  @override
  Future<int> salvarCep(CepModel cepModel) => _repository.salvarCep(cepModel);
}
