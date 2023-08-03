void main() {
  String inputString =
      "0123456"; // Ganti dengan string yang ingin Anda tambahkan spasi

  String resultString = insertSpaces(inputString);
  print(resultString);
}

String insertSpaces(String input) {
  String result = '';
  for (int i = 0; i < input.length; i++) {
    if (i == 1) {
      result += ' ';
    } else if (i == 4) {
      result += ' ';
    }
    result += input[i];
  }
  return result;
}
