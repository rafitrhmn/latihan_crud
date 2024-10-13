import 'dart:io';
import 'transfer_page.dart';
import '../../function/function.dart';
import 'e_wallet_2.dart';

class EWallet extends Transfer {
  EWallet({required super.data, required super.accountinfo});

  void runEwallet() {
    eraser();
    print(up * 16);
    print('$side   E-Wallet   $side');
    print(up * 16);

    print('');
    print('Isi saldo E-Wallet');
    print('Pilih E-Wallet :');
    print('1. Dana');
    print('2. Gopay');
    print('3. Ovo\n');
    try {
      stdout.write('MASUKKAN ANGKA PILIHAN : ');
      int choice = int.parse(stdin.readLineSync()!);
      if (choice == 1) {
        EWallet2 eWallet2 = EWallet2(data: data, accountinfo: accountinfo);
        eWallet2.runEwallet2(choice: 1);
      } else if (choice == 2) {
        EWallet2 eWallet2 = EWallet2(data: data, accountinfo: accountinfo);
        eWallet2.runEwallet2(choice: 2);
      } else if (choice == 3) {
        EWallet2 eWallet2 = EWallet2(data: data, accountinfo: accountinfo);
        eWallet2.runEwallet2(choice: 3);
      } else {
        runTransfer();
      }
    } catch (e) {
      //ke function tranfer
      runTransfer();
    }
  }
}
