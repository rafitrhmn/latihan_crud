import 'dart:io';

import '../../function/function.dart';
import 'nabung_page.dart';

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
    String input = stdin.readLineSync()!;
    RegExp yes = RegExp(r'(Y|y|i?ya)');
    RegExp no = RegExp(r'(N|n|tidak)');
    var checkyes = yes.hasMatch(input);
    var checkno = no.hasMatch(input);
    if (checkyes == true) {
      runHomePage();
      //cek apakah nomor atm dan pin ada di homepage
    } else if (checkno == true) {
      runNota();
    } else {
      runNota(again: false);
    }
  }
}
