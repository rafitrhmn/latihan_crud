import 'dart:io';
import 'dart:core';
import 'dart:math';

void garisAA({final jk = '=', final jl = '|'}) {
  print('${jk * 22}');
  print('$jl   HALAMAN DAFTAR   $jl');
  print('${jk * 22}');
}

void bersih() {
  stdout.write('\x1B[2J\x1B[0;0H');
}

class Daftar {
  //variable lokal class daftar
  List<String> namaa = ['rafi'];
  List<String> noHp = [
    '089537849210',
  ];
  var emaill = [];
  var list = [];
  var pinn = [];

  //fungsi input nama dan filter nama
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

  //function verifikasi dan input no hp
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

  //fungsi nama yg ditambhakan jika input error
  void fungnama() => print('Nama ${' ' * 10} : $namaa');

  //fungsi nomor hp yg ditambahna jika input error
  void fungno() => print('Nomor Handphone : $noHp');

  //fungsi email yg ditambahkan jika input sesuatu error
  void fungemail() => print('Email ${' ' * 10}: $emaill');

  //fungsi pin ditambahkan jika input error
  void fungpin() => print('PIN ${' ' * 12}: ');

  //fungsi menunggu beberapa detik
  Future<dynamic> funglam() async => await Future.delayed(Duration(seconds: 3));

  //fungsi jika input salah
  void salah(int np) {
    //fungsi jika input nama salah
    void slhnma() async {
      print(' ');
      print('${' ' * 3}"Gunakan Huruf untuk mengisi nama');
      await funglam();
      bersih();
      garisAA();
      tekshalam();
      print(' ');
      ceknama();
    }

    //fungsi jika nohp salah
    void slhno() async {
      print(' ');
      fungnama();
      print(' ');
      print('''
${' ' * 17}"Nomor Handphone harus berjumlah 12 atau 13 angka
${' ' * 17} dan berawalan 08''');
      await funglam();
      bersih();
      garisAA();
      tekshalam();
      print(' ');
      fungnama();
      inputhp2();
    }

    //fungsi jika email salah
    void slhemail() async {
      print(' ');
      fungnama();
      fungno();
      print('');
      print('${' ' * 17} Email harus berakhiran @gmail.com');
      await funglam();
      bersih();
      garisAA();
      tekshalam();
      print(' ');
      fungnama();
      fungno();
      email();
    }

    //fungsi jika pin salah
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
      tekshalam();
      print(' ');
      fungnama();
      fungno();
      fungemail();
      pin();
    }

    //
    bersih();
    garisAA();
    tekshalam();
    if (np == 1) {
      slhnma();
    } else if (np == 2) {
      slhno();
    } else if (np == 3) {
      slhemail();
    } else if (np == 4) {
      slhpin();
    }

    /*
    print(' ');
    print('${' ' * 3}"Gunakan Huruf untuk mengisi nama"');
    await funglam();
    bersih();
    garisAA();
    tekshalam();
    print(' ');
    ceknama();
    */
  }

  //fungsi input email dan verifikasi email
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

  //    cd bin\test
  //
  //fungsi filter string
  String jok(String k) {
    var j = k.trim();
    var kp = j.replaceAll(' ', '');
    var kl = kp.replaceAll('  ', '');
    return kl;
  }

  //fungsi input dan verfikasi pin
  void pin() {
    stdout.write('PIN ${' ' * 12}: ');
    String pinj = ' ';
    stdin.echoMode = false;
    pinj = stdin.readLineSync()!;
    stdin.echoMode = true;
    stdout.write('\n');

    //konfirmasi pin lagi
    void verif2() async {
      stdout.write('Konfirmasi PIN  :');
      String pik = ' ';
      stdin.echoMode = false;
      pik = stdin.readLineSync()!;
      stdin.echoMode = true;
      stdout.write('\n');
      if (pik == jok(pinj)) {
        print('p');
      } else {
        bersih();
        garisAA();
        tekshalam();
        print(' ');
        fungnama();
        fungno();
        fungemail();
        fungpin();
        print('');
        print('${' ' * 15} Pin tidak cocok');
        await funglam();
        bersih();
        garisAA();
        tekshalam();
        print(' ');
        fungnama();
        fungno();
        fungemail();
        fungpin();
        verif2();
      }
    }

    //verifikasi
    RegExp nmk = RegExp(r'^\d{6}$');
    bool gi = nmk.hasMatch(jok(pinj));
    if (gi == true) {
      verif2();
    } else {
      salah(4);
    }
  }

  //fungsi teks halaman daftar
  void tekshalam() => print('HALAMAN Daftar');

  //fungsi halaman daftar diawal
  void regis() async {
    print(' ');
    print('${' ' * 3}Loading...');
    await Future.delayed(Duration(milliseconds: 1500));

    bersih();
    garisAA();
    tekshalam();
    print(' ');
    ceknama();
  }

  //fungsi mendapatkan nomor acak
  void dptacak() {
    void ika() {
      var acak = Random();
      var acakstring = '';
      for (var i = 0; i < 6; i++) {
        acakstring += acak.nextInt(10).toString();
        print(acakstring);
      }
    }
  }
}

//fungsi pengecekan huruf saja
void main() {
  var b = Daftar();
  b.regis();
}
