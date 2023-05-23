import 'dart:async';
import 'dart:io';

import 'halamandpn.dart';

///file proses
///
///   dart run proses.dart
void garisAA() {
  var a = Interface();
  a.garisAtas();
}

//halaman login
class Login {
  void cd() {
    garisAA();
    print('HALAMAN LOGIN');
    print(' ' * 2);
    stdout.write('Masukkan Nomor Rekening : ');
    var nomor = stdin.readLineSync()!;
    stdout.write('Masukkan Pin ATM : ');
    int pin = 0;
    stdin.echoMode = false; // Menonaktifkan tampilan masukan
    pin = int.parse(stdin.readLineSync()!);
    stdin.echoMode = true; // Mengaktifkan tampilan masukan kembali
    stdout.write('\n'); // Pindah baris setelah masukan selesai
    print(pin);

    /*
    stdout.write('Masukkan Pin :');
    String pin = String.fromCharCodes(stdin.readLineSync()!.runes);

    print('nomor rekening = $nomor dan pin $pin');
    }
    */
  }
}

//clear terminal
void bersih() async {
  print('eraser');
  await Future.delayed(Duration(seconds: 5));
  stdout.write('\x1B[2J\x1B[0;0H');
}

//fungsi timer
void jeda() async {
  print('mulai');
  await Future.delayed(Duration(seconds: 6));
  print('core');

  print('end');
}

//halaman Daftar
class Daftar {
  void regis() async {
    print(' ');
    print('${' ' * 3}Loading...');
    await Future.delayed(Duration(milliseconds: 1500));
    stdout.write('\x1B[2J\x1B[0;0H');
    garisAA();
    print('HALAMAN Daftar');
    print(' ');

    List<String> namaa = ['rafi'];
    List<int> noHp = [];
    var emaill = [];
    var list = [];
    var pinn = list;

    stdout.write('Nama :'); //input nama
    String nama = stdin.readLineSync()!;

    stdout.write('No Hp :'); //input no hp
    int hp = int.parse(stdin.readLineSync()!);

    stdout.write('Email :');
    String email = stdin.readLineSync()!;

    stdout.write('Pin :');
    int pin = 0;
    stdin.echoMode = false;
    pin = int.parse(stdin.readLineSync()!);
    stdout.write('\n');

    stdout.write('Konfirmasi Pin :');
    int pin2 = 0;
    stdin.echoMode = false; //non aktif inputan
    pin2 = int.parse(stdin.readLineSync()!); //input
    stdin.echoMode = true;
    stdout.write('\n');
    if (pin2 == pin) {
      print('anda telah membuat akun bank');
    } else {
      bersih();
      print('ulangi pin');
      var jk = Daftar();
      jk.regis();
    }

    stdout.write('\n');
    namaa.add(nama);
    noHp.add(hp);
    emaill.add(email);
    pinn.add(pin);

    print("""
nama = $namaa
noHp = $noHp
email = $emaill
pin = $pinn
""");
  }
  /*
  void konfirmPin(int pin2) {
    pin2 = 0;
    stdin.echoMode = false;
    pin2 = int.parse(stdin.readLineSync()!);
    stdout.write('\n');
      if (pin2 == pin)
  }
  */
}

void main() {
  /*
  var a = login();
  a.cd();
  */

  var bc = Daftar();
  bc.regis();
  print('hai');
}

//   dart run proses.dart 
