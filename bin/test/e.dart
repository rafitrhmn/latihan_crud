import '../halaman_depan.dart';
import 'c.dart';
import 'c2.dart';
import 'dart:io';

class Login {
  //function database sistem
  void database() {
    List<String> nama = ['Rafi', 'loyi'];
    List<String> nohp = ['0895418403700', '085424531342'];
    List<String> email = ['rafi@gmail.com', 'loyi@gmail.com'];
    List<String> pin = ['123456', '345678'];
    List<String> nomoratm = ['1234567', '7654321'];
    Map<String, String> tgh = {
      nomoratm[0]: pin[0],
      nomoratm[1]: pin[1],
    };
    input(tgh: tgh);
  }

  void input({Map? tgh}) async {
    /*
    void slhverif(int a) {
      if (a == 1) {
        print('nomor atm harus berupa 7 karakter angka');
      } else if (a == 2) {
        print('nomor atm tidak ditemukan');
      } else if (a == 3) {
        print('PIN harus berupa 6 karakter angka');
      } else if (a == 4) {
        print('PIN salah');
      }
    }
    */

    //proses input dan verifikasi
    void proses() async {
      print('\n${' ' * 3} Loading...');
      //
      int jmlhpercobaan = 0;
      int bataspercobaan = 5;
      bool berhasilmasuk = false;
      //
      while (jmlhpercobaan < bataspercobaan && !berhasilmasuk) {
        await funglam();
        bersih();
        title();

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
          print('"nomor atm harus berupa 7 karakter angka"');
          print('"Sisa percobaan: ${bataspercobaan - jmlhpercobaan}"');
          print('');
        } else if (tgh!.containsKey(hhn) == false) {
          jmlhpercobaan++;
          print('"nomor atm tidak ditemukan"');
          print('"Sisa percobaan: ${bataspercobaan - jmlhpercobaan}"');
          print('');
        } else if (isverifpin == false) {
          jmlhpercobaan++;
          print('"PIN harus berupa 6 karakter angka"');
          print('"Sisa percobaan: ${bataspercobaan - jmlhpercobaan}"');
          print('');
        } else if (gh == false) {
          jmlhpercobaan++;
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

void main() {
  var a = Login();
  a.database();
}
