import 'dart:io';

import '../../function/function.dart';
import 'transfer_page.dart';

class SendMoneyToTheSameBank extends Transfer {
  SendMoneyToTheSameBank({required super.data, required super.accountinfo});

  void runSendMoneySame({
    bool? inputatmx,
    int? attempNoAtm2,
  }) async {
    eraser();
    print(up * 33);
    print('$side   TRANSFER SESAMA BANK Teng   $side');
    print(up * 33);
    print('');
    // if (inputatmx == false) {
    //   print(
    //       'Masukkan Nomor ATM Penerima dengan 7 karakter angka (sisa percobaan $attempNoAtm2 kali lagi)');
    //   print('');
    // }
    print('Transfer ke Bank Teng');
    print('Nomor ATM Pengirim    : ${insertspace(accountinfo['Nomor ATM'])}');
    print('Nama Pengirim         : ${accountinfo['Nama']}');

    int? inputatm;
    int attempt = 0;
    // int? inputuang;

    while (inputatm == null || attempt < 5) {
      // print('percobaan ke ; $attempt');
      stdout.write('Nomor ATM Penerima    : ');
      try {
        inputatm = int.parse(stdin.readLineSync()!);
      } catch (e) {
        // print('Masukkan Nomor ATM dengan 7 karakter angka');
        runSendMoneySame(
          inputatmx: false,
        );
      }
    }

    // while (inputuang == null) {
    //   stdout.write('Jumlah Uang dikirim   : ');
    //   try {
    //     inputuang = int.parse(stdin.readLineSync()!);
    //   } catch (e) {
    //     print('Masukkan Jumlah Uang dalam format angka.');
    //     againinputuang(nmratmpenerima: inputatm);
    //   }
    // }

    // eraser();
    // print(up * 33);
    // print('$side   TRANSFER SESAMA BANK Teng   $side');
    // print(up * 33);
    // print('');
    // if (inputatmx == false) {
    //   print(
    //       'Masukkan Nomor ATM Penerima dengan 7 karakter angka (sisa percobaan $attempNoAtm2 kali lagi)');
    //   print('');
    // }
    // print('Transfer ke Bank Teng');
    // print('Nomor ATM Pengirim    : ${insertspace(accountinfo['Nomor ATM'])}');
    // print('Nama Pengirim         : ${accountinfo['Nama']}');

    // //input nomor atm penerima
    // stdout.write('Nomor ATM Penerima    : ');
    // String noatm = stdin.readLineSync()!;
    // var trimNoatm = noatm.trim();
    // var fiksNoratm = trimNoatm.replaceAll(' ', '');

    // // verify the ATM Number is a 7 character number
    // RegExp verifNoAtm = RegExp(r'^\d{7}');
    // bool isverifNoAtm = verifNoAtm.hasMatch(fiksNoratm);
    // int attemptnoatm = 0;

    // if (!isverifNoAtm) {
    //   attemptnoatm++;
    //   if (attemptnoatm < 5) {
    //     runSendMoneySame(inputatmx: false, attempNoAtm2: attemptnoatm);
    //   } else if (attemptnoatm == 5) {
    //     print('anda lebih dari 5 kali percobaan');
    //   }
    // }

    // //input uang dikirim
    // stdout.write('Jumlah Uang dikirim   : ');
    // String sendMoney = stdin.readLineSync()!;
    // var trimSendMoney = sendMoney.trim();
    // var delSpaceSendMoney = trimSendMoney.replaceAll(' ', '');
    // var delDotSendMoney = delSpaceSendMoney.replaceAll('.', '');

    // // verify the ATM Number is a 7 character number
    // RegExp verifSendMoney = RegExp(r'^\d+$');
    // bool isverifSendMoney = verifSendMoney.hasMatch(delDotSendMoney);

    // if (!isverifSendMoney) {
    //   attempt++;
    //   if (attempt < 5) {
    //     // runSendMoneySame(inputatmx: false);
    //   } else if (attempt == 5) {
    //     print('anda lebih dari 5 kali percobaan');
    //   }
    // }
    // //
    // int? inputatm;
    // int? inputuang;

    // while (inputatm == null) {
    //   stdout.write('Nomor ATM Penerima    : ');
    //   try {
    //     inputatm = int.parse(stdin.readLineSync()!);
    //   } catch (e) {
    //     // print('Masukkan Nomor ATM dengan 7 karakter angka');
    //     runSendMoneySame(
    //       inputatmx: false,
    //     );
    //   }
    // }

    // while (inputuang == null) {
    //   stdout.write('Jumlah Uang dikirim   : ');
    //   try {
    //     inputuang = int.parse(stdin.readLineSync()!);
    //   } catch (e) {
    //     print('Masukkan Jumlah Uang dalam format angka.');
    //     againinputuang(nmratmpenerima: inputatm);
    //   }
    // }
    // print('berhasil mengrim uang');
  }

  void againinputuang({int? nmratmpenerima}) {
    eraser();
    print(up * 33);
    print('$side   TRANSFER SESAMA BANK Teng   $side');
    print(up * 33);
    print('');
    print('Masukkan Jumlah Uang dalam format angka.');
    print('');
    print('Transfer ke Bank Teng');
    print('Nomor ATM Pengirim    : ${insertspace(accountinfo['Nomor ATM'])}');
    print('Nama Pengirim         : ${accountinfo['Nama']}');
    print('Nomor ATM Penerima    : $nmratmpenerima');
  }
}
