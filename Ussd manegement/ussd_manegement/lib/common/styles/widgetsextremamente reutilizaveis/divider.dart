
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ussd_manegement/constants/colors.dart';
import 'package:ussd_manegement/constants/strings.dart';
import 'package:ussd_manegement/utils/helpers/helper_functions.dart';

class TFormDevider extends StatelessWidget {
  const TFormDevider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
                color: dark ? TColors.darkGrey : TColors.grey,
                thickness: 0.5,
                indent: 60,
                endIndent: 5)),
        Text(
          TStrings.orSignInWith.capitalize!,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
            child: Divider(
                color: dark ? TColors.darkGrey : TColors.grey,
                thickness: 0.5,
                indent: 5,
                endIndent: 60))
      ],
    );
  }
}
