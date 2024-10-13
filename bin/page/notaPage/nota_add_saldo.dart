import 'dart:io';

import '../../function/function.dart';
import '../nabungPage/nabung_page.dart';

class Nota extends Nabung {
  int nabung;
  Nota({required super.data, required super.accountinfo, required this.nabung});

  void runNota({bool? again}) async {
    eraser();
    await waiting();
    var nabung2 = processingInput(nabung);
    var saldo2 = processingInput(accountinfo['Saldo']);
    print(up * 16);
    print('$side' + ' ' * 3 + 'Menabung' + ' ' * 3 + side);
    print(up * 16);
    print('');
    print('   Bukti Menabung');
    print('');
    print('Nomor ATM       : ${accountinfo['Nomor ATM']}');
    print('Nama Rekening   : ${accountinfo['Nama']}');
    print('Menabung        : + $nabung2');
    print('Saldo           : $saldo2');

    if (again == false) {
      print(' ');
      print('"Pilih Y untuk iya dan N untuk tidak"');
      await waiting();
    }
    await waiting();
    kembali();
  }

  void kembali() async {
    ///kembali ke halaman sebelunya atau ini
    await waiting();
    print('');
    stdout.write('Kembali ke halaman sebelumnya ? (Y/N) :');
    String input = stdin.readLineSync()!.trim();
    if (input == 'Y' || input == 'y') {
      runHomePage();
    } else if (input == 'N' || input == 'n') {
      runNota();
    } else {
      runNota(again: false);
    }
  }
}
