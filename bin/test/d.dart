///function mencari nomor hp secara spesifik
///

void kond1() {
  stdout.write('Nmor HandPhone :');
  String hp = stdin.readLineSync()!;
  var uo = hp.trim();
  var jk = uo.replaceAll(' ', '');
  var ou = jk.replaceAll('  ', '');

  void cek1() {
    RegExp cek = RegExp(r'^08\d{10,11}$');
    var gi = cek.hasMatch(ou);
    if (gi == true) {
      print('hai');
    }
  }

  void cek2() {
    RegExp cek = RegExp(r'\b\d{1,11}\b');
    var ij = cek.hasMatch(ou);
    if (ij == true) {
      print('p');
    }
  }

  void cek3() {
    RegExp cek = RegExp(r'\b\d{14,}\b');
    var ij = cek.hasMatch(ou);
    if (ij == true) {
      print('o');
    }
  }

  void cek4() {
    RegExp cek = RegExp(r'^[a-zA-Z\s]+$');
    var hi = cek.hasMatch(ou);
    if (hi == true) {
      print('a');
    }
  }

  cek1();
  cek2();
  cek4();
  cek3();
}
