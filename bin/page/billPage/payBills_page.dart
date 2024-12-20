import '../homePage/pembayaran_page.dart';
import 'dart:io';
import '../homePage/rekeningku_page.dart';
import '../../function/function.dart';

class PayBills extends Pembayaran {
  PayBills({required super.data, required super.accountinfo});

  void runPayBills({bool? warning}) async {
    eraser();
    print(up * 21);
    print('$side   Bayar Tagihan   $side');
    print(up * 21);
    print('');
    print('Bayar Tagihan Mu disini');
    print('Pilih Tagihan Mu : ');
    print('1. Listrik Pascabayar');
    print('2. Air\b');
    if (warning == false) {
      print(
          '"Masukkan angka 1 untuk Bayar tagihan listrik pascabayar, angka 2 untuk tagihan air, dan angka 3 untuk kembali "');
      await waiting();
      print('');
    }
    try {
      stdout.write('MASUKKAN ANGKA PILIHAN : ');
      int choice = int.parse(stdin.readLineSync()!);
      if (choice == 1) {
        runPayBills2('Listrik');
      } else if (choice == 2) {
        runPayBills2('Air');
      } else {
        runPayBills(warning: false);
      }
    } catch (e) {
      //ke function tranfer
      runPayBills(warning: false);
    }
  }

  void runPayBills2(String billName, {bool? warning}) async {
    eraser();
    print(up * 21);
    print('$side   Bayar Tagihan   $side');
    print(up * 21);
    print('');
    if (warning == false) {
      if (billName == 'Listrik') {
        print('Nomor Tagihan $billName harus berupa 11 atau 12 angka');
      } else if (billName == 'Air') {
        print('Nomor Tagihan $billName harus berupa 6 angka');
      }
    }
    print('Bayar Tagihan $billName');
    stdout.write('Masukkan Nomor Tagihan $billName   : ');
    String invoice =
        stdin.readLineSync()!.replaceAll(' ', '').replaceAll('.', '');

    if (billName == 'Listrik' && invoice.length == 11 || invoice.length == 12) {
      jmlByrTghn(billName, invoice);
    } else if (billName == 'Air' && invoice.length == 6) {
      jmlByrTghn(billName, invoice);
    } else {
      runPayBills2(billName, warning: false);
    }
  }

  void jmlByrTghn(String bayar, String invoice, {int? warning}) {
    eraser();
    print(up * 21);
    print('$side   Bayar Tagihan   $side');
    print(up * 21);
    print('');
    if (warning == 1) {
      print('Jumlah tagihan harus berupa angka.\n');
    } else if (warning == 2) {
      print('Jumlah tagihan minumum Rp10.000');
    } else if (warning == 3) {
      print('Jumlah tagihan maksimaum Rp1.000.000');
    } else if (warning == 4) {
      print('Saldo tidak mencukupi');
    }
    print('Bayar Tagihan $bayar');
    print('Masukkan Nomor Tagihan $bayar        : $invoice');
    stdout.write('Masukkan Jumlah Tagihan $bayar       : ');
    String jmlTghn =
        stdin.readLineSync()!.replaceAll(' ', '').replaceAll('.', '');

    int? jumlahTagihan =
        int.tryParse(jmlTghn); // Mengubah string menjadi integer

    if (jumlahTagihan == null) {
      jmlByrTghn(bayar, invoice, warning: 1); // Ulangi input
    } else if (jumlahTagihan < 10000) {
      jmlByrTghn(bayar, invoice, warning: 2); // Ulangi input
    } else if (jumlahTagihan > 1000000) {
      jmlByrTghn(bayar, invoice, warning: 3); // Ulangi input
    } else if (jumlahTagihan > accountinfo['Saldo']) {
      jmlByrTghn(bayar, invoice, warning: 4);
    } else {
      var jumlahtagihanRp = processingInput(jumlahTagihan);
      stdout.write(
          'anda ingin membayar tagihan $bayar ke nomor tagihan $invoice sebesar Rp $jumlahtagihanRp ? (Y/N)');
      String input = stdin.readLineSync()!.trim();
      if (input == 'Y' || input == 'y') {
        accountinfo['Saldo'] -= jumlahTagihan;
        //ke nota
        notaTagihan(bayar, invoice, jumlahTagihan);
      } else if (input == 'N' || input == 'n') {
        waiting();
        Rekeningku rekeningku =
            Rekeningku(data: data, accountinfo: accountinfo);
        rekeningku.runRekeningku();
      }
    }
  }

  void notaTagihan(String bayar, String nmrtagihan, int? jumlahTagihan,
      {bool? again = true}) async {
    var jumlahtagihanRp = processingInput(jumlahTagihan!);
    eraser();
    print(up * 21);
    print('$side   Bayar Tagihan   $side');
    print(up * 21);
    print('');
    print('Bayar Tagihan $bayar');
    print('Nomor Tagihan $bayar            : $nmrtagihan');
    print('Jumlah Tagihan $bayar           : Rp$jumlahtagihanRp');
    if (again == false) {
      print(' ');
      print('"Pilih Y untuk iya dan N untuk tidak"');
      await waiting();
    }
    await waiting();
    kembali(bayar, nmrtagihan, jumlahTagihan);
  }

  void kembali(
    String bayar,
    String nmrtagihan,
    int? jumlahTagihan,
  ) async {
    ///kembali ke halaman sebelunya atau ini
    await waiting();
    print('');
    stdout.write('Kembali ke halaman sebelumnya ? (Y/N) :');
    String input = stdin.readLineSync()!.trim();
    if (input == 'Y' || input == 'y') {
      runHomePage();
    } else if (input == 'N' || input == 'n') {
      notaTagihan(bayar, nmrtagihan, jumlahTagihan);
    } else {
      notaTagihan(bayar, nmrtagihan, jumlahTagihan, again: false);
    }
  }
}
