import 'package:flutter/material.dart';
import 'package:ussd_manegement/utils/theme/theme.dart';

class AppPrincipal extends StatelessWidget {
  const AppPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
    );
  }
}