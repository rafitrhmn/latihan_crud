import 'dart:io';

import 'c.dart';

void main() async {
  Map<String, String> dataATM = {
    '1234567890': '1234', // Nomor ATM dan PIN yang valid
    '0987654321': '5678',
    '5555555555': '4321',
  };

  int jumlahPercobaan = 0;
  bool berhasilMasuk = false;
  String nomorATM = '';
  String pin = '';

  while (jumlahPercobaan < 5 && !berhasilMasuk) {
    print('\n${' ' * 3} Loading...');
    await funglam();
    bersih();
    print('Masukkan nomor ATM: ');
    nomorATM = stdin.readLineSync()!;

    print('Masukkan PIN: ');
    pin = stdin.readLineSync()!;

    if (dataATM.containsKey(nomorATM) && dataATM[nomorATM] == pin) {
      berhasilMasuk = true;
    } else {
      jumlahPercobaan++;
      print('Verifikasi gagal. Nomor ATM atau PIN tidak valid.');
      print('Sisa percobaan: ${5 - jumlahPercobaan}\n');
    }
  }

  if (berhasilMasuk) {
    print('Verifikasi berhasil. Selamat datang!');
  } else {
    print(
        'Anda telah melebihi batas percobaan. Silakan kunjungi halaman lupa PIN.');
  }
}
