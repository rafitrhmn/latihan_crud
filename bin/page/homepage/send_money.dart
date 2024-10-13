// import 'dart:io';

// import '../../function/function.dart';
// import 'transfer_page.dart';

// class SendMoneyToTheSameBank extends Transfer {
//   SendMoneyToTheSameBank({required super.data, required super.accountinfo});

//   void runSendMoneySame({bool? inputatmx, int? attempt = 0}) async {
//     eraser();
//     print(up * 33);
//     print('$side   TRANSFER SESAMA BANK Teng   $side');
//     print(up * 33);
//     print('');
//     if (inputatmx == false) {
//       print(
//           'Masukkan Nomor ATM Penerima dengan 7 karakter angka (sisa percobaan $attempt kali lagi)');
//       print('');
//     }
//     print('Transfer ke Bank Teng');
//     print('Nomor ATM Pengirim    : ${insertspace(accountinfo['Nomor ATM'])}');
//     print('Nama Pengirim         : ${accountinfo['Nama']}');
//     int? inputatm;
//     int percobaannoatm = 0;

//     if (inputatmx == true) {
//       while (inputatm == null || percobaannoatm == 5) {
//         int attempt2 = 5;
//         stdout.write('Nomor ATM Penerima    : ');
//         try {
//           inputatm = int.parse(stdin.readLineSync()!);
//           String noatm2 = inputatm.toString();
//           print(noatm2);
//           // RegExp verifNoatm = RegExp(r'^\d{7}');
//           // bool isverifNoAtm = verifNoatm.hasMatch(noatm2);
//           // if (isverifNoAtm == true) {
//           //   print('no atm yg ingin dikirim : $noatm2');
//           // } else {
//           //   // runSendMoneySame(inputatmx: false || true);
//           // }
//         } catch (e) {
//           var decatttempt = attempt2--;
//           percobaannoatm++;
//           runSendMoneySame(inputatmx: false, attempt: decatttempt);
//         }
//       }
//     }
//   }
// }

// import 'dart:io';

// import '../../function/function.dart';
// import 'transfer_page.dart';

// class SendMoneyToTheSameBank extends Transfer {
//   SendMoneyToTheSameBank({required super.data, required super.accountinfo});

//   void runSendMoneySame({bool? inputatmx, String? a = ' '}) async {
//     eraser();
//     print(up * 33);
//     print('$side   TRANSFER SESAMA BANK Teng   $side');
//     print(up * 33);
//     print('');
//     if (inputatmx == false) {
//       print(a);
//       print('');
//     }
//     print('Transfer ke Bank Teng');
//     print('Nomor ATM Pengirim    : ${insertspace(accountinfo['Nomor ATM'])}');
//     print('Nama Pengirim         : ${accountinfo['Nama']}');
//     int? inputatm;
//     int attempt = 5;

//     if (inputatmx == true) {
//       while (inputatm == null && attempt > 0) {
//         stdout.write('Nomor ATM Penerima    : ');
//         try {
//           String inputSend = stdin.readLineSync()!;
//           String inputSend2 = inputSend.trim();
//           inputatm = int.parse(inputSend2);
//           verifnoatmsend(noatmSend: inputatm);

//           // inputatm = int.parse(stdin.readLineSync()!);
//           // String noatm2 = inputatm.toString();
//           // print(noatm2);
//           // RegExp verifNoatm = RegExp(r'^\d{7}');
//           // bool isverifNoAtm = verifNoatm.hasMatch(noatm2);
//           // if (isverifNoAtm == true) {
//           //   print('no atm yg ingin dikirim : $noatm2');
//           // } else if (isverifNoAtm == false) {
//           //   attempt--;
//           //   var a =
//           //       'Nomor ATM yang dimasukkan tidak valid (sisa percobaan $attempt kali lagi).';
//           //   runSendMoneySame(inputatmx: false, a: a);
//           // }
//         } catch (e) {
//           attempt--;
//           var a =
//               'Nomor ATM yang dimasukkan tidak valid (sisa percobaan $attempt kali lagi).';
//           runSendMoneySame(inputatmx: false, a: a);
//         }
//       }
//     }
//   }

//   void verifnoatmsend({int? noatmSend}) {}
// }
