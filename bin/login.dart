///halaman login
import 'dart:io';
import 'Daftar.dart';

//function title halaman login
void title({final jk = '=', final jl = '|'}) {
  print('${jk * 22}');
  print('$jl   HALAMAN LOGIN    $jl');
  print('${jk * 22}');
  print('');
}

///kelas halaman login
class Login {
  //function alur halaman login
  void run() async {
    print('\n${' ' * 3} Loading...');
    await funglam();
    bersih();
    title();
    isi();
  }

  void isi() {
    print('   Masuk ke akun anda\n');
    stdout.write('Nomor ATM   : ');
    String namak = stdin.readLineSync()!;
    stdout.write('PIN         : ');
    int ikl = 0;
    stdin.echoMode = false;
    ikl = int.parse(stdin.readLineSync()!);
    stdin.echoMode = true;
    stdout.write('\n');
    print('nama :$namak');
    print('pin :$ikl');
  }
}

void main() {
  var jko = Login();
  jko.run();
}
