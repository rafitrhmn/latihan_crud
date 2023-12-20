///halaman nabung
///
import 'function/function.dart';
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
    String input = stdin.readLineSync()!;
    String i = input.trim();
    String ii = i.replaceAll(' ', '');
    String iii = ii.replaceAll('.', '');
    RegExp regex = RegExp(r'^[\d.]+$');
    var scan = regex.hasMatch(iii);
    if (scan == true) {
      print('');
      olah(iii);
    } else {
      print('ulang');
    }
  }

  void olah(String iii) {
    if (iii.length == 4) {
      var a = '${iii.substring(0, 1)}.${iii.substring(1)}';
      question(a);
    } else if (iii.length == 5) {
      var a = '${iii.substring(0, 2)}.${iii.substring(2)}';
      question(a);
    } else if (iii.length == 6) {
      var a = '${iii.substring(0, 3)}.${iii.substring(3)}';
      question(a);
    } else if (iii.length == 7) {
      var a =
          '${iii.substring(0, 1)}.${iii.substring(1, 5)}.${iii.substring(4)}';
      question(a);
    }
  }

  void question(String a) {
    stdout.write('anda ingin menabung sebesar Rp $a ?(Y/N) ');
    var b = stdin.readLineSync()!;
    RegExp cek = RegExp(r'(Y|y|i?ya)');
    RegExp cek2 = RegExp(r'(N|n|tidak)');
    bool c = cek.hasMatch(b);
    bool cc = cek2.hasMatch(b);
    if (c == true) {
      print('lanjut ke nota');
    } else if (cc = true) {
      print('ke halaman core page');
    }
  }
}

void main(List<String> args) {
  var a = Nabung();
  a.text1();
}
