
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ussd_manegement/features/app_screns_controllers/controllers/dropboxStreamController/DropBoxStreamController.dart';

class DataPickerButton extends StatelessWidget {
  const DataPickerButton({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final MeuController meuController = Get.find();
    return ElevatedButton(
      onPressed: () {
        // Abre o DatePickerDialog quando o botão é pressionado
        showDatePicker(
          context: context,
          
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.now(),
          firstDate: DateTime(2024),
          lastDate: DateTime(2026),
        ).then((value) => 
          meuController.dataselecionada = value!
        );
      },
      child: const Text("Escolher Data"),
    );
  }
}