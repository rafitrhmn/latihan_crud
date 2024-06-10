import 'dart:io';

import '../../database/database_model.dart';
import '../../function/function.dart';
import 'nota_add_saldo.dart';
import 'rekeningku_page.dart';

class Nabung extends Rekeningku {
  Nabung({required super.data, required super.accountinfo});

  void runNabung() async {
    eraser();
    print('${up * 22}');
    print('$side   HALAMAN NABUNG   $side');
    print('${up * 22}');
    print('');
    print('Nama       : ${accountinfo['Nama']}'); //cehck
    print('   Masukkan jumlah uang yang ingin ditabung :');
    stdout.write('Rp ');
    String? input = stdin.readLineSync(); // Membaca input dari pengguna
    var i = input?.trim();
    var ii = i?.replaceAll('.', '');

    try {
      int addsaldo = int.parse(ii!);
      // print('Angka yang dimasukkan: $number');
      if (addsaldo >= 10000000) {
        print('tidak bisa menabngu degna uang 10 juta');
      } else if (addsaldo <= 9999999) {
        print('');
        confirm(addsaldo: addsaldo);
      }
    } catch (e) {
      runNabung();
    }
  }

  void confirm({int? addsaldo}) {
    var addsaldo2 = processingInput(addsaldo!);
    stdout.write('anda ingin menabung sebesar Rp $addsaldo2 ?(Y/N) ');
    var input = stdin.readLineSync()!;
    RegExp yes = RegExp(r'(Y|y|i?ya)');
    RegExp no = RegExp(r'(N|n|tidak)');
    var checkyes = yes.hasMatch(input);
    var checkno = no.hasMatch(input);
    if (checkyes == true) {
      print('lanjut ke penjumalaan');
      addSaldo(addsaldo: addsaldo);
    } else if (checkno == true) {
      waiting();
      Rekeningku rekeningku = Rekeningku(data: data, accountinfo: accountinfo);
      rekeningku.runRekeningku();
    } else {
      waiting();
      Rekeningku rekeningku = Rekeningku(data: data, accountinfo: accountinfo);
      rekeningku.runRekeningku();
    }
  }

  void addSaldo({int? addsaldo}) {
    DatabaseModel database = DatabaseModel();
    accountinfo['Saldo'] += addsaldo;
    print('${accountinfo['Saldo']}');
    var dataupdated =
        database.updateAccountInfo(accountinfo['Saldo'], accountinfo);
    //ubah dari tipe int? ke int
    int addsaldo2 = addsaldo ?? 0;
    Nota nota = Nota(accountinfo: dataupdated, data: data, nabung: addsaldo2);
    nota.runNota();
  }
}
