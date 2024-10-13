import 'dart:io';

import '../transferPage/send_money_same_bank.dart';
import '../../function/function.dart';

class NotaSendMoneSameBank extends SendMoneyToTheSameBank {
  int sendMoney;
  String? senNmrAtm;
  NotaSendMoneSameBank(
      {required super.data,
      required super.accountinfo,
      required this.sendMoney,
      required this.senNmrAtm});

  void runnota({bool? again}) async {
    eraser();
    await waiting();
    String sendNmrAtm2 = senNmrAtm ?? '';
    String sendMoney2 = processingInput(sendMoney);
    print(up * 31);
    print('$side' + ' ' * 2 + 'Transfer sesama BANK TENG' + ' ' * 2 + side);
    print(up * 31);
    print('');
    print('   Bukti Transfer\n');
    print('Nomor ATM Pengirim          : ${accountinfo['Nomor ATM']}');
    print('Nama Rekening               : ${accountinfo['Nama']}');
    print('Nomor ATM Penerima          : $sendNmrAtm2');
    print('Jumlah Uang yang Dikirim    : $sendMoney2');

    if (again == false) {
      print(' ');
      print('"Pilih Y untuk iya dan N untuk tidak"');
      await waiting();
    }
    await waiting();
    kembali();
  }

  void kembali() async {
    ///kembali ke halaman sebelunya atau ini
    await waiting();
    print('');
    stdout.write('Kembali ke halaman sebelumnya ? (Y/N) :');
    String input = stdin.readLineSync()!.trim();
    if (input == 'Y' || input == 'y') {
      runHomePage();
    } else if (input == 'N' || input == 'n') {
      runnota();
    } else {
      runnota(again: false);
    }
  }
}
