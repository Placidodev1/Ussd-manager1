import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import 'package:ussd_manegement/constants/colors.dart';
import 'package:ussd_manegement/constants/sizes.dart';
import 'package:ussd_manegement/constants/strings.dart';
import 'package:ussd_manegement/features/app_screns_controllers/controllers/dropboxStreamController/DropBoxStreamController.dart';
import 'package:ussd_manegement/features/app_screns_controllers/modals/streaModel.dart';
import 'package:ussd_manegement/features/app_screns_controllers/screans/home/widgets/datepicker.dart';
import 'package:ussd_manegement/features/app_screns_controllers/screans/home/widgets/dropBox.dart';

import 'package:ussd_manegement/utils/local_storage/sqlite.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  State<Registration> createState() => _RegistrationState();
}

final tipoDeRegistoController = TextEditingController();
final nomeDoClienteController = TextEditingController();
final numeroDoUsuarioController = TextEditingController();
final numeroDePagamentoController = TextEditingController();
final validadeController = TextEditingController();
final Controller = TextEditingController();
final emailController = TextEditingController();
final userController = TextEditingController();
final senhaController = TextEditingController();

const formkey = GlobalKey<FormState>;
final db = DatabaseHelper();
final MeuController meuController = Get.find();

class _RegistrationState extends State<Registration> {
  bool streamOuMegas = true;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        DropdownButtonFormField(
          isExpanded: true,
          value: TStrings.valorselecionado,
          items: TStrings.listaServicos
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          onChanged: (val) {
            meuController.onValSelecionado(val as String);
          },
          icon: const Icon(
            Icons.arrow_drop_down_circle,
            color: TColors.buttonPrimary,
          ),
          decoration: const InputDecoration(
              labelText: "Tipo de registo", border: UnderlineInputBorder()),
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        // Nome
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: TStrings.firstName, prefixIcon: Icon(Iconsax.user)),
        ),
        const SizedBox(
          width: TSizes.spaceBtwInputFields,
        ),

        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
        // Numero de usuario
        TextFormField(
          controller: numeroDoUsuarioController,
          decoration: const InputDecoration(
              labelText: "Numero de usuario",
              prefixIcon: Icon(CupertinoIcons.number)),
        ),

        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
        // Numero de pagamento
        TextFormField(
          controller: numeroDePagamentoController,
          decoration: const InputDecoration(
              labelText: "Numero de pagamento",
              prefixIcon: Icon(Iconsax.direct)),
        ),

        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        DataPickerButton(),
        
        // validade
        dropboxValidade(),

        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        // Password
        TextFormField(
          controller: senhaController,
          obscureText: true,
          decoration: const InputDecoration(
              labelText: TStrings.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffix: Icon(Iconsax.eye_slash)),
        ),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        // Sign up Buttom
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              print(
                  "njaduddbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
              print(meuController.emailselecionado.value);
              
              db
                  .createStream(ModelStream(
                    nipoDeRegisto: TStrings.valorselecionado,
                    nomeDoCliente: nomeDoClienteController.text,
                    numeroDoCliente: int.parse(numeroDoUsuarioController.text),
                    numeroDoClienteDoPagamento:
                        int.parse(numeroDePagamentoController.text),
                    validade: TStrings.valStream,
                    emailDaConta: meuController.emailselecionado.value,
                    userDaConta: userController.text,
                    password: senhaController.text,
                    dataDeSubscricao: meuController.dataselecionada.toIso8601String(),
                  ))
                  .whenComplete(() => Navigator.of(context).pop(true));
            },
            child: const Text(TStrings.createAccount),
          ),
        ),
      ],
    ));
  }
}


