import 'home_page.dart';
import '../../function/function.dart';
import 'dart:io';

class Profile extends HomePage {
  Profile({required super.data, required super.accountinfo});

  void runProfile({bool? again}) async {
    eraser();
    print(up * 24);
    print('$side   HALAMAN PROFILE    $side');
    print(up * 24);
    print('');
    print('    PROFILE ANDA \n');
    print('Nomor ATM    : ${insertspace(accountinfo['Nomor ATM'])}');
    print('Nama         : ${accountinfo['Nama']}');
    print('No Handphone : ${accountinfo['Handphone']}');
    print('Email        : ${accountinfo['Email']} \n');

    if (again == false) {
      print(' ');
      print('"Pilih Y untuk iya dan N untuk tidak"');
      await waiting();
    }
    kembali();
  }

  void kembali() async {
    ///kembali ke halaman sebelunya atau ini
    await waiting();
    stdout.write('Kembali ke halaman sebelumnya ? (Y/N) :');
    String input = stdin.readLineSync()!;
    RegExp yes = RegExp(r'(Y|y|i?ya)');
    RegExp no = RegExp(r'(N|n|tidak)');
    var checkyes = yes.hasMatch(input);
    var checkno = no.hasMatch(input);
    if (checkyes == true) {
      var a = HomePage(data: data, accountinfo: accountinfo);
      a.runHomePage();

      //cek apakah nomor atm dan pin ada di homepage
    } else if (checkno == true) {
      runProfile();
    } else {
      runProfile(again: false);
    }
  }
}
