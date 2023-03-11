// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:via_cep_dio/models/cep_model.dart';
import 'package:via_cep_dio/services/back4app_service_impl.dart';
import 'package:via_cep_dio/services/viacep_service_impl.dart';

class AppController extends ChangeNotifier {
  final ViacepServiceImpl _service;
  final Back4appServiceImpl _backService;
  CepModel? cepModel;
  bool loading = false;
  bool hasError = false;
  String errorMensagem = "";

  PageController pageController = PageController(initialPage: 0);
  int page = 0;

  AppController(
      {required ViacepServiceImpl service,
      required Back4appServiceImpl backService})
      : _service = service,
        _backService = backService;

  mudarPagina(int page) {
    this.page = page;
    pageController.jumpToPage(page);
    notifyListeners();
  }

  buscarCep(String unMaskedCep, String maskedCep) async {
    _showLoading();
    cepModel = await _backService.buscarCep(maskedCep);
    if (cepModel == null) {
      try {
        cepModel = await _service.buscarCep(unMaskedCep);
        await _backService.salvarCep(cepModel!);
      } on ArgumentError catch (e) {
        errorMensagem = e.message;
        hasError = true;
        notifyListeners();
        errorMensagem = "";
        hasError = false;
        notifyListeners();
      }
    }
    _hideLoading();
  }

  _showLoading() {
    loading = true;
    notifyListeners();
  }

  _hideLoading() {
    loading = false;
    notifyListeners();
  }
}
