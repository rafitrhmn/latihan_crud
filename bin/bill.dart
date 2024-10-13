// ///halaman bayar tagihan
// ///
// import 'page/homePage/pembayaran_page.dart';
// import 'function/function.dart';
// import 'dart:io';

// class Bill {
//   String? nomoratm;
//   String? nama;
//   String? nohp;
//   String? email;
//   String? pin;
//   String? saldo;
//   Map? database;

//   Bill(
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
//     print('${up * 23}');
//     print('$side   HALAMAN TAGIHAN   $side');
//     print('${up * 23}');
//     print('');
//   }
//   void text1([int? a]) {
//     print('''
// Silahkan melakukan pembayaran:
// 1. Daftar mitra pembayaran
// 2. Bayar 
// 3. Kembali\n''');
//     if (a == 1) {
//       print('"Masukkan Angka 1-3"\n');
//     }
//     try {
//       stdout.write(' MASUKKAN ANGKA PILIHAN : ');
//       int choice = int.parse(stdin.readLineSync()!);
//       if (choice == 1) {
//         print('ke daftar mitra');
//       } else if (choice == 2) {
//         print('ke pembayarn');
//       } else if (choice == 3) {
//         var c = Payment(
//             nama: nama,
//             nomoratm: nomoratm,
//             nohp: nohp,
//             email: email,
//             pin: pin,
//             saldo: saldo,
//             database: database);
//         c.text1();
//       }
//     } catch (e) {
//       var b = Bill(
//           nomoratm: nomoratm,
//           nama: nama,
//           nohp: nohp,
//           email: email,
//           pin: pin,
//           saldo: saldo,
//           database: database);
//       b.text1(1);
//     }
//   }
// }

// void main(List<String> args) {
//   var a = Bill();
// }
