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

    print(data);
    print('Transfer ke Bank Teng');
    print('Nomor ATM Pengirim    : ${insertspace(accountinfo['Nomor ATM']!)}');
    print('Nama Pengirim         : ${accountinfo['Nama']}');

    if (attempt < 5) {
      try {
        stdout.write('Nomor ATM Penerima    : ');
        int inputatm = int.parse(stdin.readLineSync()!);
        String input = inputatm.toString();

        // Periksa apakah nomor ATM penerima valid dan berbeda dari pengirim
        var receiver = data.firstWhere(
          (user) => user.containsKey(input),
          orElse: () => {},
        );

        if (receiver.isEmpty) {
          print('ATM tidak sama.');
          throw Exception('ATM tidak sama.');
        } else if (inputatm == int.parse(accountinfo['Nomor ATM']!)) {
          print(
              'Nomor ATM penerima tidak boleh sama dengan nomor ATM pengirim.');
          throw Exception(
              'Nomor ATM penerima tidak boleh sama dengan nomor ATM pengirim.');
        } else if (receiver.isNotEmpty) {
          print('atm ada');
        }
      } catch (e) {
        attempt++;
        print('gagal disni');
        // runSendMoneySame(attempt: attempt);
      }
    } else {
      print('Kesempatan habis. Proses dihentikan.');
    }
  }
}
