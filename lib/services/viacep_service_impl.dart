import 'package:via_cep_dio/models/cep_model.dart';
import 'package:via_cep_dio/services/viacep_service.dart';

import '../repositories/viacep_repository_impl.dart';

class ViacepServiceImpl extends ViacepService {
  final ViacepRepositoryImpl _repository;

  ViacepServiceImpl({
    required ViacepRepositoryImpl repository,
  }) : _repository = repository;

  @override
  Future<CepModel> buscarCep(String cep) => _repository.buscarCep(cep);
}
