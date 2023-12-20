import 'dart:io';

import 'core_page.dart';
import 'function/function.dart';
import 'profile.dart';

///halaman rekening ku
///

class Rekeningku {
  String? nomoratm;
  String? nama;
  String? nohp;
  String? email;
  String? pin;
  String? saldo;
  Map? database;

  Rekeningku(
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
    print('${up * 27}');
    print('$side   HALAMAN REKENING KU   $side');
    print('${up * 27}');
    print('');
  }

  void text1([int? a]) {
    var noatm = insertspace(nomoratm);
    print('Nama       : $nama');
    print('Nomor ATM  : $noatm \n');
    print('      Saldo = Rp $saldo\n');
    print('Pilihan:');
    print('1. Nabung');
    print('2. Transfer');
    print('3. Kembali \n');
    if (a == 1) {
      print('"Masukkan angka 1 - 3"\n');
    }

    try {
      stdout.write(' MASUKKAN ANGKA PILIHAN : ');
      int choice = int.parse(stdin.readLineSync()!);
      if (choice == 1) {
        print('ke halaman nabung');
      } else if (choice == 2) {
        print('ke halaman transfer ');
      } else if (choice == 3) {
        var c = Core(nama, nomoratm,
            nohp: nohp,
            email: email,
            pin: pin,
            saldo: saldo,
            database: database);
        c.run();
      }
    } catch (e) {
      var b = Rekeningku(
          nomoratm: nomoratm,
          nama: nama,
          nohp: nohp,
          email: email,
          pin: pin,
          saldo: saldo,
          database: database);
      b.text1(1);
    }
  }
}
