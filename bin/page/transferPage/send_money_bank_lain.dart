import 'dart:io';

import '../../function/function.dart';
import '../homePage/transfer_page.dart';
import '../homePage/rekeningku_page.dart';
import '../../database/database_model.dart';
import '../notaPage/nota_send_money_bank_other.dart';

class SendMoneyBankLain extends Transfer {
  SendMoneyBankLain({required super.data, required super.accountinfo});

  void runSendMoneyOther({int attempt = 0}) async {
    eraser();
    String up = '=';
    String side = '|';
    print(up * 26);
    print('$side   TRANSFER BANK Lain   $side');
    print(up * 26);
    print('');

    // Menampilkan pesan kesalahan jika attempt > 0
    if (attempt > 0) {
      print(
          '"Nomor Atm menggunakan 7 angka, coba lagi. Kesempatan tersisa: ${5 - attempt}"\n');
    }

    print('Transfer ke Bank Lain');
    print(
        'Nomor ATM Pengirim        : ${insertspace(accountinfo['Nomor ATM']!)}');
    print('Nama Pengirim             : ${accountinfo['Nama']}');

    if (attempt < 5) {
      try {
        stdout.write('Nomor ATM Penerima        : ');
        String sendnmratm = stdin.readLineSync()!;
        var sendnmratmfix = sendnmratm.replaceAll(' ', '');

        // Periksa apakah nomor ATM penerima valid (8 angka) dan berbeda dari pengirim
        if (sendnmratmfix.length == 7 &&
            int.tryParse(sendnmratmfix) != null &&
            sendnmratmfix != accountinfo['Nomor ATM']) {
          findAtmSucces(sennmratm: sendnmratmfix);
        } else {
          attempt++;
          // buat kode verfikasi lanjut isi nomor atm penerima atau mau keluar
          runSendMoneyOther(attempt: attempt);
        }
      } catch (e) {
        attempt++;
        // buat kode verfikasi lanjut isi nomor atm penerima atau mau keluar
        runSendMoneyOther(attempt: attempt);
      }
    } else {
      print('\nAnda sudah melebihi batas kesempatan.');
      await second3();
      runHomePage();
    }
  }

  void findAtmSucces({String? sennmratm}) async {
    // print('Masukkan jumlah untuk dikirim :');
    // print(input);
    stdout.write('Jumlah uang yang dikirim  : ');
    String? inputuser = stdin.readLineSync(); // Membaca input dari pengguna
    var inputuserfix = inputuser
        ?.replaceAll('.', '')
        .replaceAll(' ', ''); // hilangakn tanda titik dan spasi

    try {
      int sendmoney = int.parse(inputuserfix!);
      if (sendmoney >= 10000000) {
        againsendsame(sendnmratm: sennmratm);
        findAtmSucces(sennmratm: sennmratm);
      } else if (sendmoney > accountinfo['Saldo']) {
        againsendsame2(sendnmratm: sennmratm, saldoless: true);
        findAtmSucces(sennmratm: sennmratm);
      } else if (sendmoney <= 9999999) {
        var sendmoneyfix = processingInput(sendmoney);
        print('');
        stdout.write(
            'Anda ingin mengirim uang sebesar Rp $sendmoneyfix ke  ?(Y/N) ');
        var input = stdin.readLineSync()!;
        RegExp yes = RegExp(r'(Y|y|i?ya)');
        RegExp no = RegExp(r'(N|n|tidak)');
        var checkyes = yes.hasMatch(input);
        var checkno = no.hasMatch(input);
        if (checkyes == true) {
          //ada yg errrro di bgain ini
          DatabaseModel database = DatabaseModel();
          List<Map<String, dynamic>> dataUpdate = database.updateDataBankOther(
              sendmoney, accountinfo['Nomor ATM'], data);
          Map<String, dynamic> accountupdate =
              database.updateMinSaldo(accountinfo, sendmoney);
          print(accountupdate);
          NotaSendMoneOtheBank notaSendMoneOtheBank = NotaSendMoneOtheBank(
              data: dataUpdate,
              accountinfo: accountupdate,
              sendMoney: sendmoney,
              senNmrAtm: sennmratm);
          notaSendMoneOtheBank.runnota();
        } else {
          waiting();
          Rekeningku rekeningku =
              Rekeningku(data: data, accountinfo: accountinfo);
          rekeningku.runRekeningku();
        }
      }
    } catch (e) {
      print('nyangkut disini');
    }
  }

  void againsendsame({String? sendnmratm, bool? salahangka = false}) {
    eraser();
    print(up * 26);
    print('$side   TRANSFER BANK Lain   $side');
    print(up * 26);
    print('');
    if (salahangka == false) {
      print('"Tidak bisa mengirim uang melebihi 10 juta"\n');
    } else if (salahangka == true) {
      print('"Masukkan jumlah uang dengan angka"\n');
    }
    print('Transfer ke Bank Lain');
    print(
        'Nomor ATM Pengirim        : ${insertspace(accountinfo['Nomor ATM']!)}');
    print('Nama Pengirim             : ${accountinfo['Nama']}');
    print('Nomor ATM Penerima        : $sendnmratm');
  }

  void againsendsame2({String? sendnmratm, bool? saldoless = false}) {
    eraser();
    print(up * 33);
    print('$side   TRANSFER BANK Lain   $side');
    print(up * 33);
    print('');
    if (saldoless == true) {
      print('"Saldo tidak cukup"\n');
    }
    print('Transfer ke Bank Lain');
    print(
        'Nomor ATM Pengirim        : ${insertspace(accountinfo['Nomor ATM']!)}');
    print('Nama Pengirim             : ${accountinfo['Nama']}');
    print('Nomor ATM Penerima        : $sendnmratm');
  }
}
