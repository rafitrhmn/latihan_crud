import 'halaman_depan.dart';
import 'function.dart';
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
    List<String> saldo = ['1.000.000.000', '20.000.000', '000'];
    //
    int jumlahnomoratm = nomoratm.length;
    Map<String, Map<String, String>> data = {};
    for (int i = 0; i < jumlahnomoratm; i++) {
      String nomoratm2 = nomoratm[i];
      String pin2 = pin[i];
      String nama2 = nama[i];
      String nohp2 = nohp[i];
      String email2 = email[i];
      String saldo2 = saldo[i];

      Map<String, String> detaildata = {
        'pin': pin2,
        'nama': nama2,
        'nohp': nohp2,
        'email': email2,
        'saldo': saldo2,
      };
      data[nomoratm2] = detaildata;
    }
    input(data: data);
  }

  void input({Map? data}) async {
    //function mencari user dari inputan nomor atm
    String finduser(ii, int parameter) {
      if (data!.containsKey(ii) && parameter == 1) {
        var a = '${data[ii]?['nama']}';
        return a;
      } else if (data.containsKey(ii) && parameter == 2) {
        var b = '${data[ii]?['nohp']}';
        return b;
      } else if (data.containsKey(ii) && parameter == 3) {
        var c = '${data[ii]?['email']}';
        return c;
      } else if (data.containsKey(ii) && parameter == 4) {
        var d = '${data[ii]?['pin']}';
        return d;
      } else if (data.containsKey(ii) && parameter == 5) {
        var d = '${data[ii]?['saldo']}';
        return d;
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
      String nama3 = '';
      String noatm = '';
      String nohp = '';
      String email = '';
      String pin = '';
      String saldo = '';
      //
      while (jumlahPercobaan < batasPercobaan && !berhasilmasuk) {
        await second3();
        eraser();
        titlelogin();
        //input nomor atm dan pin
        print('   Masuk ke akun anda\n');
        stdout.write('Nomor ATM   : ');
        String nama = stdin.readLineSync()!;
        var i = nama.trim();
        var ii = i.replaceAll(' ', '');
        stdout.write('PIN         : ');
        String j = '';
        stdin.echoMode = false;
        j = stdin.readLineSync()!;
        var j2 = j.trim();
        var j3 = j2.replaceAll(' ', '');
        stdin.echoMode = true;
        stdout.write('\n');

        //verifikasi nomor atm adalah angka
        RegExp verifNomorAtm = RegExp(r'^\d{7}');
        bool isverif = verifNomorAtm.hasMatch(ii);
        //verifikasi pin adalah angka
        RegExp verifPIN = RegExp(r'^\d{6}');
        bool isverifpin = verifPIN.hasMatch(j3);
        bool gh = data![ii]?["pin"] != null && data[ii]?['pin'] == j3;

        if (isverif == false) {
          jumlahPercobaan++;
          print('');
          print('"nomor atm harus berupa 7 karakter angka"');
          print('"Sisa percobaan: ${batasPercobaan - jumlahPercobaan}"');
          print('');
        } else if (data.containsKey(ii) == false) {
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
        } else if (data.containsKey(ii) && gh) {
          berhasilmasuk = true;
          String takename = finduser(ii, 1);
          String takenohp = finduser(ii, 2);
          String takeemail = finduser(ii, 3);
          String takepin = finduser(ii, 4);
          String takesaldo = finduser(ii, 5);
          nama3 = takename;
          noatm = ii;
          nohp = takenohp;
          email = takeemail;
          pin = takepin;
          saldo = takesaldo;
        }
      }
      if (berhasilmasuk) {
        print('\nakun ditemukan, masuk akun anda....');
        var i = Core(nama3, noatm,
            nohp: nohp, email: email, pin: pin, saldo: saldo, database: data);
        i.run();
      } else {
        stdout.write('Anda melebihi batas percobaan. ganti PIN ATM ? (Y/N)');
        String answer = stdin.readLineSync()!;
        RegExp verif = RegExp(r'(Y|y|i?ya)');
        RegExp verif2 = RegExp(r'(N|n|tidak)');
        var k = verif.hasMatch(answer);
        var l = verif2.hasMatch(answer);
        if (k == true) {
          print('ke halaman login');
        } else if (l == true) {
          proses();
        } else {
          var m = Interface();
          m.run(1);
        }
      }
    }

    //dijalankan
    proses();
  }
}

//judul login
void titlelogin({final jk = '=', final jl = '|'}) {
  print('${jk * 22}');
  print('$jl   HALAMAN LOGIN    $jl');
  print('${jk * 22}');
  print('');
}

void main() {
  var a = Login();
  a.database();
}
