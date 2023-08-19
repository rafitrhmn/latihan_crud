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
    String iii = ii.replaceAll('.', '');
    RegExp regex = RegExp(r'^[\d.]+$');
    var scan = regex.hasMatch(iii);
    if (scan == true) {
      olah(iii);
    } else {
      print('ulang');
    }
    // void olah() {
    //   print('mengolah');
    //   int jumalhkarakter = ii.length;
    //   for (int i = 0; i < jumalhkarakter; i++) {
    //     if (jumalhkarakter == 4) {
    //       var a = '${ii.substring(0, 1)},${ii.substring(1)}';
    //       print(a);
    //     }
    //   }
    // }
  }

  void olah(String iii) {
    if (iii.length == 4) {
      print('${iii.substring(0, 1)}.${iii.substring(1)}');
    } else if (iii.length == 5) {
      print('${iii.substring(0, 2)}.${iii.substring(2)}');
    } else if (iii.length == 6) {
      print('${iii.substring(0, 3)}.${iii.substring(3)}');
    } else if (iii.length == 7) {
      print(
          '${iii.substring(0, 1)}.${iii.substring(1, 5)}.${iii.substring(4)}');
    }
  }
}

void main(List<String> args) {
  var a = Nabung();
  a.text1();
}
