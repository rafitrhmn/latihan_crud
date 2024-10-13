import 'dart:io';

import '../../function/function.dart';
import 'home_page.dart';
import 'pulsa.dart';
import '../billPage/payBills_page.dart';

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
        Pulsa pulsa = Pulsa(data: data, accountinfo: accountinfo);
        pulsa.runPulsa();
      } else if (choice == 2) {
        PayBills tagihan = PayBills(data: data, accountinfo: accountinfo);
        tagihan.runPayBills();
      } else if (choice == 3) {
        print('kembali ke halaman sebelumnya');
        runHomePage();
      }
    } catch (e) {}
  }
}
