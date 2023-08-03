// Contoh data nomor ATM dan nama pengguna dalam bentuk Map
import 'dart:io';

Map<String, String> dataNomorATM = {
  '1234567890': 'John Doe',
  '9876543210': 'Jane Smith',
  // Tambahkan data nomor ATM dan nama pengguna lainnya di sini
};

void main() {
  // Mengambil nomor ATM dari input
  stdout.write('input nomor atm');
  var nomorATMInput = stdin.readLineSync()!;

  // Memanggil fungsi untuk mencari nama pengguna
  String namaPengguna = cariNamaPengguna(nomorATMInput);

  // Output hasil pencarian
  if (namaPengguna != 'f') {
    print('Nama Pengguna: $namaPengguna');
  } else {
    print('Nomor ATM tidak ditemukan');
  }
}

String cariNamaPengguna(String nomorATM) {
  if (dataNomorATM.containsKey(nomorATM)) {
    return '${dataNomorATM[nomorATM]}';
  } else {
    return 'f';
  }
}
