void main() {
  // Contoh data nomor ATM, nama pengguna, alamat, saldo, dan PIN dalam bentuk Map
  Map<int, Map<String, dynamic>> dataPenggunaATM = {
    1234567890: {
      'Nama': 'John Doe',
      'Alamat': 'Jl. ABC No. 123',
      'Saldo': 1000.0,
      'PIN': '1234',
    },
    9876543210: {
      'Nama': 'Jane Smith',
      'Alamat': 'Jl. XYZ No. 456',
      'Saldo': 500.0,
      'PIN': '5678',
    },
    5555555555: {
      'Nama': 'Michael Johnson',
      'Alamat': 'Jl. KLM No. 789',
      'Saldo': 2000.0,
      'PIN': '4321',
    },
  };

  // Meminta input nomor ATM dan PIN dari pengguna
  int inputNomorATM = 9876543210; // Ganti dengan nomor ATM yang ingin dicek
  int inputPIN = 5678; // Ganti dengan PIN yang ingin dicek

  // Memanggil fungsi untuk melakukan verifikasi login
  bool loginBerhasil =
      verifikasiLogin(dataPenggunaATM, inputNomorATM, inputPIN);

  // Output hasil verifikasi login
  if (loginBerhasil) {
    print(
        'Login berhasil. Selamat datang, ${dataPenggunaATM[inputNomorATM]?['Nama']}!');
  } else {
    print('Login gagal. Nomor ATM atau PIN salah.');
  }
}

bool verifikasiLogin(
    Map<int, Map<String, dynamic>> dataPenggunaATM, int nomorATM, int pin) {
  // Memeriksa apakah nomor ATM ada dalam dataPenggunaATM
  if (dataPenggunaATM.containsKey(nomorATM)) {
    // Memeriksa apakah data PIN ditemukan dan tidak bernilai null
    if (dataPenggunaATM[nomorATM]?['PIN'] != null &&
        dataPenggunaATM[nomorATM]?['PIN'] == pin.toString()) {
      return true; // Login berhasil
    } else {
      return false; // PIN salah
    }
  } else {
    return false; // Nomor ATM tidak ditemukan
  }
}
