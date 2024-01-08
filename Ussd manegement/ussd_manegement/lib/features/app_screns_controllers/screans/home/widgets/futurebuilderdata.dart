// FutureBuilder<List<ModelStream>>(
//         future: notes,
//         builder:
//             (BuildContext context, AsyncSnapshot<List<ModelStream>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const CircularProgressIndicator();
//           } else if (snapshot.hasData && snapshot.data!.isEmpty) {
//             return const Text("No Data");
//           } else if (snapshot.hasError) {
//             return Text(snapshot.error.toString());
//           } else {
            
//             final items = snapshot.data ?? <ModelStream>[];
//             return Column(
//               children: [
//                             ElevatedButton(
//                 onPressed: () async {
//                   print(numerosFiltrados);
//                   await initiateMultipleSMS(numerosFiltrados, "abdhabdabhda");
//                 },
//                 child: Text("Enviar mensagens", style: TextStyle(color: Colors.pink),)),
            
//                 Expanded(
//                   child: ListView.builder(
//                       itemCount: items.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           // subtitle: Text(Dataformat),
//                           title: Text(items[index].nipoDeRegisto),
//                           trailing: IconButton(
//                             icon: const Icon(Icons.delete),
//                             onPressed: () {
//                               db
//                                   .delete(items[index].id!)
//                                   .whenComplete(() => _refresh());
//                             },
//                           ),
//                           onTap: () {
//                             setState(() {
//                               title.text = items[index].nipoDeRegisto;
//                               content.text = items[index].nipoDeRegisto;
//                             });
//                             showDialog(
//                                 context: context,
//                                 builder: (context) {
//                                   return AlertDialog(
//                                       actions: [
//                                         Row(
//                                           children: [
//                                             TextButton(
//                                                 onPressed: () {
//                                                   db
//                                                       .updateNote(
//                                                           title.text,
//                                                           content.text,
//                                                           items[index].id)
//                                                       .whenComplete(() {
//                                                     _refresh();
//                                                     Navigator.pop(context);
//                                                   });
//                                                 },
//                                                 child: const Text("Update")),
//                                             TextButton(
//                                                 onPressed: () {},
//                                                 child: const Text("cancel"))
//                                           ],
//                                         )
//                                       ],
//                                       title: const Text("update note"),
//                                       content: Column(
//                                           mainAxisSize: MainAxisSize.min,
//                                           children: [
//                                             TextFormField(
//                                               controller: title,
//                                               validator: (value) {
//                                                 if (value!.isEmpty) {
//                                                   return "Tittle is required";
//                                                 }
//                                               },
//                                               decoration: const InputDecoration(
//                                                   label: Text("Tittle")),
//                                             ),
//                                             TextFormField(
//                                               controller: content,
//                                               validator: (value) {
//                                                 if (value!.isEmpty) {
//                                                   return "Tittle is required";
//                                                 }
//                                               },
//                                               decoration: const InputDecoration(
//                                                   label: Text("Tittle")),
//                                             )
//                                           ]));
//                                 });
//                           },
//                         );
//                       }),
//                 ),
//               ],
//             );
//           }
//         },
//       ),