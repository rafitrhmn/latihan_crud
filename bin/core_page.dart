///halaman inti.
///halaman user masuk ke akun nya.
///
import 'dart:io';

import 'profile.dart';
import 'register.dart';
import 'rekeningku.dart';

class Core {
  String? nama;
  String? nohp;
  String? email;
  String? noatm;
  String? pin;
  String? saldo;

  //constraktor
  Core(this.nama, this.noatm, {this.nohp, this.email, this.pin, this.saldo});

  //function running
  void run([int? a]) async {
    await waiting();
    eraser();
    titlepengguna();
    print('Nama Pengguna : $nama');
    print('No Rekening   : $noatm');
    print('');
    print('BANK TENG INDONESIA');
    print('Bank Pelayan masyarakat Indonesia untuk indonesia maju 2024');
    print('Pilih layanan yang anda mau.');
    print('');
    print('PILIH LAYANAN: ');
    print('1. Profile KU');
    print('2. Rekening KU');
    print('3. Transfer');
    print('4. Pembayaran');
    print('5. Tentang Kami');
    print('6. Keluar');
    //
    if (a == 1) {
      print('');
      print('  "Pilih Layanan anda dengan masukkan angka 1-6"');
    }
    try {
      print(' ');
      stdout.write('  MASUKKAN ANGKA PILIHAN LAYANAN ANDA : ');
      int choice = int.parse(stdin.readLineSync()!);
      if (choice == 1) {
        var a = Profile(
            nomoratm: noatm,
            nama: nama,
            nohp: nohp,
            email: email,
            pin: pin,
            saldo: saldo);
        a.text1();
      } else if (choice == 2) {
        var b = Rekeningku(
            nomoratm: noatm,
            nama: nama,
            nohp: nohp,
            email: email,
            pin: pin,
            saldo: saldo);
        b.text1();
      } else if (choice == 3) {
        print('Halaman Transfer');
      } else if (choice == 4) {
        print('Halaman pembayaran');
      } else if (choice == 5) {
        print('Halaman Tentang kami');
      } else if (choice == 6) {
        print('Halaman keluar');
      } else if (choice < 0 || choice >= 7) {
        run(1);
      }
    } catch (e) {
      run(1);
    }
  }
}

//function judul halaman core page
void titlepengguna({final jk = '=', final jl = '|'}) {
  print('${jk * 24}');
  print('$jl   HALAMAN PENGGUNA   $jl');
  print('${jk * 24}');
  print('');
}

void main() {
  var n = Core('jaka', '086534334424');
  n.run();
}
