import 'dart:io';
import 'dart:core';
import 'dart:math';

//function title halaman daftar
void garisAA({final jk = '=', final jl = '|'}) {
  print('${jk * 22}');
  print('$jl   HALAMAN DAFTAR   $jl');
  print('${jk * 22}');
}

//function teks pembukaan halaman daftar
void opening() {
  print('');
  print('  Masukan biodata nama, nomor handphone, email');
  print('  dan PIN untuk membuat akun di BANK TENG INDONESIA');
}

//function menghapus terminal
void bersih() {
  stdout.write('\x1B[2J\x1B[0;0H');
}

//function menuggu beberapa detik
Future<dynamic> funglam() async =>
    await Future.delayed(Duration(milliseconds: 1500));

/// class daftar
class Daftar {
  //variable lokal class daftar
  List<String> namaa = [];
  List<String> noHp = [];
  var emaill = [];
  var list = [];
  var pinn = [];

//function halaman pertama dari halaman daftar
  void regis() async {
    print(' ');
    print('${' ' * 3}Loading...');
    await funglam();
    bersih();
    garisAA();
    opening();
    print(' ');
    ceknama();
  }

  //function input nama dan filter nama
  void ceknama() {
    stdout.write('Nama ${' ' * 11} : '); //input nama
    String nama = stdin.readLineSync()!;
    var xc = nama.trim();
    var ds = xc.replaceAll('  ', ' ');
    RegExp cek = RegExp(r'^[a-zA-Z\s]+$');
    var ba = cek.hasMatch(ds);
    if (ba == true) {
      namaa.add(ds);
      inputhp2();
    } else {
      salah(1);
    }
  }

  //function input no hp dan filter nomor hp
  void inputhp2() {
    stdout.write('Nomor HandPhone ${' ' * 1}: ');
    String hp = stdin.readLineSync()!;
    RegExp cek = RegExp(r'^08\d{10,11}$');
    var gi = cek.hasMatch(jok(hp));
    if (gi == true) {
      noHp.add(jok(hp));
      email();
    } else {
      salah(2);
    }
  }

  //function input email dan verifikasi email
  void email() {
    stdout.write('Email ${' ' * 11}: ');
    String emaik = stdin.readLineSync()!;
    RegExp emailRegex = RegExp(r"^[a-zA-Z0-9]+@gmail.com$");
    var hi = emailRegex.hasMatch(jok(emaik));
    if (hi == true) {
      emaill.add(jok(emaik));
      pin();
    } else {
      salah(3);
    }
  }

  //function input pin dan verifikasi pin
  void pin() {
    //input pin
    stdout.write('PIN ${' ' * 13}: ');
    String pinj = ' ';
    stdin.echoMode = false;
    pinj = stdin.readLineSync()!;
    stdin.echoMode = true;
    stdout.write('\n');

    //inner function konfirmasi pin
    void verif2() async {
      stdout.write('Konfirmasi PIN   :');
      String pik = ' ';
      stdin.echoMode = false;
      pik = stdin.readLineSync()!;
      stdin.echoMode = true;
      stdout.write('\n');
      if (pik == jok(pinj)) {
        munculnomoratm();
      } else {
        bersih();
        garisAA();
        opening();
        print(' ');
        fungnama();
        fungno();
        fungemail();
        fungpin();
        print('');
        print('${' ' * 17} "Pin tidak cocok"');
        await funglam();
        bersih();
        garisAA();
        opening();
        print(' ');
        fungnama();
        fungno();
        fungemail();
        fungpin();
        verif2();
      }
    }

    //verifikasi input pin
    RegExp nmk = RegExp(r'^\d{6}$');
    bool gi = nmk.hasMatch(jok(pinj));
    if (gi == true) {
      verif2();
    } else {
      salah(4);
    }
  }

  //function jika input nama, no hp,email dan pin adalah salah
  void salah(int np) {
    //inner fucntion jika input nama salah
    void slhnma() async {
      print(' ');
      print('${' ' * 3}"Gunakan Huruf untuk mengisi nama');
      await funglam();
      bersih();
      garisAA();
      opening();
      print(' ');
      ceknama();
    }

    //inner function jika input nohp salah
    void slhno() async {
      print(' ');
      fungnama();
      print(' ');
      print('''
${' ' * 17} "Nomor Handphone harus berjumlah 12 atau 13 angka
${' ' * 17}  dan berawalan 08''');
      await funglam();
      bersih();
      garisAA();
      opening();
      print(' ');
      fungnama();
      inputhp2();
    }

    //inner function jika input email salah
    void slhemail() async {
      print(' ');
      fungnama();
      fungno();
      print('');
      print('${' ' * 17} Email harus berakhiran @gmail.com');
      await funglam();
      bersih();
      garisAA();
      opening();
      print(' ');
      fungnama();
      fungno();
      email();
    }

    //inner function jika input email salah
    void slhpin() async {
      print(' ');
      fungnama();
      fungno();
      fungemail();
      print(' ');
      print('${' ' * 17} "Masukkan PIN dengan 6 angka acak"');
      await funglam();
      bersih();
      garisAA();
      opening();
      print(' ');
      fungnama();
      fungno();
      fungemail();
      pin();
    }

    ///pertama kali dijalankan di function "salah".
    bersih();
    garisAA();
    opening();
    if (np == 1) {
      slhnma();
    } else if (np == 2) {
      slhno();
    } else if (np == 3) {
      slhemail();
    } else if (np == 4) {
      slhpin();
    }
  }

  //function nama yg ditambhakan jika input error
  void fungnama() {
    String ij = namaa[0];
    print('Nama ${' ' * 11} : $ij');
  }

  //function  nomor hp yg ditambahna jika input error
  void fungno() {
    String il = noHp[0];
    print('Nomor Handphone ${' ' * 1}: $il');
  }

  //function email yg ditambahkan jika input sesuatu error
  void fungemail() {
    String ik = emaill[0];
    print('Email ${' ' * 11}: $ik');
  }

  //function  pin ditambahkan jika input error
  void fungpin() {
    print('PIN ${' ' * 13}: ');
  }

  //function memfilter inputan berupa string
  String jok(String k) {
    var j = k.trim();
    var kp = j.replaceAll(' ', '');
    var kl = kp.replaceAll('  ', '');
    return kl;
  }

  //function menampung isi list nama untuk halaaman nomor atm
  String ijka() {
    var jkl = namaa[0];
    return 'Terima kasih $jkl telah mendaftar di BANK TENG INDONESIA ';
  }

  //function title halaman muncul nomor atm
  void garisAu({final jk = '=', final jl = '|'}) {
    print('${jk * 22}');
    print('$jl     NOMOR ATM${' ' * 6}$jl');
    print('${jk * 22}');
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
    return y;
  }

  //function muncul nomor atm
  void munculnomoratm() async {
    print(' ');
    print('${' ' * 3}Loading...');
    await Future.delayed(Duration(milliseconds: 1500));
    bersih();
    garisAu();
    print(' ');
    print('Nomor ATM anda : ${dptacak()}');
    print(' ');
    print(ijka());
    print('');
    kembali();
  }

  //function tanya ke pengguna mau ke halaman daftar?
  void kembali() async {
    await funglam();
    stdout.write('Masuk ke akun anda ?? (Y/N) :');
    String nerima = stdin.readLineSync()!;
    RegExp cek = RegExp(r'(Y|y|i?ya)');
    RegExp cek2 = RegExp(r'(N|n|tidak)');
    var h = cek.hasMatch(nerima);
    var hy = cek2.hasMatch(nerima);
    if (h == true) {
      print('ke halaman login');
    } else if (hy == true) {
      print('kehalaman daftar');
    } else {
      print('ulang');
    }
  }
}

//fungsi pengecekan huruf saja
void main() {
  var b = Daftar();
  b.regis();
}
