///halaman pembayaran
//

import 'bill.dart';
import 'function/function.dart';
import 'dart:io';
import 'core_page.dart';

class Payment {
  String? nomoratm;
  String? nama;
  String? nohp;
  String? email;
  String? pin;
  String? saldo;
  Map? database;

  Payment(
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
    print('${up * 26}');
    print('$side   HALAMAN PEMBAYARAN   $side');
    print('${up * 26}');
    print('');
  }
  void text1([int? a]) {
    print('Pembayaran SUPER CEPAT dari Bank TENG INDONESIA\n');
    print('''
Pilih layanan Pembayaran kamu :
1. Beli Pulsa
2. Bayar Tagihan
3. Kembali\n''');
    if (a == 1) {
      print('"Pilih layanan anda dengan memasukkan angka 1-3"\n');
    }
    try {
      stdout.write(' MASUKKAN ANGKA PILIHAN: ');
      int choice = int.parse(stdin.readLineSync()!);
      if (choice == 1) {
        print('ke beli pulsa');
      } else if (choice == 2) {
        var b = Bill(
            nomoratm: nomoratm,
            nama: nama,
            email: email,
            nohp: nohp,
            pin: pin,
            saldo: saldo,
            database: database);
        b.text1();
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
      var b = Payment(
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

void main() {
  var a = Payment();
  a.text1();
}
