///code untuk logi dan daftar
///
///

import 'dart:io';
import 'dart:core';

void input(final samping) {
  try {
    stdout.write('  MASUKKAN ANGKA PILIHAN ANDA : ');
    int milih = int.parse(stdin.readLineSync()!);
    if (milih == 1) {
      print('  Anda LOGIN');
    } else if (milih == 2) {
      print('  Anda DAFTAR');
    } else if (milih >= 3) {
      print('Masukaan angka 1 atau angka 2');
    } else if (milih <= 0) {
      print('Masukann angka 1 atau 2');
    }
  } catch (e) {
    print('inputan salah');
    input('|');
  }
}

void main() {
  input('|');
}
