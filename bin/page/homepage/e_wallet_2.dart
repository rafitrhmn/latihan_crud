import 'e_wallet.dart';
import 'dart:io';
import 'rekeningku_page.dart';
import '../../function/function.dart';

class EWallet2 extends EWallet {
  EWallet2({required super.data, required super.accountinfo});

  void runEwallet2({int? choice, bool? warning = false}) {
    eraser();
    print('=' * 16);
    print('|   E-Wallet   |');
    print('=' * 16);

    print('');
    if (warning == true) {
      print('Norek harus berupa 11,12 angka yang berawalan 08\n');
    }
    try {
      if (choice == 1) {
        print('Isi saldo e-wallet Dana');
        stdout.write('Masukkan norek Dana   : ');
        String norek = stdin.readLineSync()!.replaceAll(' ', '');
        if (_isValidNorek(norek)) {
          runEwalletUang(norek, 'Dana');
        } else {
          runEwallet2(choice: 1, warning: true);
        }
      } else if (choice == 2) {
        print('Isi saldo e-wallet Gopay');
        stdout.write('Masukkan norek Gopay   : ');
        String norek = stdin.readLineSync()!.replaceAll(' ', '');
        if (_isValidNorek(norek)) {
          runEwalletUang(norek, 'Gopay');
        } else {
          runEwallet2(choice: 2, warning: true);
        }
      } else if (choice == 3) {
        print('Isi saldo e-wallet Ovo');
        stdout.write('Masukkan norek Ovo   : ');
        String norek = stdin.readLineSync()!.replaceAll(' ', '');
        if (_isValidNorek(norek)) {
          runEwalletUang(norek, 'Ovo');
        } else {
          runEwallet2(choice: 3, warning: true);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void runEwalletUang(String norek, String choice,
      {int? warning, bool? again}) async {
    int maxLimit = 1000000; // Limit 1 juta
    int saldoPengguna = accountinfo['Saldo']; // Ambil saldo dari accountinfo

    eraser();
    print('=' * 16);
    print('|   E-Wallet   |');
    print('=' * 16);
    print('');
    if (warning == 1) {
      print('Jumlah saldo tidak valid.\n');
    } else if (warning == 2) {
      print('Saldo tidak mencukupi. Sisa saldo: $saldoPengguna');
    } else if (warning == 3) {
      print('Jumlah saldo tidak boleh lebih dari 1 juta.');
    }
    print('Isi saldo e-wallet $choice');
    print('Masukkan norek $choice   : $norek');
    stdout.write('Masukkan jumlah Saldo : ');
    String inputMoney =
        stdin.readLineSync()!.replaceAll(' ', '').replaceAll('.', '');
    int? money = int.tryParse(inputMoney);

    // Validasi jumlah saldo yang dimasukkan
    if (money == null) {
      runEwalletUang(norek, choice, warning: 1);
    } else if (money > saldoPengguna) {
      runEwalletUang(norek, choice, warning: 2);
    } else if (money > maxLimit) {
      runEwalletUang(norek, choice, warning: 3);
    } else {
      // Jika valid, lakukan proses selanjutnya
      var sendmoneyfix = processingInput(money);
      stdout.write(
          'anda ingin mengisi saldo e-wallet $choice sebesar Rp $sendmoneyfix ke $norek ?(Y/N) ');
      var input = stdin.readLineSync()!;
      RegExp yes = RegExp(r'(Y|y|i?ya)');
      var checkyes = yes.hasMatch(input);
      if (checkyes == true) {
        accountinfo['Saldo'] -= money;
        notaEwallet(choice, money);
      } else {
        waiting();
        Rekeningku rekeningku =
            Rekeningku(data: data, accountinfo: accountinfo);
        rekeningku.runRekeningku();
      }
    }
  }

  void notaEwallet(String choice, int? money, {bool? again = true}) async {
    var sendmoneyfix = processingInput(money!);
    eraser();
    await waiting();
    print('=' * 16);
    print('|   E-Wallet   |');
    print('=' * 16);
    print('');
    print('   Bukti Pengisian E-Wallet\n');
    print('Nomor Rekening                   : ${accountinfo['Nomor ATM']}');
    print('Nomor Rekening E-Wallet $choice    : ${accountinfo['Nama']}');
    print('Jumlah Pengisian Saldo           : $sendmoneyfix');
    if (again == false) {
      print(' ');
      print('"Pilih Y untuk iya dan N untuk tidak"');
      await waiting();
    }
    await waiting();
    kembali(choice, money);
  }

  void kembali(String choice, int? money) async {
    ///kembali ke halaman sebelunya atau ini
    await waiting();
    print('');
    stdout.write('Kembali ke halaman sebelumnya ? (Y/N) :');
    String input = stdin.readLineSync()!.trim();
    if (input == 'Y' || input == 'y') {
      runHomePage();
    } else if (input == 'N' || input == 'n') {
      notaEwallet(choice, money);
    } else {
      notaEwallet(choice, money, again: false);
    }
  }

  //funtion verifikasi norek
  bool _isValidNorek(String norek) {
    // Memastikan norek terdiri dari 11 atau 12 angka dan diawali dengan "08"
    return norek.startsWith('08') &&
        (norek.length == 11 || norek.length == 12) &&
        int.tryParse(norek) != null;
  }
}
