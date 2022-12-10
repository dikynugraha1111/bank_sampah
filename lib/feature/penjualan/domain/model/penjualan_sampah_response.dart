import 'dart:convert';

class BankSampahResponse {
  BankSampahResponse({
    required this.success,
    required this.bankIncome,
  });

  final bool success;
  final List<BankIncome> bankIncome;

  factory BankSampahResponse.fromJson(String str) =>
      BankSampahResponse.fromMap(json.decode(str));

  factory BankSampahResponse.fromMap(Map<String, dynamic> json) =>
      BankSampahResponse(
        success: json["success"],
        bankIncome: List<BankIncome>.from(
            json["bankIncome"].map((x) => BankIncome.fromMap(x))),
      );
}

class BankIncome {
  BankIncome({
    required this.id,
    required this.pendapatan,
    required this.catatanPembelian,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.idUser,
    required this.idSampah,
  });

  final int id;
  final String pendapatan;
  final String catatanPembelian;
  final dynamic deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String idUser;
  final String? idSampah;

  factory BankIncome.fromJson(String str) =>
      BankIncome.fromMap(json.decode(str));

  factory BankIncome.fromMap(Map<String, dynamic> json) => BankIncome(
        id: json["id"],
        pendapatan: json["pendapatan"],
        catatanPembelian: json["catatan"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        idUser: json["id_user"],
        idSampah: json["id_sampah"],
      );
}
