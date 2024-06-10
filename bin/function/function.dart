///source kode function global crud dart
import 'dart:io';

// function deletes terminal
void eraser() {
  stdout.write('\x1B[2J\x1B[0;0H');
}

//2. blank columns with side lines
void empty() {
  const side = '|';
  print(side + ' ' * 54 + side);
}

//3.function waits 1.5 seconds
Future<dynamic> waiting() async =>
    await Future.delayed(Duration(milliseconds: 1500));

//4.function replaces spaces
String shorten(String i) {
  var j = i.trim();
  var jj = j.replaceAll(' ', '');
  var jjj = jj.replaceAll('  ', '');
  return jjj;
}

//4.function loading 3 seconds
Future<dynamic> second3() async =>
    await Future.delayed(Duration(milliseconds: 2500));

// function insertspace in number atm
String insertspace(String? nomoratm) {
  String result = '';
  for (var i = 0; i < nomoratm!.length; i++) {
    if (i == 1) {
      result += ' ';
    } else if (i == 4) {
      result += ' ';
    }
    result += nomoratm[i];
  }
  return result;
}

String processingInput(int jumlah) {
  String saldo = jumlah.toString();
  int length = saldo.length;
  if (length <= 3) {
    return saldo;
  } else if (length == 4) {
    var a = '${saldo.substring(0, 1)}.${saldo.substring(1)}';
    return a;
  } else if (length == 5) {
    var a = '${saldo.substring(0, 2)}.${saldo.substring(2)}';
    return a;
  } else if (length == 6) {
    var a = '${saldo.substring(0, 3)}.${saldo.substring(3)}';
    return a;
  } else if (length == 7) {
    var a =
        '${saldo.substring(0, 1)}.${saldo.substring(1, 4)}.${saldo.substring(4)}';
    return a;
  } else if (length == 8) {
    var a =
        "${saldo.substring(0, 2)}.${saldo.substring(2, 5)}.${saldo.substring(5)}";
    return a;
  } else {
    return 'a';
  }
}
