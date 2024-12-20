import 'dart:io';

import '../../function/function.dart';
import 'home_page.dart';

class About extends HomePage {
  About({required super.data, required super.accountinfo});

  void runAbout() async {
    eraser();
    print('${up * 28}');
    print('$side   HALAMAN TENTANG KAMI   $side');
    print('${up * 28}');
    print('');
    print("""
Assalamualaikum Warahmatullahi Wabarokatuh

Bank TENG INDONESIA. Bank nomor satu untuk masyarakat indonesia.
Kami melayani anda dengan sepenuh hati. kami tidak mengabaikan
perasaan anda dalam menggunakan layanan kami.

Dengan Transfer dan Pembayaran SUPER CEPAT. anda tidak perlu
khawatir dengan layanan kami. kami juga memproteksi uang dan
akun anda standar keamana yang tinggi. selamat menikmati layanan
dari BANK TENG INDONESIA. Terima kasih

Wassalammualaikum warahmatullahi Wabarokatuh.
""");
    await waiting();
    stdout.write('Kembali ke halaman sebelumnya? (Y/N) :');
    String input = stdin.readLineSync()!;
    RegExp yes = RegExp(r'(Y|y|i?ya)');
    RegExp no = RegExp(r'(N|n|tidak)');
    var checkyes = yes.hasMatch(input);
    var checkno = no.hasMatch(input);
    if (checkyes == true) {
      runHomePage();
    } else if (checkno == true) {
      runAbout();
    } else {
      runAbout();
    }
  }
}
