import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ussd_manegement/constants/strings.dart';
import 'package:ussd_manegement/features/app_screns_controllers/modals/streaModel.dart';
import 'package:ussd_manegement/features/app_screns_controllers/screans/home/widgets/registation.dart';

class MeuController extends GetxController {
  RxList<String> numerosFiltrados = <String>[].obs;
  RxList<String> numerosFiltradosemail = <String>[].obs;
  static RxList<String> emails = TStrings.emails.obs;
  var valStream = TStrings.valStream.obs;
  var valMegas = TStrings.valMegas.obs;
  var emailController = TextEditingController();
  var userController = TextEditingController();
  var valorselecionado = TStrings.valorselecionado.obs;
  var emailselecionado = TStrings.emailselecionado.obs;
  late Future<List<ModelStream>> notes;

  void onValStreamChanged(String novoValor) {
    valStream.value = novoValor;
  }

  void onValEmailSelecionadoChanged(String novoValor) {
    emailselecionado.value = novoValor;
  }

  void onValSelecionado(String novoValor) {
    valorselecionado.value = novoValor;
  }

  void onValMegasChanged(String novoValor) {
    valMegas.value = novoValor;
  }

  String validator(String value) {
    if (value.isEmpty) {
      return 'Please this field must be filled';
    }
    return '';
  }

  void filtrarEAdicionarNumerosPorEmail(String email) async {
    try {
      print(
          "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
      // Aguarde a conclusão da Future e obtenha os dados
      List<ModelStream> allNotes = await notes;
      

      // Filtre as instâncias de ModelStream com base no email
      List<ModelStream> notesFiltradosPorEmail =
          allNotes.where((note) => note.emailDaConta == email).toList();

      // Mapeie as instâncias filtradas para números de telefone e atribua à lista numerosFiltrados
      numerosFiltrados.value = notesFiltradosPorEmail
          .map((note) => note.numeroDoCliente.toString())
          .toList();
      print(
          "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo");
      print(numerosFiltrados);
      // Atribua a mesma lista aos numerosFiltradosemail
      numerosFiltradosemail = numerosFiltrados;
    } catch (error) {
      // Lide com erros, se necessário
      print("Erro ao filtrar e adicionar números por email: $error");
    }
  }
}
