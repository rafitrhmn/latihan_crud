import 'dart:io';
import '../database/database_model.dart';
import '../function/function.dart';
import 'homepage/home_page.dart';

class Login {
  // initialize a variable named data
  List<Map<String, dynamic>> data;
  Login({required this.data});

  // method of running login
  void runLogin() async {
    bool isLoggedIn = false;
    int attempt = 0;

    while (!isLoggedIn && attempt < 5) {
      print('${' ' * 3}Loading...');
      await second3();
      eraser();
      titlelogin();
      print('');
      // print('$data');
      print('   Masuk ke akun anda\n');

      //input Nomor ATM
      stdout.write('Nomor ATM   : ');
      String nomoratm = stdin.readLineSync()!;
      var trimNomoratm = nomoratm.trim();
      var fiksNomoratm = trimNomoratm.replaceAll(' ', '');

      //input PIN
      stdout.write('PIN         : ');
      String pin = '';
      stdin.echoMode = false;
      pin = stdin.readLineSync()!;
      var trimpin = pin.trim();
      var fiksPin = trimpin.replaceAll(' ', '');
      stdin.echoMode = true;
      stdout.write('\n');

      // verify the ATM Number is a 7 character number
      RegExp verifNomorAtm = RegExp(r'^\d{7}');
      bool isverifNoAtm = verifNomorAtm.hasMatch(fiksNomoratm);
      // verify the pin is a 6 character number
      RegExp verifPIN = RegExp(r'^\d{6}');
      bool isverifpin = verifPIN.hasMatch(fiksPin);

      if (!isverifNoAtm) {
        attempt++;
        if (attempt < 5) {
          print('');
          print('Gunakan angka sebagai nomor ATM (7 karakter).');
          continue;
        } else if (attempt == 5) {
          print('');
          forgotpin(
            nomoratm: fiksNomoratm,
          );
          break;
        }
      }
      if (!isverifpin) {
        attempt++;
        if (attempt < 5) {
          print('');
          print('Gunakan 6 karakter angka sebagai PIN.');
          continue;
        } else if (attempt == 5) {
          print('');
          forgotpin(
            nomoratm: fiksNomoratm,
          );
          break;
        }
      }

      // verify that the ATM number and pin input are in the database
      var matchedUser = data.firstWhere(
        (userData) =>
            userData.containsKey(fiksNomoratm) &&
            userData[fiksNomoratm]!['PIN'] == fiksPin,
        orElse: () => {},
      );

      if (matchedUser.isEmpty) {
        attempt++;
        if (attempt == 5) {
          print('');
          forgotpin(
            nomoratm: fiksNomoratm,
          );
          break;
        }
        print('');
        print('Nomor ATM atau PIN salah. Silakan coba lagi.');
      } else {
        isLoggedIn = true;
        print(' ');
        print('Nomor ATM  dan PIN berhasil ditemukan');
        // to homepage
        DatabaseModel dataa = DatabaseModel();
        final datauser =
            dataa.saveAccountInfo(matchedUser[fiksNomoratm], fiksNomoratm);
        HomePage homepage = HomePage(accountinfo: datauser, data: data);
        homepage.runHomePage();
      }
    }
  }

  //method title login
  void titlelogin({final jk = '=', final jl = '|'}) {
    print('${jk * 22}');
    print('$jl   HALAMAN LOGIN    $jl');
    print('${jk * 22}');
    print('');
  }

  // method forgot pin
  void forgotpin({String? nomoratm}) async {
    await waiting();
    stdout.write('Anda lupa PIN? (Y/N) : ');
    String nerima = stdin.readLineSync()!;
    RegExp yes = RegExp(r'(Y|y|i?ya)');
    RegExp no = RegExp(r'(N|n|tidak)');
    var cekyes = yes.hasMatch(nerima);
    var cekno = no.hasMatch(nerima);
    if (cekyes == true) {
      //ke halaman lupa pin
    } else if (cekno == true) {
      //go to the login page again
      runLogin();
    } else {
      //go to the login page but go straight to input forgot pin
      again(nomoratm: nomoratm);
    }
  }

  // method if answer forgets pin not Y and N
  void again({String? nomoratm}) async {
    eraser();
    titlelogin();
    print('   Masuk ke akun anda\n');
    print('Nomor ATM   : $nomoratm');
    print('PIN         : ');
    print(' ');
    print('"Pilih Y untuk iya dan N untuk tidak"');
    await waiting();
    forgotpin(nomoratm: nomoratm);
  }
}

void main(List<String> args) {
  DatabaseModel a = DatabaseModel();
  var b = a.getDataList();
  Login loo = Login(data: b);
  loo.forgotpin();
}
