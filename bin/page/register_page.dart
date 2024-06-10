import 'dart:io';
import 'dart:core';
import 'dart:math';
import '../database/database_model.dart';
import 'front_page.dart';
import 'login_page.dart';
import '../function/function.dart';

/// class register
class Register {
  //field class register
  List<String> name = [];
  List<String> handphone = [];
  var email = [];
  var list = [];
  var pinn = [];
  //inisiasi variabel databsemodel
  DatabaseModel database = DatabaseModel();

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
    var trimnama = nama.trim();
    var fiksnama = trimnama.replaceAll('  ', ' ');
    RegExp cek = RegExp(r'^[a-zA-Z\s]+$');
    var checkName = cek.hasMatch(fiksnama);
    if (checkName == true) {
      name.add(fiksnama);
      saveInput.add(fiksnama);
      inputNohp();
    } else {
      wrong(1);
    }
  }

  //handphone input and handphone filter methods
  void inputNohp() {
    stdout.write('Nomor HandPhone ${' ' * 1}: ');
    String hp = stdin.readLineSync()!;
    RegExp cek = RegExp(r'^08\d{10,11}$');
    var checkhp = cek.hasMatch(shorten(hp));
    if (checkhp == true) {
      handphone.add(shorten(hp));
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
    RegExp cek = RegExp(r"^[a-zA-Z0-9]+@gmail.com$");
    var checkemail = cek.hasMatch(shorten(emaik));
    if (checkemail == true) {
      email.add(shorten(emaik));
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
        runAtmNumbers();
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
    bool checkpin = cek.hasMatch(shorten(pin));
    if (checkpin == true) {
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
    String i = name[0];
    print('Nama ${' ' * 11} : $i');
  }

  // Added cellphone number field if input error occurs
  void fungNo() {
    String i = handphone[0];
    print('Nomor Handphone ${' ' * 1}: $i');
  }

  //cellphone number field to be added if input error occurs
  void fungEmail() {
    String i = email[0];
    print('Email ${' ' * 11}: $i');
  }

  //pin field added if input error
  void fungPin() {
    print('PIN ${' ' * 13}: ');
  }

// saveinput field to receive all input
  List<String> saveInput = [];
  void tologin() {
    DatabaseModel data = DatabaseModel();
    data.register(
        nama: saveInput[0],
        handphone: saveInput[1],
        email: saveInput[2],
        pin: saveInput[3],
        nomoratm: saveInput[4],
        saldo: 0);
    //to login
    var dataa = data.getDataList();
    Login login = Login(data: dataa);
    login.runLogin();
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

///class displays the ATM number after registering
///
extension ATMNumberAppears on Register {
  //function muncul nomor atm
  void runAtmNumbers({bool? again, String? nmor}) async {
    print(' ');
    print('${' ' * 3}Loading...');
    await Future.delayed(Duration(milliseconds: 1500));
    eraser();
    titleRegister();
    print(' ');
    if (again == true) {
      print('Nomor ATM anda : $nmor');
    } else {
      print('Nomor ATM anda : ${gotATMnumber()}');
    }
    print(' ');
    showThanks();
    print('');
    if (again == true) {
      print('');
      print('"Pilih Y untuk iya dan Pilih N untuk tidak"');
      print('');
    }
    question();
  }

  //method title in register
  void titleRegister({final side_1 = '=', final side_2 = '|'}) {
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
    final nomoratm = y.replaceAll(' ', '');
    saveInput.add(nomoratm);
    return y;
  }

  // method of asking the user to return to the login page?
  void question() async {
    await waiting();
    stdout.write('Masuk ke akun anda? (Y/N) :');
    String input = stdin.readLineSync()!;
    RegExp yes = RegExp(r'(Y|y|i?ya)');
    RegExp no = RegExp(r'(N|n|tidak)');
    var checkyes = yes.hasMatch(input);
    var checkno = no.hasMatch(input);
    if (checkyes == true) {
      //newly registered balance o rupiah and go to the login page
      database.register(saldo: 0);
      tologin();
    } else if (checkno == true) {
      database.register(saldo: 0);
      var tofront = FrontPage();
      tofront.run(1);
    } else {
      database.register(saldo: 0);
      var nomoratm = insertspace(saveInput[4]);
      runAtmNumbers(
        again: true,
        nmor: nomoratm,
      );
    }
  }

  //method thank you
  void showThanks() {
    String i = name[0];
    print('Terima kasih $i telah menRegister di BANK TENG INDONESIA ');
  }
}
