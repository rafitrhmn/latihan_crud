///source kode function global crud dart
///
import 'dart:io';

//1.menghapus terminal
void eraser() {
  stdout.write('\x1B[2J\x1B[0;0H');
}

//2. kolom kosang dengan garis samping
void empty() {
  const side = '|';
  print(side + ' ' * 54 + side);
}

//3.function menuggu 1.5 detik
Future<dynamic> waiting() async =>
    await Future.delayed(Duration(milliseconds: 1500));

//4.function mereplace spasi
String shorten(String i) {
  var j = i.trim();
  var jj = j.replaceAll(' ', '');
  var jjj = jj.replaceAll('  ', '');
  return jjj;
}

//4.function loading 3 detik
Future<dynamic> second3() async =>
    await Future.delayed(Duration(milliseconds: 2500));
