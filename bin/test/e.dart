///fungsi mendapatkan nilai acak
///
import 'dart:math';

import '../Daftar.dart';

//fungsi mendapat nomor atm
String dptacak(int y) {
  var acak = Random();
  var y = '';
  for (var i = 0; i < 7; i++) {
    y += acak.nextInt(10).toString();
  }
  return y;
}

//fungsi memeuncul nomor atm
void munculnomoratm2() async {
  print(' ');
  print('${' ' * 3}Loading...');
  await Future.delayed(Duration(milliseconds: 1500));

  bersih();
  garisAA();
  print(' ');
  print('Nomor ATM anda : ${dptacak(1)}');
  print(' ');
  print('Terima kasaih telah mendaftar di bank Teng');
  var fgh = Daftar();
  var gh = fgh.ijka();
  print(gh);
}

void main() {
  munculnomoratm2();
}
