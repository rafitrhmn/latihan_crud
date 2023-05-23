// untuk mencari funtion timer

import 'dart:async';

void main() {
  ok();
}

void ok() async {
  print('p');

  await Future.delayed(Duration(seconds: 4));
  print('i');

  print('end');
}
