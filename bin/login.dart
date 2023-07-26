import 'halaman_depan.dart';
import 'register.dart';
import 'dart:io';
import 'core_page.dart';

class Login {
  //function database sistem
  void database({String? q, String? r, String? s, String? t, String? u}) {
    List<String> nama = ['Rafi', 'loyi', '$q'];
    List<String> nohp = ['0895418403700', '085424531342', '$r'];
    List<String> email = ['rafi@gmail.com', 'loyi@gmail.com', '$s'];
    List<String> pin = ['123456', '345678', '$t'];
    String i() => '$u';
    String j = i().replaceAll(' ', '');
    List<String> nomoratm = ['1234567', '7654321', j];
    int jumlahnomoratm = nomoratm.length;
    Map<String, Map<String, String>> data = {};

    for (int i = 0; i < jumlahnomoratm; i++) {
      String nomoratm2 = nomoratm[i];
      String pin2 = pin[i];
      String nama2 = nama[i];
      String nohp2 = nohp[i];
      String email2 = email[i];

      Map<String, String> detaildata = {
        'pin': pin2,
        'nama': nama2,
        'nohp': nohp2,
        'email': email2,
      };
      data[nomoratm2] = detaildata;
    }
  }

  void input({Map? loginAccess, Map? user}) async {
    //function mencari user dari inputan nomor atm
    String finduser(hhn) {
      if (user!.containsKey(hhn)) {
        return '${user[hhn]}';
      } else {
        return 'f';
      }
    }

    //proses input dan verifikasi
    void proses() async {
      print('\n${' ' * 3} Loading...');
      //
      int jumlahPercobaan = 0;
      int batasPercobaan = 5;
      bool berhasilmasuk = false;
      String nama = '';
      String noatm2 = '';
      //
      while (jumlahPercobaan < batasPercobaan && !berhasilmasuk) {
        await second3();
        eraser();
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
        bool gh = loginAccess?[hhn] == sdf;

        if (isverif == false) {
          jumlahPercobaan++;
          print('');
          print('"nomor atm harus berupa 7 karakter angka"');
          print('"Sisa percobaan: ${batasPercobaan - jumlahPercobaan}"');
          print('');
        } else if (loginAccess!.containsKey(hhn) == false) {
          jumlahPercobaan++;
          print('');
          print('"nomor atm tidak ditemukan"');
          print('"Sisa percobaan: ${batasPercobaan - jumlahPercobaan}"');
          print('');
        } else if (isverifpin == false) {
          jumlahPercobaan++;
          print('');
          print('"PIN harus berupa 6 karakter angka"');
          print('"Sisa percobaan: ${batasPercobaan - jumlahPercobaan}"');
          print('');
        } else if (gh == false) {
          jumlahPercobaan++;
          print('');
          print('"PIN salah"');
          print('"Sisa percobaan: ${batasPercobaan - jumlahPercobaan}"');
          print('');
        } else if (loginAccess.containsKey(hhn) && gh) {
          berhasilmasuk = true;
          String cekuser = finduser(hhn);
          nama = cekuser;
          noatm2 = hhn;
        }
      }
      if (berhasilmasuk) {
        print('akun ditemukan, masuk akun anda....');
        var i = Core(nama, noatm2);
        i.run();
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
  await waiting();
  eraser();
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
