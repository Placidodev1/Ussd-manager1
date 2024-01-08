
// import 'package:url_launcher/url_launcher.dart';

// Future<void> initiateMultipleSMS(List<String> phoneNumbers) async {
//     List<String> smsUrls = phoneNumbers.map((phone) => 'sms:$phone').toList();

//     for (String smsUrl in smsUrls) {
//       try {
//         //Sms phone number
//         String num1 = '123';
//         String num2 = '456';
//         String msg = 'Hello world';

//         final sms = Uri.parse('sms:${num1},${num2}?body=${msg}');
//         if (await canLaunchUrl(sms)) {
//           await launchUrl(sms);
//         } else {
//           throw 'Could not launch $sms';
//         }
//         // await Future.delayed(Duration(milliseconds: 500)); // Optional delay
//       } catch (e) {
//         print('Error launching SMS: $e');
//       }
//     }
//   }



// import 'package:url_launcher/url_launcher.dart';

// Future<void> initiateMultipleSMS(List<String> phoneNumbers, String message) async {
//   for (String phoneNumber in phoneNumbers) {
//     try {
//       final sms = Uri.parse('sms:$phoneNumber?body=$message');
//       if (await canLaunch(sms.toString())) {
//         await launch(sms.toString());
//       } else {
//         throw 'Could not launch $sms';
//       }
//       // await Future.delayed(Duration(milliseconds: 500)); // Optional delay
//     } catch (e) {
//       print('Error launching SMS: $e');
//     }
//   }
// }



import 'package:url_launcher/url_launcher.dart';

Future<void> initiateMultipleSMS(List<String> phoneNumbers, String message) async {
  try {
    // Concatena todos os números de telefone com ',' para criar uma string de destino
    String destination = phoneNumbers.join(',');

    // Cria a URI para o envio de SMS
    final sms = Uri.parse('sms:$destination?body=$message');

    // Verifica se é possível lançar a URI
    if (await canLaunch(sms.toString())) {
      // Lança a URI
      await launch(sms.toString());
    } else {
      throw 'Could not launch $sms';
    }
  } catch (e) {
    print('Erro ao enviar SMS: $e');
  }
}
