import 'dart:io';

import '../../function/function.dart';
import 'home_page.dart';
import 'nabung_page.dart';
import 'transfer_page.dart';

class Rekeningku extends HomePage {
  Rekeningku({required super.data, required super.accountinfo});

  Future<void> runRekeningku({bool? again}) async {
    var saldo = accountinfo['Saldo'];
    String viewsaldo = processingInput(saldo);

    eraser();
    print(up * 27);
    print('$side   HALAMAN REKENING KU   $side');
    print(up * 27);
    print('');
    print('Nama       : ${accountinfo['Nama']}');
    print('Nomor ATM  : ${insertspace(accountinfo['Nomor ATM'])}');
    // print('saldo      : ${accountinfo['Saldo']}');
    print('saldo      : $viewsaldo');
    print('Pilihan:');
    print('1. Nabung');
    print('2. Transfer');
    print('3. Kembali \n');
    print('');
    if (again == false) {
      print(
          '"Masukkan angka 1 untuk Nabung, angka 2 untuk Transfer dan angka 3 untuk kembali "');
      await waiting();
      print('');
    }
    try {
      stdout.write(' MASUKKAN ANGKA PILIHAN : ');
      int choice = int.parse(stdin.readLineSync()!);
      if (choice == 1) {
        print('ke halaman nabung');
        Nabung nabung = Nabung(data: data, accountinfo: accountinfo);
        nabung.runNabung();
      } else if (choice == 2) {
        print('ke halaman transfer ');
        Transfer transfer = Transfer(data: data, accountinfo: accountinfo);
        transfer.runTransfer();
      } else if (choice == 3) {
        print('kembali ke halaman sebelumnya');
        runHomePage();
      } else {
        runRekeningku(again: false);
      }
    } catch (e) {
      runRekeningku(again: false);
    }
  }
}
