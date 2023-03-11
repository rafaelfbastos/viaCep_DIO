import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';
import 'package:via_cep_dio/controller/app_controller.dart';
import 'package:via_cep_dio/models/cep_model.dart';
import 'package:via_cep_dio/widgets/cep_widget.dart';

class CepPage extends StatelessWidget {
  const CepPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cepEC = TextEditingController();
    final formKey = GlobalKey<FormState>();
    var maskFormatter = MaskTextInputFormatter(
      mask: '#####-###',
      filter: {"#": RegExp(r'[0-9]')},
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(width: 5, color: Colors.black38),
            ),
            title: Text(
              "BUSCA CEP",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserratAlternates(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: cepEC,
                validator: Validatorless.multiple([
                  Validatorless.required("Digite o CEP "),
                  Validatorless.min(9, "Digite um CEP válido")
                ]),
                style: GoogleFonts.montserratAlternates(
                  color: const Color(0xff404040),
                  fontSize: 18,
                ),
                cursorColor: const Color(0xff404040),
                keyboardType: TextInputType.number,
                inputFormatters: [maskFormatter],
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.black),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),
                  ),
                  label: Text(
                    "Digite o CEP:",
                    style: GoogleFonts.roboto(fontSize: 16),
                  ),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff404040),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Buscar",
                style: GoogleFonts.montserratAlternates(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () async {
              var formValid = formKey.currentState?.validate() ?? false;
              if (formValid) {
                await context.read<AppController>().buscarCep(
                    maskFormatter.getUnmaskedText(),
                    maskFormatter.getMaskedText());
                cepEC.clear();
              }
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Visibility(
            visible: context.watch<AppController>().cepModel != null,
            child: CepWidget(
                cepModel: context.watch<AppController>().cepModel ??
                    CepModel.vazio()),
          )
        ]),
      ),
    );
  }
}
