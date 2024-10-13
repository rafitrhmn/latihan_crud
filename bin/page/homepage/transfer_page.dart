//halaman transfer
import 'dart:io';

import '../../function/function.dart';
import 'home_page.dart';
import '../transferPage/send_money_same_bank.dart';
import '../transferPage/send_money_bank_lain.dart';
import 'e_wallet.dart';

class Transfer extends HomePage {
  Transfer({required super.data, required super.accountinfo});

  void runTransfer({bool? again}) async {
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
    if (again == false) {
      print(
          '"Masukkan angka 1 untuk Transfer sesama bank, angka 2 untuk Transfer bank lain, angka 3 untuk E-Wallet dan angka 4 untuk kembali "');
      await waiting();
      print('');
    }
    try {
      stdout.write(' MASUKKAN ANGKA PILIHAN : ');
      int choice = int.parse(stdin.readLineSync()!);
      if (choice == 1) {
        SendMoneyToTheSameBank sendMoneyToTheSameBank =
            SendMoneyToTheSameBank(accountinfo: accountinfo, data: data);
        sendMoneyToTheSameBank.runSendMoneySame();
      } else if (choice == 2) {
        //transfer ke bank lain
        SendMoneyBankLain sendMoneyBankLain =
            SendMoneyBankLain(data: data, accountinfo: accountinfo);
        sendMoneyBankLain.runSendMoneyOther();
      } else if (choice == 3) {
        EWallet eWallet = EWallet(data: data, accountinfo: accountinfo);
        eWallet.runEwallet();
      } else if (choice == 4) {
        print('kembali ke halaman sebelumnya');
        runHomePage();
      }
    } catch (e) {
      runTransfer(again: false);
    }
  }
}
