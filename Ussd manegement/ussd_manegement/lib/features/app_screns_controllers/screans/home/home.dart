import 'package:flutter/material.dart';
import 'package:ussd_manegement/constants/colors.dart';
import 'package:ussd_manegement/constants/sizes.dart';
import 'package:ussd_manegement/constants/strings.dart';
import 'package:ussd_manegement/features/app_screns_controllers/modals/streaModel.dart';
import 'package:ussd_manegement/features/app_screns_controllers/screans/home/registoDepacote.dart';
import 'package:ussd_manegement/features/app_screns_controllers/screans/home/widgets/listitle.dart';
import 'package:ussd_manegement/features/app_screns_controllers/screans/home/widgets/registation.dart';
import 'package:ussd_manegement/utils/local_storage/sqlite.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  late DatabaseHelper handler;
  
  final db = DatabaseHelper();
  final title = TextEditingController();
  final content = TextEditingController();
  final formkey = GlobalKey<FormState>;

  @override
  void initState() {
    handler = DatabaseHelper();
    meuController.notes = handler.getStream();

    handler.initDB().whenComplete(() {
      meuController.notes = getAllNotes().then((allNotes) {
        meuController.numerosFiltrados.value =
            allNotes.map((note) => note.numeroDoCliente.toString()).toList();
        return allNotes;
      });
    });
    
    super.initState();
  }

  Future<List<ModelStream>> getAllNotes() {
    return handler.getStream();
  }

  Future<void> _refresh() async {
    
    setState(() {
      meuController.notes = getAllNotes().then((allNotes) {
        meuController.numerosFiltrados.value =
            allNotes.map((note) => note.numeroDoCliente.toString()).toList();
            //  // Imprimir detalhes de cada instância
            // for (var note in allNotes) {
            //   debugPrint("ID: ${note.id}, Numero do Cliente: ${note.numeroDoClienteDoPagamento}");
            // }
        return allNotes;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
        context, MaterialPageRoute(builder: (Context) => Registation()))
            .then((value) {
          if (value) {
            _refresh();
          }
        }),
        child: const Icon(Icons.add),
      ),

      // First we are going to show notes

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              DropdownButtonFormField(
                isExpanded: true,
                value: meuController.valorselecionado.value,
                items: TStrings.listaServicos
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  meuController.onValSelecionado(val as String);
                  _refresh();
                },
                icon: const Icon(
                  Icons.arrow_drop_down_circle,
                  color: TColors.buttonPrimary,
                ),
                decoration: const InputDecoration(
                    labelText: "Tipo de registo",
                    border: UnderlineInputBorder()),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              ...WidgetBuilderList.buildListTiles(
                  meuController.valorselecionado.value),
            ],
          ),
        ),
      ),
    );
  }
}


          // Expanded(
          //   child: FutureBuilder<List<ModelStream>>(
          //   future: notes,
          //   builder:
          //       (BuildContext context, AsyncSnapshot<List<ModelStream>> snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const CircularProgressIndicator();
          //     } else if (snapshot.hasData && snapshot.data!.isEmpty) {
          //       return const Text("No Data");
          //     } else if (snapshot.hasError) {
          //       return Text(snapshot.error.toString());
          //     } else {
                
          //       final items = snapshot.data ?? <ModelStream>[];
          //       return Column(
          //         children: [
          //                       ElevatedButton(
          //           onPressed: () async {
                      
          //             await initiateMultipleSMS(numerosFiltrados, "abdhabdabhda"); 
          //           },
          //           child: Text("Enviar mensagens", style: TextStyle(color: Colors.pink),)),
                
          //           Expanded(
          //             child: ListView.builder(
          //                 itemCount: items.length,
          //                 itemBuilder: (context, index) {
          //                   return ListTile(
          //                     // subtitle: Text(Dataformat),
          //                     title: Text(items[index].nipoDeRegisto),
          //                     trailing: IconButton(
          //                       icon: const Icon(Icons.delete),
          //                       onPressed: () {
          //                         db
          //                             .delete(items[index].id!)
          //                             .whenComplete(() => _refresh());
          //                       },
          //                     ),
          //                     onTap: () {
          //                       setState(() {
          //                         title.text = items[index].nipoDeRegisto;
          //                         content.text = items[index].nipoDeRegisto;
          //                       });
          //                       showDialog(
          //                           context: context,
          //                           builder: (context) {
          //                             return AlertDialog(
          //                                 actions: [
          //                                   Row(
          //                                     children: [
          //                                       TextButton(
          //                                           onPressed: () {
          //                                             db
          //                                                 .updateNote(
          //                                                     title.text,
          //                                                     content.text,
          //                                                     items[index].id)
          //                                                 .whenComplete(() {
          //                                               _refresh();
          //                                               Navigator.pop(context);
          //                                             });
          //                                           },
          //                                           child: const Text("Update")),
          //                                       TextButton(
          //                                           onPressed: () {},
          //                                           child: const Text("cancel"))
          //                                     ],
          //                                   )
          //                                 ],
          //                                 title: const Text("update note"),
          //                                 content: Column(
          //                                     mainAxisSize: MainAxisSize.min,
          //                                     children: [
          //                                       TextFormField(
          //                                         controller: title,
          //                                         validator: (value) {
          //                                           if (value!.isEmpty) {
          //                                             return "Tittle is required";
          //                                           }
          //                                         },
          //                                         decoration: const InputDecoration(
          //                                             label: Text("Tittle")),
          //                                       ),
          //                                       TextFormField(
          //                                         controller: content,
          //                                         validator: (value) {
          //                                           if (value!.isEmpty) {
          //                                             return "Tittle is required";
          //                                           }
          //                                         },
          //                                         decoration: const InputDecoration(
          //                                             label: Text("Tittle")),
          //                                       )
          //                                     ]));
          //                           });
          //                     },
          //                   );
          //                 }),
          //           ),
          //         ],
          //       );
          //     }
          //   },
          //         ),
          // ),