///halaman nabung
///
import 'dart:math';

import 'function.dart';
import 'dart:io';

class Nabung {
  String? nomoratm;
  String? nama;
  String? nohp;
  String? email;
  String? pin;
  String? saldo;
  Map? database;

  Nabung(
      {final up = '=',
      final side = '|',
      this.nomoratm,
      this.nama,
      this.nohp,
      this.email,
      this.pin,
      this.saldo,
      this.database}) {
    eraser();
    print('${up * 22}');
    print('$side   HALAMAN NABUNG   $side');
    print('${up * 22}');
    print('');
  }
  void text1() {
    print('   Masukkan jumlah uang yang ingin ditabung :');
    stdout.write('Rp ');
    try {
      int input = int.parse(stdin.readLineSync()!);
      int a = 0;
      int jumalh = input.bitLength();
      for (var i = 0; )
    } catch (e) {
      print('ulang');
    }
  }
}

void main(List<String> args) {
  var a = Nabung();
  a.text1();
}
