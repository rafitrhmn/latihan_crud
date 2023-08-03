///menampilkan halaman depan
///
///
import 'dart:io';
import 'register.dart';
import 'login.dart';

///kelas title halaman depan
class Interface {
  //function membuat line =
  void lineEquals() {
    print('=' * 56);
  }

  //function judul
  void text(final side) {
    String line = '_';
    print("$side ${" " * 15} BANK TENG INDONESIA ${" " * 16} $side");
    print('$side ${' ' * 13} "Kepak Sayap Kebangsaan" ${" " * 13} $side');
    print(
        '$side ${' ' * 2} Komplek Senayan DPR RI, JL.banteng merah No.03 ${" " * 2} $side');
    print('$side ${' ' * 11} Email : BankTengIndo@gamil.com ${" " * 9} $side');
    print(side + line * 54 + side);
  }
}

///kelas halaman depan inputan
class Interface2 extends Interface {
  //function kelang satu baris
  void text2(final side) {
    print(side + ' ' * 54 + side);
  }

  //function text pembukaan
  void text3(final side) {
    print(side +
        """
 Assalamualaikum Warahmatullahi Wabarakatuh ${' ' * 9} $side
$side Selamat datang di Bank Teng Indonesia ${' ' * 14} $side""");
    print(side + ' Bank pelayan masyarakat Indonesia untuk ${" " * 12} $side');
    print('$side Indonesia Maju 2024 ${' ' * 32} $side');
  }

  //function menu option
  void option() {
    final side = '|';
    text2('|');
    print("$side ${" " * 5} PILIHAN:  ${" " * 36} $side");
    print("$side ${" " * 5} 1.LOGIN  ${" " * 37} $side");
    print("$side ${" " * 5} 2.DAFTAR  ${" " * 36} $side");
    text2('|');
    lineEquals();
  }

  //funation proses inputan
  void input(final side) {
    var a = Login();
    var b = Daftar();
    try {
      print(' ');
      stdout.write('  MASUKKAN ANGKA PILIHAN ANDA : ');
      int milih = int.parse(stdin.readLineSync()!);
      if (milih == 1) {
        a.database();
      } else if (milih == 2) {
        b.runningRegis();
      } else if (milih >= 3) {
        eraser();
        again();
      } else if (milih <= 0) {
        eraser();
        again();
      }
    } catch (e) {
      eraser();
      again_2();
    }
  }

  //function mengulang inputan jika pengguna menginputkan text string
  void again() {
    var ab = Interface();
    lineEquals();
    ab.text('|');
    text2('|');
    text3('|');
    option();
    print(' "Pilihan berupa angka (1 untuk login dan 2 untuk daftar )"');
    input('|');
  }

  //function mengulang inputan jika pengguna menginputkan nomor bukan 1 atau 2
  void again_2() {
    lineEquals();
    var ab = Interface();
    ab.text('|');
    text2('|');
    text3('|');
    option();
    print(' "Inputan harus angka 1 atau 2"');
    input('|');
  }
}

class RunFront {
  void run() async {
    await waiting();
    eraser();
    var interface = Interface();
    interface.lineEquals();
    interface.text('|');

    var interface2 = Interface2();
    interface2.text2('|');
    interface2.text3('|');
    interface2.option();
    interface2.input('|');
  }
}

void main() {
  ///menjalankan function
  var interface = Interface();
  interface.lineEquals();
  interface.text('|');

  var interface2 = Interface2();
  interface2.text2('|');
  interface2.text3('|');
  interface2.option();
  interface2.input('|');
}
