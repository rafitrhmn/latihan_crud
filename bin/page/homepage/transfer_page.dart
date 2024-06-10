//halaman transfer
import 'dart:io';

import '../../function/function.dart';
import 'home_page.dart';
import 'send_money.dart';

class Transfer extends HomePage {
  Transfer({required super.data, required super.accountinfo});

  void runTransfer() {
    eraser();
    print('${up * 24}');
    print('$side   HALAMAN TRANSFER   $side');
    print('${up * 24}');
    print('');
    print('Nomor ATM  : ${insertspace(accountinfo['Nomor ATM'])}'); //cehck
    print('Transfer tepat dan akurat dari BANK TENG INDONESIA\n');
    print('Pilih layanan transfer kamu :');
    print('1. Transfer sesama bank Teng');
    print('2. Transfer bank lain');
    print('3. E-Wallet');
    print('4. Kembali\n');
    try {
      stdout.write(' MASUKKAN ANGKA PILIHAN : ');
      int choice = int.parse(stdin.readLineSync()!);
      if (choice == 1) {
        // print('ke halaman transfer sesama bank');
        SendMoneyToTheSameBank sendsamebank =
            SendMoneyToTheSameBank(data: data, accountinfo: accountinfo);
        sendsamebank.runSendMoneySame(inputatmx: true);
        // SendMoneyToTheSameBank a =
        //     SendMoneyToTheSameBank(data: data, accountinfo: accountinfo);
        // a.runSendMoneySame();
      } else if (choice == 2) {
        print('ke halaman transfer bank lain');
      } else if (choice == 3) {
        print('ke halaman e-wallet');
      } else if (choice == 4) {
        print('kembali ke halaman sebelumnya');
      }
    } catch (e) {}
  }
}
