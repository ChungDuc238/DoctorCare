import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DatLichModel {
  final String? uidBacSi;
  final String? uidNguoiKham;
  final String? tenNguoiKham;
  final String? tenPhongKham;
  final String? tenBS;
  final String? thoigian;
  final String? ngay;
  final String? idLichKham;
  DatLichModel({
    this.uidBacSi,
    this.uidNguoiKham,
    this.tenNguoiKham,
    this.tenPhongKham,
    this.tenBS,
    this.thoigian,
    this.ngay,
    this.idLichKham,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uidBacSi': uidBacSi,
      'uidNguoiKham': uidNguoiKham,
      'tenNguoiKham': tenNguoiKham,
      'tenPhongKham': tenPhongKham,
      'tenBS': tenBS,
      'thoigian': thoigian,
      'ngay': ngay,
      
    };
  }

  factory DatLichModel.fromMap(Map<String, dynamic> map) {
    return DatLichModel(
      uidBacSi: map['uidBacSi'],
      uidNguoiKham: map['uidNguoiKham'],
      tenNguoiKham: map['tenNguoiKham'],
      tenPhongKham: map['tenPhongKham'],
      tenBS: map['tenBS'],
      thoigian: map['thoigian'],
      ngay: map['ngay'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DatLichModel.fromJson(String source) =>
      DatLichModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
