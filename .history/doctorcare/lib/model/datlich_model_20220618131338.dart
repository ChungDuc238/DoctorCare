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
  DatLichModel({
    this.uidBacSi,
    this.uidNguoiKham,
    this.tenNguoiKham,
    this.tenPhongKham,
    this.tenBS,
    this.thoigian,
    this.ngay,
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
      tenPhongKham: map['tenPhongKham'] != null ? map['tenPhongKham'] as String : null,
      tenBS: map['tenBS'] != null ? map['tenBS'] as String : null,
      thoigian: map['thoigian'] != null ? map['thoigian'] as String : null,
      ngay: map['ngay'] != null ? map['ngay'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DatLichModel.fromJson(String source) => DatLichModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
