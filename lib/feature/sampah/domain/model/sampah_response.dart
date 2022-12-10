import 'dart:convert';

class SampahItemResponse {
  SampahItemResponse({
    required this.success,
    required this.showBankItem,
  });

  final bool success;
  final List<ShowBankItem> showBankItem;

  factory SampahItemResponse.fromJson(String str) =>
      SampahItemResponse.fromMap(json.decode(str));

  factory SampahItemResponse.fromMap(Map<String, dynamic> json) =>
      SampahItemResponse(
        success: json["success"],
        showBankItem: List<ShowBankItem>.from(
            json["showBankItem"].map((x) => ShowBankItem.fromMap(x))),
      );
}

class ShowBankItem {
  ShowBankItem({
    required this.id,
    required this.nama,
    required this.hargaKg,
    required this.deskripsi,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String nama;
  final String hargaKg;
  final String deskripsi;
  final dynamic deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory ShowBankItem.fromJson(String str) =>
      ShowBankItem.fromMap(json.decode(str));

  factory ShowBankItem.fromMap(Map<String, dynamic> json) => ShowBankItem(
        id: json["id"],
        nama: json["nama"],
        hargaKg: json["harga_kg"],
        deskripsi: json["deskripsi"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
