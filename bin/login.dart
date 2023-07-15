import 'halaman_depan.dart';
import 'Daftar.dart';
import 'dart:io';

class Login {
  //function database sistem
  void database(String q, String r, String s, String t, String u) {
    List<String> nama = ['Rafi', 'loyi', q];
    List<String> nohp = ['0895418403700', '085424531342', r];
    List<String> email = ['rafi@gmail.com', 'loyi@gmail.com', s];
    List<String> pin = ['123456', '345678', t];
    String i = u.replaceAll(' ', '');
    List<String> nomoratm = ['1234567', '7654321', i];
    Map<String, String> tgh = {
      nomoratm[0]: pin[0],
      nomoratm[1]: pin[1],
      nomoratm[2]: pin[2],
    };
    input(tgh: tgh);
  }

  void input({Map? tgh}) async {
    //proses input dan verifikasi
    void proses() async {
      print('\n${' ' * 3} Loading...');
      //
      int jmlhpercobaan = 0;
      int bataspercobaan = 5;
      bool berhasilmasuk = false;
      //
      while (jmlhpercobaan < bataspercobaan && !berhasilmasuk) {
        await second3();
        bersih();
        titlelogin();

        //input nomor atm dan pin
        print('   Masuk ke akun anda\n');
        stdout.write('Nomor ATM   : ');
        String namak = stdin.readLineSync()!;
        var ghj = namak.trim();
        var hhn = ghj.replaceAll(' ', '');
        stdout.write('PIN         : ');
        String ikl = '';
        stdin.echoMode = false;
        ikl = stdin.readLineSync()!;
        var dfg = ikl.trim();
        var sdf = dfg.replaceAll(' ', '');
        stdin.echoMode = true;
        stdout.write('\n');

        //verifikasi nomor atm adalah angka
        RegExp verifNomorAtm = RegExp(r'^\d{7}');
        bool isverif = verifNomorAtm.hasMatch(hhn);
        //verifikasi pin adalah angka
        RegExp verifPIN = RegExp(r'^\d{6}');
        bool isverifpin = verifPIN.hasMatch(sdf);
        var gh = tgh?[hhn] == sdf;

        if (isverif == false) {
          jmlhpercobaan++;
          print('');
          print('"nomor atm harus berupa 7 karakter angka"');
          print('"Sisa percobaan: ${bataspercobaan - jmlhpercobaan}"');
          print('');
        } else if (tgh!.containsKey(hhn) == false) {
          jmlhpercobaan++;
          print('');
          print('"nomor atm tidak ditemukan"');
          print('"Sisa percobaan: ${bataspercobaan - jmlhpercobaan}"');
          print('');
        } else if (isverifpin == false) {
          jmlhpercobaan++;
          print('');
          print('"PIN harus berupa 6 karakter angka"');
          print('"Sisa percobaan: ${bataspercobaan - jmlhpercobaan}"');
          print('');
        } else if (gh == false) {
          jmlhpercobaan++;
          print('');
          print('"PIN salah"');
          print('"Sisa percobaan: ${bataspercobaan - jmlhpercobaan}"');
          print('');
        } else if (tgh.containsKey(hhn) && gh) {
          berhasilmasuk = true;
        }
      }
      if (berhasilmasuk) {
        print('akun ditemukan... masuk akun anda');
      } else {
        stdout.write('Anda melebihi batas percobaan. ganti PIN ATM ? (Y/N)');
        String answer = stdin.readLineSync()!;
        RegExp verif = RegExp(r'(Y|y|i?ya)');
        RegExp verif2 = RegExp(r'(N|n|tidak)');
        var i = verif.hasMatch(answer);
        var l = verif2.hasMatch(answer);
        if (i == true) {
          print('ke halaman login');
        } else if (l == true) {
          proses();
        } else {
          var p = RunFront();
          p.run();
        }
      }
    }

    //dijalankan
    proses();
  }
}

//ketika salah nomor atm
void slhatm() async {
  await funglam();
  bersih();
}

//judul login
void titlelogin({final jk = '=', final jl = '|'}) {
  print('${jk * 22}');
  print('$jl   HALAMAN LOGIN    $jl');
  print('${jk * 22}');
  print('');
}

//function loading 3 detik
Future<dynamic> second3() async =>
    await Future.delayed(Duration(milliseconds: 2500));

void main() {}
