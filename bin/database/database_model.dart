class DatabaseModel {
  List<String> nama = ['Rafi', 'Loyi'];
  List<String> handphone = ['0895418403700', '085424531342'];
  List<String> email = ['rafi@gmail.com', 'loyi@gmail.com'];
  List<String> pin = ['1', '345678'];
  List<String> nomoratm = ['1', '2'];
  List<int> saldo = [10000, 1000];

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
        'Nomor Atm': currentNomorAtm,
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
  }

  //update list data ketika mengirim uang sesama bank
  List<Map<String, dynamic>> updateData(
      String? sendPenerimaNmratm,
      int? sendmoney,
      String? sendPengirimNmratm,
      List<Map<String, dynamic>>? data) {
    // Mengubah nilai nullable ke non-nullable
    String nonNullablePenerima = sendPenerimaNmratm ?? '0';
    int nonNullableInt = sendmoney ?? 0;
    String nonNullablePengirim = sendPengirimNmratm ?? '0';

    bool penerimaDitemukan = false;
    bool pengirimDitemukan = false;

    // Memeriksa dan memperbarui saldo pengirim
    for (var map in data!) {
      if (map.containsKey(nonNullablePengirim)) {
        if (map[nonNullablePengirim]!['Saldo'] >= nonNullableInt) {
          map[nonNullablePengirim]!['Saldo'] -= nonNullableInt;
          pengirimDitemukan = true;
        } else {
          print('Saldo pengirim tidak mencukupi.');
          return data;
        }
        break;
      }
    }

    // Memeriksa dan memperbarui saldo penerima
    for (var map in data) {
      if (map.containsKey(nonNullablePenerima)) {
        map[nonNullablePenerima]!['Saldo'] += nonNullableInt;
        penerimaDitemukan = true;
        break;
      }
    }

    if (!pengirimDitemukan) {
      print('Nomor ATM pengirim tidak ditemukan.');
    }
    if (!penerimaDitemukan) {
      print('Nomor ATM penerima tidak ditemukan.');
    }

    return data;
  }

  ///update data list untuk krim uang bank lain
  List<Map<String, dynamic>> updateDataBankOther(int? sendmoney,
      String? sendPengirimNmratm, List<Map<String, dynamic>>? data) {
    int nonNullableInt = sendmoney ?? 0;
    String nonNullablePengirim = sendPengirimNmratm ?? '0';

    bool pengirimDitemukan = false;

    // Memeriksa dan memperbarui saldo pengirim
    for (var map in data!) {
      if (map.containsKey(nonNullablePengirim)) {
        if (map[nonNullablePengirim]!['Saldo'] >= nonNullableInt) {
          map[nonNullablePengirim]!['Saldo'] -= nonNullableInt;
          pengirimDitemukan = true;
        } else {
          print('Saldo pengirim tidak mencukupi.');
        }
        break;
      }
    }

    if (!pengirimDitemukan) {
      print('Nomor ATM pengirim tidak ditemukan.');
    }

    return data;
  }

  // String disini(
  //   String? sennmratm,
  //   int? sendmoney,
  // ) {
  //   //mengubah nilai nullable ke non-nullable
  //   String nonNullablePengirim = sennmratm ?? '0';
  //   int nonNullableInt = sendmoney ?? 0;
  //   print(nonNullableInt);
  //   return nonNullablePengirim;
  // }
  //update list data ketika mengirim uang bank lain
  // List<Map<String, dynamic>> updateDataBankOther(String? sendPengirimNmratm,
  //     int? sendmoney, List<Map<String, dynamic>>? data) {
  //   // Mengubah nilai nullable ke non-nullable
  //   String nonNullablePengirim = sendPengirimNmratm ?? '0';
  //   int nonNullableInt = sendmoney ?? 0;

  //   bool pengirimDitemukan = false;

  //   // Memeriksa dan memperbarui saldo pengirim
  //   for (var map in data!) {
  //     if (map.containsKey(nonNullablePengirim)) {
  //       if (map[nonNullablePengirim]!['Saldo'] >= nonNullableInt) {
  //         map[nonNullablePengirim]!['Saldo'] -= nonNullableInt;
  //         pengirimDitemukan = true;
  //       } else {
  //         print('Saldo pengirim tidak mencukupi.');
  //         return data;
  //       }
  //       break;
  //     }
  //   }

  //   if (!pengirimDitemukan) {
  //     print('Nomor ATM pengirim tidak ditemukan.');
  //   }

  //   return data;
  // }

  // Fungsi untuk memperbarui saldo dengan mengurangi jumlah yang diberikan
  Map<String, dynamic> updateMinSaldo(
      Map<String, dynamic> data, int amountToSubtract) {
    if (data.containsKey('Saldo')) {
      if (data['Saldo'] >= amountToSubtract) {
        data['Saldo'] -= amountToSubtract;
      } else {
        print('Saldo tidak mencukupi untuk melakukan pengurangan.');
      }
    } else {
      print('Kunci "Saldo" tidak ditemukan.');
    }
    return data;
  }
}
