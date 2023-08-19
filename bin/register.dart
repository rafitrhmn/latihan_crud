import 'dart:io';
import 'dart:core';
import 'dart:math';
import 'halaman_depan.dart';
import 'login.dart';
import 'function.dart';

/// class daftar
class Daftar {
  //field class daftar
  List<String> namaa = [];
  List<String> noHp = [];
  var emaill = [];
  var list = [];
  var pinn = [];

//function halaman pertama dari halaman daftar
  void runningRegis() async {
    print(' ');
    print('${' ' * 3}Loading...');
    await waiting();
    eraser();
    tittleRegister();
    print(' ');
    inputName();
  }

  //function input nama dan filter nama
  void inputName() {
    stdout.write('Nama ${' ' * 11} : '); //input nama
    String nama = stdin.readLineSync()!;
    var i = nama.trim();
    var ii = i.replaceAll('  ', ' ');
    RegExp cek = RegExp(r'^[a-zA-Z\s]+$');
    var cekName = cek.hasMatch(ii);
    if (cekName == true) {
      namaa.add(ii);
      saveInput.add(ii);
      inputNohp();
    } else {
      wrong(1);
    }
  }

  //function input no hp dan filter nomor hp
  void inputNohp() {
    stdout.write('Nomor HandPhone ${' ' * 1}: ');
    String hp = stdin.readLineSync()!;
    RegExp cek = RegExp(r'^08\d{10,11}$');
    var i = cek.hasMatch(shorten(hp));
    if (i == true) {
      noHp.add(shorten(hp));
      saveInput.add(shorten(hp));
      inputEmail();
    } else {
      wrong(2);
    }
  }

  //function input email dan verifikasi email
  void inputEmail() {
    stdout.write('Email ${' ' * 11}: ');
    String emaik = stdin.readLineSync()!;
    RegExp cek = RegExp(r"^[a-zA-Z0-9]+@gmail.com$");
    var i = cek.hasMatch(shorten(emaik));
    if (i == true) {
      emaill.add(shorten(emaik));
      saveInput.add(shorten(emaik));
      inputPin();
    } else {
      wrong(3);
    }
  }

  //function input pin dan verifikasi pin
  void inputPin() {
    //input Pin
    stdout.write('PIN ${' ' * 13}: ');
    String pin = ' ';
    stdin.echoMode = false;
    pin = stdin.readLineSync()!;
    stdin.echoMode = true;
    stdout.write('\n');

    //inner function konfirmasi pin
    void verifpin() async {
      stdout.write('Konfirmasi PIN   : ');
      String pik = ' ';
      stdin.echoMode = false;
      pik = stdin.readLineSync()!;
      stdin.echoMode = true;
      stdout.write('\n');
      if (pik == shorten(pin)) {
        runMunculNoatm();
      } else {
        eraser();
        tittleRegister();
        print(' ');
        fungNama();
        fungNo();
        fungEmail();
        fungPin();
        print('');
        print('${' ' * 17} "Pin tidak cocok"');
        await waiting();
        eraser();
        tittleRegister();
        print(' ');
        fungNama();
        fungNo();
        fungEmail();
        fungPin();
        verifpin();
      }
    }

    //verifikasi input pin
    RegExp cek = RegExp(r'^\d{6}$');
    bool i = cek.hasMatch(shorten(pin));
    if (i == true) {
      saveInput.add(shorten(pin));
      verifpin();
    } else {
      wrong(4);
    }
  }

  //function jika input nama, no hp,email dan pin adalah salah
  void wrong(int np) {
    //inner fucntion jika input nama salah
    void wrongName() async {
      print(' ');
      print('${' ' * 3}"Gunakan Huruf untuk mengisi nama');
      await waiting();
      eraser();
      tittleRegister();
      print(' ');
      inputName();
    }

    //inner function jika input nohp salah
    void wrongNohp() async {
      print(' ');
      fungNama();
      print(' ');
      print('''
${' ' * 17} "Nomor Handphone harus berjumlah 12 atau 13 angka
${' ' * 17}  dan berawalan 08''');
      await waiting();
      eraser();
      tittleRegister();
      print(' ');
      fungNama();
      inputNohp();
    }

    //inner function jika input email salah
    void wrongEmail() async {
      print(' ');
      fungNama();
      fungNo();
      print('');
      print('${' ' * 17} Email harus berakhiran @gmail.com');
      await waiting();
      eraser();
      tittleRegister();
      print(' ');
      fungNama();
      fungNo();
      inputEmail();
    }

    //inner function jika input email salah
    void wrongPin() async {
      print(' ');
      fungNama();
      fungNo();
      fungEmail();
      print(' ');
      print('${' ' * 17} "Masukkan PIN dengan 6 angka acak"');
      await waiting();
      eraser();
      tittleRegister();
      print(' ');
      fungNama();
      fungNo();
      fungEmail();
      inputPin();
    }

    ///pertama kali dijalankan di function "salah".
    eraser();
    tittleRegister();
    if (np == 1) {
      wrongName();
    } else if (np == 2) {
      wrongNohp();
    } else if (np == 3) {
      wrongEmail();
    } else if (np == 4) {
      wrongPin();
    }
  }

  //function nama yg ditambhakan jika input error
  void fungNama() {
    String ij = namaa[0];
    print('Nama ${' ' * 11} : $ij');
  }

  //function  nomor hp yg ditambahna jika input error
  void fungNo() {
    String il = noHp[0];
    print('Nomor Handphone ${' ' * 1}: $il');
  }

  //function email yg ditambahkan jika input sesuatu error
  void fungEmail() {
    String ik = emaill[0];
    print('Email ${' ' * 11}: $ik');
  }

  //function  pin ditambahkan jika input error
  void fungPin() {
    print('PIN ${' ' * 13}: ');
  }

//menerima seluruh inputan
  List<String> saveInput = [];
  void toLogin() {
    var a = Login();
    a.database(
        q: saveInput[0],
        r: saveInput[1],
        s: saveInput[2],
        t: saveInput[3],
        u: saveInput[4]);
  }
}

//function tambahan. judul halaman daftar
extension Title on Daftar {
  void tittleRegister({final side_1 = '=', final side_2 = '|'}) {
    print('${side_1 * 22}');
    print('$side_2   HALAMAN DAFTAR   $side_2');
    print('${side_1 * 22}');
    print('');
    print('  Masukan biodata nama, nomor handphone, email');
    print('  dan PIN untuk membuat akun di BANK TENG INDONESIA');
  }
}

///class mmunculkan no atm setelah daftar
///
extension MunculNoAtm on Daftar {
  //function title halaman muncul nomor atm
  void garisAu({final side_1 = '=', final side_2 = '|'}) {
    print('${side_1 * 22}');
    print('$side_2     NOMOR ATM${' ' * 6}$side_2');
    print('${side_1 * 22}');
  }

  //function mendapat nomor atm
  String dptacak() {
    var acak = Random();
    var y = '';
    for (var i = 0; i < 9; i++) {
      if (i == 1 || i == 5) {
        y += ' ';
      } else {
        y += acak.nextInt(10).toString();
      }
    }
    saveInput.add(y);
    return y;
  }

  //function muncul nomor atm
  void runMunculNoatm() async {
    print(' ');
    print('${' ' * 3}Loading...');
    await Future.delayed(Duration(milliseconds: 1500));
    eraser();
    garisAu();
    print(' ');
    print('Nomor ATM anda : ${dptacak()}');
    print(' ');
    showThanks();
    print('');
    question();
  }

  //function tanya ke pengguna mau ke halaman daftar?
  void question() async {
    await waiting();
    stdout.write('Masuk ke akun anda ?? (Y/N) :');
    String nerima = stdin.readLineSync()!;
    RegExp cek = RegExp(r'(Y|y|i?ya)');
    RegExp cek2 = RegExp(r'(N|n|tidak)');
    var h = cek.hasMatch(nerima);
    var hy = cek2.hasMatch(nerima);
    if (h == true) {
      toLogin();
    } else if (hy == true) {
      runningRegis();
    } else {
      var a = Interface();
      a.run(1);
    }
  }

  void showThanks() {
    String i = namaa[0];
    print('Terima kasih $i telah mendaftar di BANK TENG INDONESIA ');
  }
}

//fungsi pengecekan huruf saja
void main() {
  var b = Daftar();
  b.runningRegis();
}
