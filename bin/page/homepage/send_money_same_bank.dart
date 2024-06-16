import 'dart:io';

import '../../function/function.dart';
import 'transfer_page.dart';

class SendMoneyToTheSameBank extends Transfer {
  SendMoneyToTheSameBank({required super.data, required super.accountinfo});

  void runSendMoneySame({int attempt = 0}) async {
    eraser();
    print(up * 33);
    print('$side   TRANSFER SESAMA BANK Teng   $side');
    print(up * 33);
    print('');

    // Menampilkan pesan kesalahan jika attempt > 0
    if (attempt > 0) {
      print('Input salah, coba lagi. Kesempatan tersisa: ${5 - attempt}');
    }

    print('Transfer ke Bank Teng');
    print('Nomor ATM Pengirim    : ${insertspace(accountinfo['Nomor ATM']!)}');
    print('Nama Pengirim         : ${accountinfo['Nama']}');

    if (attempt < 5) {
      try {
        stdout.write('Nomor ATM Penerima    : ');
        int inputatm = int.parse(stdin.readLineSync()!);
        print('berhasil');
      } catch (e) {
        attempt++;
        runSendMoneySame(attempt: attempt);
      }
    } else {
      print('Kesempatan habis. Proses dihentikan.');
    }
  }

  void againinputuang({int? nmratmpenerima}) {
    eraser();
    print(up * 33);
    print('$side   TRANSFER SESAMA BANK Teng   $side');
    print(up * 33);
    print('');
    print('Masukkan Jumlah Uang dalam format angka.');
    print('');
    print('Transfer ke Bank Teng');
    print('Nomor ATM Pengirim    : ${insertspace(accountinfo['Nomor ATM'])}');
    print('Nama Pengirim         : ${accountinfo['Nama']}');
    print('Nomor ATM Penerima    : $nmratmpenerima');
  }
}
