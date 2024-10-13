import 'dart:io';

import '../../function/function.dart';
import '../homePage/transfer_page.dart';
import '../homePage/rekeningku_page.dart';
import '../../database/database_model.dart';
import '../notaPage/nota_send_money_same_bank.dart';

class SendMoneyToTheSameBank extends Transfer {
  SendMoneyToTheSameBank({required super.data, required super.accountinfo});

  void runSendMoneySame({int attempt = 0}) async {
    eraser();
    print(up * 33);
    print('$side   TRANSFER SESAMA BANK Teng   $side');
    print(up * 33);
    print('');

    // Menampilkan pesan kesalahan jika attempt > 0
    if (attempt > 0) {
      print(
          '"Nomor Atm tidak ditemukan, coba lagi. Kesempatan tersisa: ${5 - attempt}"\n');
    }

    print('Transfer ke Bank Teng');
    print(
        'Nomor ATM Pengirim        : ${insertspace(accountinfo['Nomor ATM']!)}');
    print('Nama Pengirim             : ${accountinfo['Nama']}');

    if (attempt < 5) {
      try {
        stdout.write('Nomor ATM Penerima        : ');
        int sendnmratmatm = int.parse(stdin.readLineSync()!);
        String sendnmratm = sendnmratmatm.toString();

        // Periksa apakah nomor ATM penerima valid dan berbeda dari pengirim
        var receiver = data.firstWhere(
          (user) => user.containsKey(sendnmratm),
          orElse: () => {},
        );

        if (receiver.isEmpty || sendnmratm == accountinfo['Nomor ATM']) {
          attempt++;
          //buat kode verfikasi lanjut isi nomor atm penerima atau mau keluar
          runSendMoneySame(attempt: attempt);
        } else if (receiver.isNotEmpty) {
          findAtmSucces(sennmratm: sendnmratm);
        }
      } catch (e) {
        attempt++;
        //buat kode verfikasi lanjut isi nomor atm penerima atau mau keluar
        runSendMoneySame(attempt: attempt);
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
      // print('Angka yang dimasukkan: $number');
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
          // krimuang(sennmratm, sendmoney);
          DatabaseModel database = DatabaseModel();
          List<Map<String, dynamic>> dataupdate = database.updateData(
              sennmratm, sendmoney, accountinfo['Nomor ATM'], data);
          Map<String, dynamic> accountupdate =
              database.updateMinSaldo(accountinfo, sendmoney);
          //ke halaman nota
          NotaSendMoneSameBank notaSendMoneSameBank = NotaSendMoneSameBank(
              data: dataupdate,
              accountinfo: accountupdate,
              sendMoney: sendmoney,
              senNmrAtm: sennmratm);
          notaSendMoneSameBank.runnota();
        } else if (checkno == true) {
          waiting();
          Rekeningku rekeningku =
              Rekeningku(data: data, accountinfo: accountinfo);
          rekeningku.runRekeningku();
        } else {
          waiting();
          Rekeningku rekeningku =
              Rekeningku(data: data, accountinfo: accountinfo);
          rekeningku.runRekeningku();
        }
      }
    } catch (e) {
      print('\n"Masukkan jumlah uang dengan angka"');
      againsendsame(sendnmratm: sennmratm, salahangka: true);
      findAtmSucces(sennmratm: sennmratm);
    }
  }

  void againsendsame({String? sendnmratm, bool? salahangka = false}) {
    eraser();
    print(up * 33);
    print('$side   TRANSFER SESAMA BANK Teng   $side');
    print(up * 33);
    print('');
    if (salahangka == false) {
      print('"Tidak bisa mengirim uang melebihi 10 juta"\n');
    } else if (salahangka == true) {
      print('"Masukkan jumlah uang dengan angka"\n');
    }
    print('Transfer ke Bank Teng');
    print(
        'Nomor ATM Pengirim        : ${insertspace(accountinfo['Nomor ATM']!)}');
    print('Nama Pengirim             : ${accountinfo['Nama']}');
    print('Nomor ATM Penerima        : $sendnmratm');
  }

  void againsendsame2({String? sendnmratm, bool? saldoless = false}) {
    eraser();
    print(up * 33);
    print('$side   TRANSFER SESAMA BANK Teng   $side');
    print(up * 33);
    print('');
    if (saldoless == true) {
      print('"Saldo tidak cukup"\n');
    }
    print('Transfer ke Bank Teng');
    print(
        'Nomor ATM Pengirim        : ${insertspace(accountinfo['Nomor ATM']!)}');
    print('Nama Pengirim             : ${accountinfo['Nama']}');
    print('Nomor ATM Penerima        : $sendnmratm');
  }
}
