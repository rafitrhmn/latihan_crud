///halaman login
import 'dart:io';
import '../Daftar.dart';
import 'dart:core';

//function title halaman login
void title({final jk = '=', final jl = '|'}) {
  print('${jk * 22}');
  print('$jl   HALAMAN LOGIN    $jl');
  print('${jk * 22}');
  print('');
}

///kelas halaman login
class Login {
  //function database sistem
  void database(String q, String r, String s, String t, String u) {
    List<String> nama = ['Rafi', 'loyi', q];
    List<String> nohp = ['0895418403700', '085424531342', r];
    List<String> email = ['rafi@gmail.com', 'loyi@gmail.com', s];
    List<String> pin = ['123456', '345678', t];
    String jkl = u.replaceAll(' ', '');
    List<String> nomoratm = ['1234567', '7654321', jkl];
    Map<String, String> tgh = {
      nomoratm[0]: pin[0],
      nomoratm[1]: pin[1],
      nomoratm[2]: pin[2],
    };
    input(tgh);
  }

  void input(Map tgh) async {
    Map hj = tgh;

    //proses input dan verifikasi
    void proses([int? h]) async {
      print('\n${' ' * 3} Loading...');
      await funglam();
      bersih();
      title();

      /*
      int batasperco = 6;
      int coba = 0;
      if (h == 1) {
        coba++;
      }
      while (h == 1) {
        if (coba <= batasperco) {
          print('"Nomor ATM tidak ditemukan, Coba Lagi $coba"');

          /// lanjut verifikasi 5 kalli muncul kalimat lupa nomor atm
          break;
        } else if (coba == batasperco) {
          print('Nomor ATM tidak ditemukan, Lupa nomor atm');
          break;
        }
      }
      */
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

      //verifikasi nomor atm dan pin
      //1.verifikasi no atm adalah angka
      RegExp verifNomorAtm = RegExp(r'^\d{7}');
      bool isverif = verifNomorAtm.hasMatch(hhn);
      while (isverif == false) {
        salahverifatm();
        break;
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

//function jika salah verifikasi nomor atm dan pin
void salahverifatm() {
  print('nomor atm harus berupa angka');
}

//function beda
/*
void nampung(List nomoratm, List pin) {
  Map<String, String> tgh = {
    nomoratm[0]: pin[0],
    nomoratm[1]: pin[1],
    nomoratm[2]: pin[2],
  };
  //print(tgh);
}
*/

/*
  print(nama);
  print(nohp);
  print(email);
  print(pin);
  print(nomoratm);
*/
/*
  Map<String, bool> data = {
    'nama': nama.every((element) => nama == element),
    'nomorhandphone': nohp.every((element) => nohp == element),
    'email': email.every((element) => email == element),
    'pin': pin.every((element) => pin == element),
    'nomoratm': nomoratm.every((element) => nomoratm == element),
  };
  */

//verifikasi nomor atm
void verifnmratm() {}

void main() {
  var jko = Login();
  //jko.run();
}
