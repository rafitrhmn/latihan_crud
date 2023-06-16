import 'halaman_depan.dart';
import 'Daftar.dart';

void main() {
  ///menjalankan program
  bersih();
  var depan = Interface();
  depan.garisAtas();
  depan.teks("|");

  var depan2 = Interface2();
  depan2.teks2('|');
  depan2.teks3('|');
  depan2.pilihan();
  depan2.input('|');
}

// cd belajar_2/bin/crud
