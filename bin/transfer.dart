/// halaman transfer
///

import 'function/function.dart';
import 'core_page.dart';
import 'dart:io';

class Transfer {
  String? nomoratm;
  String? nama;
  String? nohp;
  String? email;
  String? pin;
  String? saldo;
  Map? database;

  Transfer(
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
    print('${up * 24}');
    print('$side   HALAMAN TRANSFER   $side');
    print('${up * 24}');
    print('');
  }

  void text1([int? a]) {
    print('Transfer tepat dan akurat dari BANK TENG INDONESIA\n');
    print('Pilih layanan transfer kamu :');
    print('1. Transfer sesama bank');
    print('2. Transfer bank lain');
    print('3. E-Wallet');
    print('4. Kembali\n');
    if (a == 1) {
      print('"Pilih Layanan anda dengan masukkan angka 1-4"\n');
    }
    try {
      stdout.write('MASUKKAN ANGKA PILIHAN: ');
      int choice = int.parse(stdin.readLineSync()!);
      if (choice == 1) {
        print('ke Transfer sesama bank');
      } else if (choice == 2) {
        print('ke Transfer bank lain');
      } else if (choice == 3) {
        print('ke e-wallet');
      } else if (choice == 4) {
        var a = Core(nama, nomoratm,
            nohp: nohp,
            email: email,
            pin: pin,
            saldo: saldo,
            database: database);
        a.run();
      }
    } catch (e) {
      var b = Transfer(
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

void main(List<String> args) {
  var a = Transfer();
  a.text1();
}
