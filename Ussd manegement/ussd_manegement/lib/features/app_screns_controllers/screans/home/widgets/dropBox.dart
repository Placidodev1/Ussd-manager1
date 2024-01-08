
  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ussd_manegement/constants/colors.dart';
import 'package:ussd_manegement/constants/sizes.dart';
import 'package:ussd_manegement/constants/strings.dart';
import 'package:ussd_manegement/features/app_screns_controllers/controllers/dropboxStreamController/DropBoxStreamController.dart';
import 'package:ussd_manegement/features/app_screns_controllers/screans/home/widgets/registation.dart';


final MeuController meuController = Get.find();
class dropboxValidade extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() {
          if (meuController.valorselecionado.value == "Netflix" ||
              meuController.valorselecionado.value == "Prime video" ||
              meuController.valorselecionado.value == "Spotify" ||
              meuController.valorselecionado.value == "Crunchroll") {
            return Column(
              children: [
                DropdownButtonFormField(
                  isExpanded: true,
                  value: meuController.valStream.value,
                  items: TStrings.listaDeValidadeStream
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    meuController.onValStreamChanged(val as String);
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down_circle,
                    color: TColors.buttonPrimary,
                  ),
                  decoration: const InputDecoration(
                    labelText: "Validade",
                    border: UnderlineInputBorder(),
            ),
                ),

                const SizedBox(height: TSizes.spaceBtwItems),
                
                // TextFormField(
                //   controller: meuController.emailController,
                //   validator: (value) => meuController.validator(value!),
                //   decoration: const InputDecoration(
                //     labelText: "Email",
                //     prefixIcon: Icon(Icons.email),
                //   ),
                // ),
                DropdownButtonFormField(
                  isExpanded: true,
                  value: meuController.emailselecionado.value,
                  items: TStrings.emails
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    meuController.onValEmailSelecionadoChanged(val as String);
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down_circle,
                    color: TColors.buttonPrimary,
                  ),
                  decoration: const InputDecoration(
                    labelText: "email",
                    border: UnderlineInputBorder(),
            ),
                ),

                const SizedBox(height: TSizes.spaceBtwItems),

                TextFormField(
                  controller: meuController.userController,
                  validator: (value) => meuController.validator(value!),
                  decoration: const InputDecoration(
                    labelText: "User",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),

              ],
            );
          } else if (meuController.valorselecionado.value == "Megas movitel" ||
              meuController.valorselecionado.value == "Megas vodacom") {
            return DropdownButtonFormField(
              isExpanded: true,
              value: meuController.valMegas.value,
              items: TStrings.listaDeValidadeMegas
              
                  .map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: (val) {
                meuController.onValMegasChanged(val as String);
              },

                icon: const Icon(
                Icons.arrow_drop_down_circle,
                color: TColors.buttonPrimary,
              ),
              decoration: const InputDecoration(
                labelText: "Validade",
                border: UnderlineInputBorder(),
              ),

            );
          } else {
            //  A ideia e que esse nunca seja retornado
            return DropdownButtonFormField(
              isExpanded: true,
              items: ["Opção 1", "Opção 2", "Opção 3"]
                  .map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: (val) {
                // Lógica para quando o valor é alterado para outras opções
              },
            );
          }
        }),
      ],
    );
  }
}



// class DropBoxStream extends StatelessWidget {
//   const DropBoxStream({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }


// Widget dropdownWidget() {
//     if (_valorselecionado == "Netflix" ||
//         _valorselecionado == "Prime video" ||
//         _valorselecionado == "Spotify" ||
//         _valorselecionado == "Crunchroll") {
//       // Dropdown para validade de Megas
//       return Column(
//         children: [
//           DropdownButtonFormField(
//             isExpanded: true,
//             value: TStrings.valStream,
//             items: TStrings.listaDeValidadeStream
//                 .map((e) => DropdownMenuItem(
//                       child: Text(e),
//                       value: e,
//                     ))
//                 .toList(),
//             onChanged: (val) {
//               setState(() {
//                 TStrings.valStream = val as String;
//               });
//             },
//             icon: const Icon(
//               Icons.arrow_drop_down_circle,
//               color: TColors.buttonPrimary,
//             ),
//             decoration: const InputDecoration(
//               labelText: "Validade",
//               border: UnderlineInputBorder(),
//             ),
//           ),
//           const SizedBox(
//             height: TSizes.spaceBtwItems,
//           ),
//           TextFormField(
//             controller: TStrings.email,
//             decoration: const InputDecoration(
//                 labelText: TStrings.email, prefixIcon: Icon(Iconsax.direct)),
//           ),
//           const SizedBox(
//             height: TSizes.spaceBtwItems,
//           ),
//           TextFormField(
//             controller: userController,
//             decoration: const InputDecoration(
//                 labelText: "user", prefixIcon: Icon(Iconsax.direct)),
//           ),
//         ],
//       );
//     } else if (_valorselecionado == "Megas movitel" ||
//         _valorselecionado == "Megas vodacom") {
//       // Outro Dropdown específico para Netflix
//       return DropdownButtonFormField(
//         isExpanded: true,
//         value: TStrings.valMegas, // Substitua pelo valor que deseja para Netflix
//         items: TStrings.listaDeValidadeMegas
//             .map((e) => DropdownMenuItem(
//                   child: Text(e),
//                   value: e,
//                 ))
//             .toList(),
//         onChanged: (val) {
//           setState(() {
//             TStrings.valMegas = val as String;
//           });
//         },
//         icon: const Icon(
//           Icons.arrow_drop_down_circle,
//           color: TColors.buttonPrimary,
//         ),
//         decoration: const InputDecoration(
//           labelText: "Outro Label",
//           border: UnderlineInputBorder(),
//         ),
//       );
//     } else {
//       return DropdownButtonFormField(
//         isExpanded: true,
//         items: TStrings.listaDeValidadeStream
//             .map((e) => DropdownMenuItem(
//                   child: Text(e),
//                   value: e,
//                 ))
//             .toList(),
//         onChanged: (val) {
//           setState(() {
//             // Lógica para quando o valor é alterado para Netflix
//           });
//         },
//         icon: const Icon(
//           Icons.arrow_drop_down_circle,
//           color: TColors.buttonPrimary,
//         ),
//         decoration: const InputDecoration(
//           labelText: "Outro Label",
//           border: UnderlineInputBorder(),
//         ),
//       );
//     }
//   }