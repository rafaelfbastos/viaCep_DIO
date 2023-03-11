import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:via_cep_dio/controller/app_controller.dart';
import 'package:via_cep_dio/models/cep_model.dart';

class CepWidget extends StatelessWidget {
  final CepModel _cepModel;
  final bool editavel;
  const CepWidget({Key? key, required CepModel cepModel, this.editavel = false})
      : _cepModel = cepModel,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      trailing: editavel
          ? IconButton(
              color: Colors.red,
              icon: const Icon(Icons.delete),
              onPressed: () {
                context.read<AppController>().remover(_cepModel);
              },
            )
          : null,
      contentPadding: const EdgeInsets.all(5),
      title: RichText(
        text: TextSpan(
          style: GoogleFonts.montserratAlternates(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          text: "CEP: ",
          children: [
            TextSpan(
              text: _cepModel.cep,
              style: GoogleFonts.montserratAlternates(
                  fontSize: 20, color: Colors.black54),
            )
          ],
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(
              style: GoogleFonts.montserratAlternates(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              text: "Logradouro: ",
              children: [
                TextSpan(
                  text: _cepModel.logradouro,
                  style: GoogleFonts.montserratAlternates(
                      fontSize: 15, color: Colors.black54),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              style: GoogleFonts.montserratAlternates(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              text: "Bairro: ",
              children: [
                TextSpan(
                  text: _cepModel.bairro,
                  style: GoogleFonts.montserratAlternates(
                      fontSize: 15, color: Colors.black54),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              style: GoogleFonts.montserratAlternates(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              text: "Localidade: ",
              children: [
                TextSpan(
                  text: _cepModel.localidade,
                  style: GoogleFonts.montserratAlternates(
                      fontSize: 15, color: Colors.black54),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              style: GoogleFonts.montserratAlternates(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              text: "UF: ",
              children: [
                TextSpan(
                  text: _cepModel.uf,
                  style: GoogleFonts.montserratAlternates(
                      fontSize: 15, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
