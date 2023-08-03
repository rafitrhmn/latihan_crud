import 'core_page.dart';
import 'register.dart';
import 'dart:io';

///halaman Profile
///
///

class Profile {
  String? nomoratm;
  String? nama;
  String? nohp;
  String? email;
  String? pin;
  String? saldo;

  Profile(
      {final up = '=',
      final side = '|',
      this.nomoratm,
      this.nama,
      this.nohp,
      this.email,
      this.pin,
      this.saldo}) {
    eraser();
    print('${up * 24}');
    print('$side   HALAMAN PROFILE    $side');
    print('${up * 24}');
    print('');
  }

  //named contarktor ambil data
  void text1() {
    var noatm = insertspace(nomoratm);
    print('    PROFILE ANDA \n');
    print('Nomor ATM    : $noatm');
    print('Nama         : $nama');
    print('No Handphone : $nohp');
    print('Email        : $email \n');
    kembali();
  }

  void kembali() async {
    await waiting();
    stdout.write('Kembali ke halaman sebelumnya ? (Y/N) :');
    String nerima = stdin.readLineSync()!;
    RegExp cek = RegExp(r'(Y|y|i?ya)');
    RegExp cek2 = RegExp(r'(N|n|tidak)');
    var b = cek.hasMatch(nerima);
    var c = cek2.hasMatch(nerima);
    if (b == true) {
      var i = Core(nama, nomoratm,
          nohp: nohp, email: email, pin: pin, saldo: saldo);
      i.run();
    } else if (c == true) {
      var p = Profile(
          nomoratm: nomoratm,
          nama: nama,
          nohp: nohp,
          email: email,
          pin: pin,
          saldo: saldo);
      p.text1();
    } else {
      var p = Profile(
          nomoratm: nomoratm,
          nama: nama,
          nohp: nohp,
          email: email,
          pin: pin,
          saldo: saldo);
      p.text1();
    }
  }
}

String insertspace(String? nomoratm) {
  String result = '';
  for (var i = 0; i < nomoratm!.length; i++) {
    if (i == 1) {
      result += ' ';
    } else if (i == 4) {
      result += ' ';
    }
    result += nomoratm[i];
  }
  return result;
}

void main(List<String> args) {}
