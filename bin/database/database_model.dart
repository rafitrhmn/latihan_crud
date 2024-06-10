class DatabaseModel {
  List<String> nama = ['Rafi', 'Loyi'];
  List<String> handphone = ['0895418403700', '085424531342'];
  List<String> email = ['rafi@gmail.com', 'loyi@gmail.com'];
  List<String> pin = ['123456', '345678'];
  List<String> nomoratm = ['1234567', '7654321'];
  List<int> saldo = [100000, 20000000];

  void register({
    String? nama,
    String? handphone,
    String? email,
    String? pin,
    String? nomoratm,
    int? saldo,
  }) {
    if (nama != null) this.nama.add(nama);
    if (handphone != null) this.handphone.add(handphone);
    if (email != null) this.email.add(email);
    if (pin != null) this.pin.add(pin);
    if (nomoratm != null) this.nomoratm.add(nomoratm);
    if (saldo != null) this.saldo.add(saldo);
  }

  //
  List<Map<String, dynamic>> getDataList() {
    List<Map<String, dynamic>> data = [];

    for (int i = 0; i < nomoratm.length; i++) {
      String currentNama = nama[i];
      String currentHandphone = handphone[i];
      String currentEmail = email[i];
      String currentPin = pin[i];
      String currentNomorAtm = nomoratm[i];
      int currentSaldo = saldo[i];

      Map<String, dynamic> item = {
        'Nama': currentNama,
        'Handphone': currentHandphone,
        'Email': currentEmail,
        'PIN': currentPin,
        'Saldo': currentSaldo,
      };

      Map<String, dynamic> dataItem = {
        currentNomorAtm: item,
      };

      data.add(dataItem);
    }

    return data;
  }

  //information account
  Map<String, dynamic> saveAccountInfo(
      Map<String, dynamic> accountData, String nomoratm) {
    // Menyiapkan informasi akun dalam bentuk Map
    Map<String, dynamic> accountInfo = {
      'Nomor ATM': nomoratm,
      'Handphone': accountData['Handphone'],
      'Nama': accountData['Nama'],
      'Email': accountData['Email'],
      'PIN': accountData['PIN'],
      'Saldo': accountData['Saldo'],
    };

    // Lakukan operasi lain yang Anda inginkan dengan informasi akun ini
    return accountInfo;
  }

  Map<String, dynamic> updateAccountInfo(
      int saldo, Map<String, dynamic> updatedAccountInfo) {
    Map<String, dynamic> accountInfo = {
      'Nomor ATM': updatedAccountInfo['Nomor ATM'],
      'Handphone': updatedAccountInfo['Handphone'],
      'Nama': updatedAccountInfo['Nama'],
      'Email': updatedAccountInfo['Email'],
      'PIN': updatedAccountInfo['PIN'],
      'Saldo': saldo,
    };
    return accountInfo;

    // for (int i = 0; i < nomoratm.length; i++) {
    //   if (nomoratm[i] == nomorAtm) {
    //     nama[i] = updatedAccountInfo['Nama'];
    //     handphone[i] = updatedAccountInfo['Handphone'];
    //     email[i] = updatedAccountInfo['Email'];
    //     pin[i] = updatedAccountInfo['PIN'];
    //     nomoratm[i] = nomorAtm;
    //     saldo[i] = updatedAccountInfo['Saldo'];
    //     break;
    //   }
    // }

    // // print('Informasi akun berhasil diperbarui.');
    // return
  }
}
