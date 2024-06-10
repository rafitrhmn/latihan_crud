import 'dart:io';

import '../../function/function.dart';
import 'home_page.dart';

class Pembayaran extends HomePage {
  Pembayaran({required super.data, required super.accountinfo});

  void runPembayaran() {
    eraser();
    print('${up * 26}');
    print('$side   HALAMAN PEMBAYARAN   $side');
    print('${up * 26}');
    print('');
    print('Pembayaran SUPER CEPAT dari Bank TENG INDONESIA\n');
    print('''
Pilih layanan Pembayaran kamu :
1. Beli Pulsa
2. Bayar Tagihan
3. Kembali\n''');
    try {
      stdout.write(' MASUKKAN ANGKA PILIHAN : ');
      int choice = int.parse(stdin.readLineSync()!);
      if (choice == 1) {
        print('ke halaman beli pulsa');
      } else if (choice == 2) {
        print('ke halaman bayar tagihan ');
      } else if (choice == 3) {
        print('kembali ke halaman sebelumnya');
      }
    } catch (e) {}
  }
}
