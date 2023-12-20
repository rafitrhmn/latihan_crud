void main() {
  String input = "1234567"; // Ganti dengan input yang ingin Anda verifikasi

  if (isValidInput(input)) {
    print('Input valid: $input');
  } else {
    print('Input tidak valid: $input');
  }
}

bool isValidInput(String input) {
  RegExp regex = RegExp(r'^\d+$');
  if (regex.hasMatch(input)) {
    int value = int.parse(input);
    return value <= 10000000; // Memverifikasi nilai maksimal 10 juta
  }
  return false;
}
