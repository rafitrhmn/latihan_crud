import 'dart:io';

import 'pembayaran_page.dart';
import 'rekeningku_page.dart';
import '../../function/function.dart';

class Pulsa extends Pembayaran {
  Pulsa({required super.data, required super.accountinfo});

  void runPulsa({bool? warning}) async {
    eraser();
    print(up * 18);
    print('$side   Beli Pulsa   $side');
    print(up * 18);
    print('');

    if (warning == false) {
      print('Nomor Handphone tidak valid. Coba lagi.');
    }

    print('Beli Pulsa disini saja');
    stdout.write('Masukkan Nomor Handphone    : ');
    String nohp = stdin.readLineSync()!.replaceAll(' ', '');
    String layanan = _layanansim(nohp);
    if (nohp.startsWith('08') && nohp.length == 12 || nohp.length == 11) {
      if (layanan == 'Layanan tidak dikenal') {
        runPulsa(warning: false);
      } else {
        print('Layanan Kartu SIM    : $layanan');
        jumlahPulsa(nohp, layanan);
      }
    } else {
      // print('coba lagi');
      runPulsa(warning: false);
    }
  }

  void jumlahPulsa(String nohp, String layanan, {int? warning}) {
    List<int> nominalTersedia = [5000, 10000, 20000, 25000, 50000, 100000];
    int saldoPengguna = accountinfo['Saldo'];

    eraser();
    print(up * 18);
    print('$side   Beli Pulsa   $side');
    print(up * 18);
    print('');

    if (warning == 1) {
      print('Jumlah pulsa tidak valid, silakan pilih dari opsi yang tersedia.');
    } else if (warning == 2) {
      print('Saldo tidak mencukupi, sisa saldo Anda: $saldoPengguna');
    }
    print('Beli Pulsa disini saja');
    print('Masukkan Nomor Handphone    : $nohp');
    print('Layanan Kartu SIM           : $layanan');
    stdout.write("""Masukkan Jumlah Isi Pulsa 
(5k,10k,20k,25k,50k,100k)   : """);
    String jmlPulsaInput =
        stdin.readLineSync()!.replaceAll(' ', '').replaceAll('.', '');
    int? jmlPulsa = int.tryParse(jmlPulsaInput);

    if (jmlPulsa == null || !nominalTersedia.contains(jmlPulsa)) {
      print('Jumlah pulsa tidak valid, silakan pilih dari opsi yang tersedia.');
      jumlahPulsa(nohp, layanan, warning: 1); // Ulangi jika input tidak valid
    } else if (jmlPulsa > saldoPengguna) {
      print('Saldo tidak mencukupi, sisa saldo Anda: $saldoPengguna');
      jumlahPulsa(nohp, layanan,
          warning: 2); // Ulangi jika saldo tidak mencukupi
    } else {
      var jmlPulsaFix = processingInput(jmlPulsa);
      print('');
      stdout.write(
          'anda ingin mengisi pulsa layanan $layanan ke nomor $nohp sebesar Rp $jmlPulsaFix ?(Y/N) ');
      var input = stdin.readLineSync()!;
      RegExp yes = RegExp(r'(Y|y|i?ya)');
      var checkyes = yes.hasMatch(input);
      if (checkyes == true) {
        accountinfo['Saldo'] -= jmlPulsa;
        notaPulsa(nohp, layanan, jmlPulsa);
      } else {
        waiting();
        Rekeningku rekeningku =
            Rekeningku(data: data, accountinfo: accountinfo);
        rekeningku.runRekeningku();
      }
    }
  }

  void notaPulsa(String nohp, String layanan, int? jmlPulsa,
      {bool? again = true}) async {
    var jmlPulsafix = processingInput(jmlPulsa!);
    eraser();
    await waiting();
    print('=' * 18);
    print('|   Beli Pulsa   |');
    print('=' * 18);
    print('');
    print('   Bukti Pengisian Pulsa\n');
    print('Nomor Handphone              : $nohp');
    print('Layanan Kartu Sim             : $layanan');
    print('Jumlah Pengisian Saldo       : Rp$jmlPulsafix');
    if (again == false) {
      print(' ');
      print('"Pilih Y untuk iya dan N untuk tidak"');
      await waiting();
    }
    await waiting();
    kembali(nohp, layanan, jmlPulsa);
  }

  void kembali(
    String nohp,
    String layanan,
    int? jmlPulsa,
  ) async {
    ///kembali ke halaman sebelunya atau ini
    await waiting();
    print('');
    stdout.write('Kembali ke halaman sebelumnya ? (Y/N) :');
    String input = stdin.readLineSync()!.trim();
    if (input == 'Y' || input == 'y') {
      runHomePage();
    } else if (input == 'N' || input == 'n') {
      notaPulsa(nohp, layanan, jmlPulsa);
    } else {
      notaPulsa(nohp, layanan, jmlPulsa, again: false);
    }
  }

  String _layanansim(String nohp) {
    if (nohp.startsWith('0898') ||
        nohp.startsWith('0899') ||
        nohp.startsWith('0897') ||
        nohp.startsWith('0896') ||
        nohp.startsWith('0895')) {
      return 'Tri';
    } else if (nohp.startsWith('0878') ||
        nohp.startsWith('0859') ||
        nohp.startsWith('0819') ||
        nohp.startsWith('0818') ||
        nohp.startsWith('0817') ||
        nohp.startsWith('0877')) {
      return 'XL';
    } else if (nohp.startsWith('0821') ||
        nohp.startsWith('0822') ||
        nohp.startsWith('0853') ||
        nohp.startsWith('0852') ||
        nohp.startsWith('0851') ||
        nohp.startsWith('0812') ||
        nohp.startsWith('0811') ||
        nohp.startsWith('0813') ||
        nohp.startsWith('0852') ||
        nohp.startsWith('0823')) {
      return 'Telkomsel';
    } else if (nohp.startsWith('0814') ||
        nohp.startsWith('0815') ||
        nohp.startsWith('0816') ||
        nohp.startsWith('0855') ||
        nohp.startsWith('0856') ||
        nohp.startsWith('0857') ||
        nohp.startsWith('0858')) {
      return 'Indosat';
    } else if (nohp.startsWith('0889') ||
        nohp.startsWith('0881') ||
        nohp.startsWith('0882') ||
        nohp.startsWith('0883') ||
        nohp.startsWith('0886') ||
        nohp.startsWith('0887') ||
        nohp.startsWith('0888') ||
        nohp.startsWith('0884') ||
        nohp.startsWith('0885')) {
      return 'Smartfren';
    } else if (nohp.startsWith('0832') ||
        nohp.startsWith('0833') ||
        nohp.startsWith('0838') ||
        nohp.startsWith('0831')) {
      return 'Axis';
    } else {
      return 'Layanan tidak dikenal';
    }
  }
}
