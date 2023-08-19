///halaman nabung
///
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
    String input = stdin.readLineSync()!;
    String i = input.trim();
    String ii = i.replaceAll(' ', '');
    RegExp regex = RegExp(r'^[\d]+$');
    var scan = regex.hasMatch(ii);
    if (scan == true) {
      print('olah');
    } else {
      print('ulang');
    }

    // try {
    //   int input = int.parse(stdin.readLineSync()!);
    //   String i = input.toString();
    //   String ii = i.trim();
    //   String iii = ii.replaceAll(' ', '');
    //   //konversi cetak
    //   int jumalh = iii.length;
    //   print('$jumalh and $input');
    // } catch (e) {
    //   print('ulang');
    // }
  }
}

void main(List<String> args) {
  var a = Nabung();
  a.text1();
}
