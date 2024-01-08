import 'package:flutter/material.dart';
import 'package:ussd_manegement/constants/sizes.dart';
import 'package:ussd_manegement/constants/strings.dart';
import 'package:ussd_manegement/features/app_screns_controllers/screans/home/widgets/registation.dart';


class Registation extends StatelessWidget {
  const Registation({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tittle
              Text(
                TStrings.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // Form
              Registration(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
