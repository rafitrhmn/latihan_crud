///displays the front page
///
///
import 'dart:io';
import '../function/function.dart';
import '../login.dart';
import 'register_page.dart';

///class front page
class FrontPage {
  //field class
  final side = '|';
  final line = '_';

  //method runing in class interface
  void run([int? a, Map? database]) async {
    if (a == 1) {
      title();
      Opening();
      option();
      input(1);
    } else if (a == 2) {
      await waiting();
      eraser();
      title();
      Opening();
      option();
      input(2, database);
    }
  }

  //method title in class interface
  void title() {
    print('=' * 56);
    print("$side ${" " * 15} BANK TENG INDONESIA ${" " * 16} $side");
    print('$side ${' ' * 13} "Kepak Sayap Kebangsaan" ${" " * 13} $side');
    print(
        '$side ${' ' * 2} Komplek Senayan DPR RI, JL.banteng merah No.03 ${" " * 2} $side');
    print('$side ${' ' * 11} Email : BankTengIndo@gamil.com ${" " * 9} $side');
    print(side + line * 54 + side);
  }

  //method text opening
  void Opening() {
    empty();
    print("""
$side Assalamualaikum Warahmatullahi Wabarakatuh ${' ' * 9} $side
$side Selamat datang di Bank Teng Indonesia ${' ' * 14} $side
$side Bank pelayan masyarakat Indonesia untuk ${" " * 12} $side
$side Indonesia Maju 2024 ${' ' * 32} $side""");
  }

  //selection menu method
  void option([int? i]) {
    empty();
    print("$side ${" " * 5} PILIHAN:  ${" " * 36} $side");
    print("$side ${" " * 5} 1.LOGIN  ${" " * 37} $side");
    print("$side ${" " * 5} 2.DAFTAR  ${" " * 36} $side");
    empty();
    print('=' * 56);
    if (i == 1) {
      print('');
      print('''
 "Pilihan berupa angka
 (angka 1 untuk login dan angka 2 untuk daftar")
''');
    }
  }

  //input processing method
  void input([int? c, Map? database]) {
    var a = Login();
    var b = Register();
    try {
      print(' ');
      stdout.write('  MASUKKAN ANGKA PILIHAN ANDA : ');
      int milih = int.parse(stdin.readLineSync()!);
      if (milih == 1 && c == 1) {
        a.database();
      } else if (milih == 1 && c == 2) {
        a.input(data: database);
      } else if (milih == 2) {
        b.runningRegis();
      } else if (milih <= 0 || milih >= 3 && c == 1) {
        eraser();
        again(1);
      } else if (milih <= 0 || milih >= 3 && c == 2) {
        eraser();
        again(2, database);
      }
    } catch (e) {
      if (c == 1) {
        eraser();
        again(1);
      } else if (c == 2) {
        eraser();
        again(2, database);
      }
    }
  }

  // method repeats input if user inputs Opening string
  void again(int d, [Map? database]) {
    if (d == 1) {
      var i = FrontPage()
        ..title()
        ..Opening()
        ..option(1)
        ..input(1);
    } else if (d == 2) {
      var ii = FrontPage()
        ..title()
        ..Opening()
        ..option(1)
        ..input(2, database);
    }
  }
}

void main() {
  ///menjalankan function
  var FrontPaa = FrontPage();
  FrontPaa.title();
}
