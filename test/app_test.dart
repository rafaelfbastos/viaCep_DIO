import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:via_cep_dio/models/cep_model.dart';
import 'package:via_cep_dio/repositories/back4app_repository_impl.dart';
import 'package:via_cep_dio/repositories/viacep_repository_impl.dart';
import 'package:via_cep_dio/services/viacep_service_impl.dart';

void main() {
  test("Teste de request erro", () async {
    final repo = ViacepRepositoryImpl();

    expect(() async => await repo.buscarCep("42800005"),
        throwsA(const TypeMatcher<ArgumentError>()));
  });

  test("Teste de busca", () async {
    final repo = ViacepRepositoryImpl();

    expect(
      await repo.buscarCep("42800051"),
      CepModel(
          cep: "42800-051",
          logradouro: "Rua Adelina de Sá",
          complemento: "",
          bairro: "Centro",
          localidade: "Camaçari",
          uf: "BA",
          ibge: "2905701",
          gia: "",
          ddd: "71",
          siafi: "3413"),
    );
  });
  test("Teste de busca do service", () async {
    final repo = ViacepRepositoryImpl();
    final service = ViacepServiceImpl(repository: repo);

    expect(
      await service.buscarCep("42800051"),
      CepModel(
          cep: "42800-051",
          logradouro: "Rua Adelina de Sá",
          complemento: "",
          bairro: "Centro",
          localidade: "Camaçari",
          uf: "BA",
          ibge: "2905701",
          gia: "",
          ddd: "71",
          siafi: "3413"),
    );
  });

  test("Teste .env", () async {
    await dotenv.load(fileName: ".env");
    expect(dotenv.env["X-Parse-Application-Id"],
        "EMlHUaFf96WlTc1Gbb1iO3ZbX2xWc8bg6yU4BVlR");
  });

  test("salvar", () async {
    await dotenv.load(fileName: ".env");
    final repo = Back4appRepositoryImpl();
    final cep = CepModel(
        cep: "42800-051",
        logradouro: "Rua Adelina de Sá",
        complemento: "",
        bairro: "Centro",
        localidade: "Camaçari",
        uf: "BA",
        ibge: "2905701",
        gia: "",
        ddd: "71",
        siafi: "3413");

    expect(await repo.salvarCep(cep), 201);
  });

  test("ler backend", () async {
    await dotenv.load(fileName: ".env");
    final repo = Back4appRepositoryImpl();
    final cep = CepModel(
        cep: "42800-051",
        logradouro: "Rua Adelina de Sá",
        complemento: "",
        bairro: "Centro",
        localidade: "Camaçari",
        uf: "BA",
        ibge: "2905701",
        gia: "",
        ddd: "71",
        siafi: "3413");

    expect(await repo.buscarCep("42800-051"), cep);
  });
}
