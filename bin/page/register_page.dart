import 'dart:io';
import 'dart:core';
import 'dart:math';
import 'front_page.dart';
import '../login.dart';
import '../function/function.dart';

/// class register
class Register {
  //field class register
  List<String> name = [];
  List<String> Handphone = [];
  var emaill = [];
  var list = [];
  var pinn = [];

// The method that runs first in the list class
  void runningRegis() async {
    print(' ');
    print('${' ' * 3}Loading...');
    await waiting();
    eraser();
    tittleRegister();
    print(' ');
    inputName();
  }

  //name input and name filter methods
  void inputName() {
    stdout.write('Nama ${' ' * 11} : ');
    String nama = stdin.readLineSync()!;
    var i = nama.trim();
    var ii = i.replaceAll('  ', ' ');
    RegExp cek = RegExp(r'^[a-zA-Z\s]+$');
    var CheckName = cek.hasMatch(ii);
    if (CheckName == true) {
      name.add(ii);
      saveInput.add(ii);
      inputNohp();
    } else {
      wrong(1);
    }
  }

  //handphone input and handphone filter methods
  void inputNohp() {
    stdout.write('Nomor HandPhone ${' ' * 1}: ');
    String hp = stdin.readLineSync()!;
    RegExp CheckHandphone = RegExp(r'^08\d{10,11}$');
    var i = CheckHandphone.hasMatch(shorten(hp));
    if (i == true) {
      Handphone.add(shorten(hp));
      saveInput.add(shorten(hp));
      inputEmail();
    } else {
      wrong(2);
    }
  }

  // email input method and email verification
  void inputEmail() {
    stdout.write('Email ${' ' * 11}: ');
    String emaik = stdin.readLineSync()!;
    RegExp CheckEmail = RegExp(r"^[a-zA-Z0-9]+@gmail.com$");
    var i = CheckEmail.hasMatch(shorten(emaik));
    if (i == true) {
      emaill.add(shorten(emaik));
      saveInput.add(shorten(emaik));
      inputPin();
    } else {
      wrong(3);
    }
  }

// pin input method and pin verification
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
        //to the method brings up the ATM number
        RunATMNumberAppears();
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

    //verify pin input
    RegExp cek = RegExp(r'^\d{6}$');
    bool i = cek.hasMatch(shorten(pin));
    if (i == true) {
      saveInput.add(shorten(pin));
      verifpin();
    } else {
      wrong(4);
    }
  }

//  methods if input name, cellphone number, email and pin are incorrect
  void wrong(int np) {
    //inner function if input name is wrong
    void wrongName() async {
      print(' ');
      print('${' ' * 3}"Gunakan Huruf untuk mengisi nama');
      await waiting();
      eraser();
      tittleRegister();
      print(' ');
      inputName();
    }

    //inner function if input nohp is wrong
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

    //inner function if email input is incorrect
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

    //inner function if the input pin is wrong
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

  // Name field added if input error
  void fungNama() {
    String ij = name[0];
    print('Nama ${' ' * 11} : $ij');
  }

  // Added cellphone number field if input error occurs
  void fungNo() {
    String il = Handphone[0];
    print('Nomor Handphone ${' ' * 1}: $il');
  }

  //cellphone number field to be added if input error occurs
  void fungEmail() {
    String ik = emaill[0];
    print('Email ${' ' * 11}: $ik');
  }

  //pin field added if input error
  void fungPin() {
    print('PIN ${' ' * 13}: ');
  }

// saveinput field to receive all input
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

// additional methods of the register class
extension Title on Register {
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
extension ATMNumberAppears on Register {
  //function muncul nomor atm
  void RunATMNumberAppears() async {
    print(' ');
    print('${' ' * 3}Loading...');
    await Future.delayed(Duration(milliseconds: 1500));
    eraser();
    TitleRegister();
    print(' ');
    print('Nomor ATM anda : ${gotATMnumber()}');
    print(' ');
    showThanks();
    print('');
    question();
  }

  //method title in register
  void TitleRegister({final side_1 = '=', final side_2 = '|'}) {
    print('${side_1 * 22}');
    print('$side_2     NOMOR ATM${' ' * 6}$side_2');
    print('${side_1 * 22}');
  }

  // method to get ATM number randomly
  String gotATMnumber() {
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

  // method of asking the user to return to the login page?
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
      var a = FrontPage();
      a.run(1);
    }
  }

  void showThanks() {
    String i = name[0];
    print('Terima kasih $i telah menRegister di BANK TENG INDONESIA ');
  }
}

//fungsi pengecekan huruf saja
void main() {
  var b = Register();
  b.runningRegis();
}
