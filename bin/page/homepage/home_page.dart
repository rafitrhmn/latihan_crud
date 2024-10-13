import 'dart:io';

import '../../function/function.dart';
import 'about.dart';
import 'pembayaran_page.dart';
import 'profile_page.dart';
import 'rekeningku_page.dart';
import 'transfer_page.dart';
// import 'profile_page.dart';

class HomePage {
  final up = '=';
  final side = '|';
  final line = '_';
  List<Map<String, dynamic>> data;
  Map<String, dynamic> accountinfo;

  HomePage({required this.data, required this.accountinfo});
  // var nomoratm = insertspace(accountinfo?['Nomor ATM']);

  void runHomePage({int? a}) async {
    // var nomoratm = insertspace(accountinfo?['Nomor ATM']);
    //
    await waiting();
    eraser();
    titlepengguna();
    print("Nama Pengguna : ${accountinfo['Nama']}");
    print("Nomor Rekening : ${insertspace(accountinfo['Nomor ATM'])}");
    print("Nomor Rekening : ${accountinfo['Saldo']}");
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
      print('  "Pilih Layanan anda dengan masukkan angka 1-6"\n');
    }
    try {
      print(' ');
      stdout.write('  MASUKKAN ANGKA PILIHAN LAYANAN ANDA : ');
      int choice = int.parse(stdin.readLineSync()!);
      if (choice == 1) {
        //to page profile
        Profile profile = Profile(data: data, accountinfo: accountinfo);
        profile.runProfile();
      } else if (choice == 2) {
        Rekeningku rekeningku =
            Rekeningku(data: data, accountinfo: accountinfo);
        rekeningku.runRekeningku();
      } else if (choice == 3) {
        Transfer transfer = Transfer(data: data, accountinfo: accountinfo);
        transfer.runTransfer();
      } else if (choice == 4) {
        Pembayaran pembayaran =
            Pembayaran(data: data, accountinfo: accountinfo);
        pembayaran.runPembayaran();
      } else if (choice == 5) {
        About about = About(data: data, accountinfo: accountinfo);
        about.runAbout();
      } else if (choice == 6) {
        print('ke halaman login');
      } else if (choice < 0 || choice >= 7) {
        // run(1);
      }
    } catch (e) {
      // run(1);
    }
  }
}

// function judul halaman core page
void titlepengguna({final jk = '=', final jl = '|'}) {
  print('${jk * 24}');
  print('$jl   HALAMAN PENGGUNA   $jl');
  print('${jk * 24}');
  print('');
}
