import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ussd_manegement/features/app_screns_controllers/controllers/dropboxStreamController/DropBoxStreamController.dart';
import 'package:ussd_manegement/features/app_screns_controllers/modals/streaModel.dart';
import 'package:ussd_manegement/features/app_screns_controllers/screans/home/widgets/sendSms.dart';

class WidgetBuilderList {
  static List<Widget> buildListTiles(String selectedValue) {
    final MeuController meuController = Get.find<MeuController>();

    List<Widget> listTiles = [];

    if (selectedValue == "Netflix") {
      for (String email in MeuController.emails) {
        listTiles.add(
          ListTile(
            subtitle: Text(email),
            title: Text(selectedValue),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                meuController.filtrarEAdicionarNumerosPorEmail(email);
                List<ModelStream> allNotes = await meuController.notes;
                for (var note in allNotes) {
                  debugPrint(
                      "ID: ${note.id}, Numero do Cliente: ${note.numeroDoClienteDoPagamento}");
                }
                List<ModelStream> notesFiltradosPorEmail = allNotes
                    .where((note) => note.emailDaConta == email)
                    .toList();
                print(notesFiltradosPorEmail);

                print(meuController.numerosFiltrados);
                print("oaddddddddddddddddddddddddddddddddddddddddbject");
                await initiateMultipleSMS(
                    meuController.numerosFiltradosemail, "abdhabdabhda");
                print(meuController.numerosFiltradosemail);
                print("pau");
              },
            ),
            onTap: () {
              // Implemente a lógica de toque se necessário
            },
          ),
        );
      }
    } else if (selectedValue == "Outra Coisa") {
      // Adicione lógica específica para "Outra Coisa" se necessário
      listTiles.add(Text("Conteúdo específico para 'Outra Coisa'"));
    }

    return listTiles;
  }
}
