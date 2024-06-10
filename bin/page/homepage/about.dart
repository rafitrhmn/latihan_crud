// ///halaman tentang kami
// ///
// import '../../function/function.dart';
// import 'dart:io';
// import 'home_page.dart';

// class About {
//   String? nomoratm;
//   String? nama;
//   String? nohp;
//   String? email;
//   String? pin;
//   String? saldo;
//   Map? database;

//   About(
//       {final up = '=',
//       final side = '|',
//       this.nomoratm,
//       this.nama,
//       this.nohp,
//       this.email,
//       this.pin,
//       this.saldo,
//       this.database}) {
//     eraser();
//     print('${up * 28}');
//     print('$side   HALAMAN TENTANG KAMI   $side');
//     print('${up * 28}');
//     print('');
//   }

//   void text1() {
//     print("""
// Assalamualaikum Warahmatullahi Wabarokatuh

// Bank TENG INDONESIA. Bank nomor satu untuk masyarakat indonesia.
// Kami melayani anda dengan sepenuh hati. kami tidak mengabaikan
// perasaan anda dalam menggunakan layanan kami.

// Dengan Transfer dan Pembayaran SUPER CEPAT. anda tidak perlu
// khawatir dengan layanan kami. kami juga memproteksi uang dan
// akun anda standar keamana yang tinggi. selamat menikmati layanan
// dari BANK TENG INDONESIA. Terima kasih

// Wassalammualaikum warahmatullahi Wabarokatuh.
// """);
//     kembali();
//   }

//   void kembali() async {
//     await waiting();
//     stdout.write('Kembali ke halaman sebelumnya ? (Y/N) :');
//     String nerima = stdin.readLineSync()!;
//     RegExp cek = RegExp(r'(Y|y|i?ya)');
//     RegExp cek2 = RegExp(r'(N|n|tidak)');
//     var b = cek.hasMatch(nerima);
//     var c = cek2.hasMatch(nerima);
//     if (b == true) {
//       var i = Core(nama, nomoratm,
//           nohp: nohp, email: email, pin: pin, saldo: saldo, database: database);
//       i.run();
//     } else if (c == true) {
//       var p = About(
//           nomoratm: nomoratm,
//           nama: nama,
//           nohp: nohp,
//           email: email,
//           pin: pin,
//           saldo: saldo,
//           database: database);
//       p.text1();
//     } else {
//       var p = About(
//           nomoratm: nomoratm,
//           nama: nama,
//           nohp: nohp,
//           email: email,
//           pin: pin,
//           saldo: saldo,
//           database: database);
//       p.text1();
//     }
//   }
// }

// void main(List<String> args) {
//   var a = About();
//   a.text1();
// }

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
// Assalamualaikum Warahmatullahi Wabarokatuh

// Bank TENG INDONESIA. Bank nomor satu untuk masyarakat indonesia.
// Kami melayani anda dengan sepenuh hati. kami tidak mengabaikan
// perasaan anda dalam menggunakan layanan kami.

// Dengan Transfer dan Pembayaran SUPER CEPAT. anda tidak perlu
// khawatir dengan layanan kami. kami juga memproteksi uang dan
// akun anda standar keamana yang tinggi. selamat menikmati layanan
// dari BANK TENG INDONESIA. Terima kasih

// Wassalammualaikum warahmatullahi Wabarokatuh.
// """);
    await waiting();
    stdout.write('Kembali ke halaman sebelumnya? (Y/N) :');
    String input = stdin.readLineSync()!;
    RegExp yes = RegExp(r'(Y|y|i?ya)');
    RegExp no = RegExp(r'(N|n|tidak)');
    var checkyes = yes.hasMatch(input);
    var checkno = no.hasMatch(input);
    if (checkyes == true) {
      print('Ke halaman sebelumnya');
    } else if (checkno == true) {
      print('Ke halaman ini lagi');
    }
  }
}
