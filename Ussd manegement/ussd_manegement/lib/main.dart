import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ussd_manegement/AppPrincipal.dart';
import 'package:ussd_manegement/features/app_screns_controllers/controllers/dropboxStreamController/DropBoxStreamController.dart';

void main() {
   Get.put(MeuController());
  runApp(const AppPrincipal());
}


