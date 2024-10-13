void main() {
  // Definisi variabel data asli
  var data = [
    {
      1: {
        'Nama': 'Rafi',
        'Handphone': '0895418403700',
        'Email': 'rafi@gmail.com',
        'PIN': '1',
        'Saldo': 100000
      }
    },
    {
      2: {
        'Nama': 'Loyi',
        'Handphone': '085424531342',
        'Email': 'loyi@gmail.com',
        'PIN': '345678',
        'Saldo': 20000000
      }
    }
  ];

  // Konversi ke List<Map<String, dynamic>>
  List<Map<String, dynamic>> newData = data.map((user) {
    // Mendapatkan key utama (nomor ATM) dan data pengguna
    var key = user.keys.first;
    var userData = user[key];

    // Membuat map baru dengan key 'NomorATM'
    return {
      'NomorATM': key.toString(), // Mengonversi key ke string
      ...userData!, // Menambahkan data pengguna lainnya
    };
  }).toList();

  // Print newData untuk melihat hasilnya
  print(newData);
}
