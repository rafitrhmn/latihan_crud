///menampilkan halaman depan
///
///
import 'dart:io';
import 'Daftar.dart';

///kelas title halaman depan
class Interface {
  //membuat garis =
  void garisAtas() {
    print('=' * 56);
  }

  //function judul
  void teks(final samping) {
    String garis = '_';
    print("$samping ${" " * 15} BANK TENG INDONESIA ${" " * 16} $samping");
    print('$samping ${' ' * 13} "Kepak Sayap Kebangsaan" ${" " * 13} $samping');
    print(
        '$samping ${' ' * 2} Komplek Senayan DPR RI, JL.banteng merah No.03 ${" " * 2} $samping');
    print(
        '$samping ${' ' * 11} Email : BankTengIndo@gamil.com ${" " * 9} $samping');
    print(samping + garis * 54 + samping);
  }
}

///kelas halaman depan inputan
class Interface2 extends Interface {
  //function kelang satu baris
  void teks2(final samping) {
    print(samping + ' ' * 54 + samping);
  }

  //function teks pembukaan
  void teks3(final samping) {
    print(samping +
        """
 Assalamualaikum Warahmatullahi Wabarakatuh ${' ' * 9} $samping
$samping Selamat datang di Bank Teng Indonesia ${' ' * 14} $samping""");
    print(samping +
        ' Bank pelayan masyarakat Indonesia untuk ${" " * 12} $samping');
    print('$samping Indonesia Maju 2024 ${' ' * 32} $samping');
  }

  //function menu pilihan
  void pilihan() {
    final samping = '|';
    teks2('|');
    print("$samping ${" " * 5} PILIHAN:  ${" " * 36} $samping");
    print("$samping ${" " * 5} 1.LOGIN  ${" " * 37} $samping");
    print("$samping ${" " * 5} 2.DAFTAR  ${" " * 36} $samping");
    teks2('|');
    garisAtas();
  }

  //function proses inputan
  void input(final samping) {
    //var a = Login();
    var b = Daftar();
    try {
      print(' ');
      stdout.write('  MASUKKAN ANGKA PILIHAN ANDA : ');
      int milih = int.parse(stdin.readLineSync()!);
      if (milih == 1) {
        //a.cd();
        print('p');
      } else if (milih == 2) {
        b.regis();
      } else if (milih >= 3) {
        bersih();
        TRy();
      } else if (milih <= 0) {
        bersih();
        TRy();
      }
    } catch (e) {
      bersih();
      Try2();
    }
  }

  //function mengulang inputan jika pengguna menginputkan teks string
  void TRy() {
    var ab = Interface();
    garisAtas();
    ab.teks('|');
    teks2('|');
    teks3('|');
    pilihan();
    print(' "Pilihan berupa angka (1 untuk login dan 2 untuk daftar )"');
    input('|');
  }

  //function mengulang inputan jika pengguna menginputkan nomor bukan 1 atau 2
  void Try2() {
    garisAtas();
    var ab = Interface();
    ab.teks('|');
    teks2('|');
    teks3('|');
    pilihan();
    print(' "Inputan harus angka 1 atau 2"');
    input('|');
  }
}

void main() {
  ///menjalankan function
  var interface = Interface();
  interface.garisAtas();
  interface.teks('|');

  var interface2 = Interface2();
  interface2.teks2('|');
  interface2.teks3('|');
  interface2.pilihan();
  interface2.input('|');
}
