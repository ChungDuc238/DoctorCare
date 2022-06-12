import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Doctor {
  final String? id;
  final String? email;
  final String? password;
  final String? avatar;
  final String? benhvien;
  final String? cccd;
  final String? chuyenmon;
  final String? diachi;
  final String? gioitinh;
  final String? khoa;
  final String? mota;
  final String? ngaysinh;
  final String? sdt;
  final String? sonamkinhnghiem;
  Doctor({
   required this.id,
   required this.email,
   required this.password,
   required this.avatar,
   required this.benhvien,
   required this.cccd,
   required this.chuyenmon,
  required  this.diachi,
   required this.gioitinh,
  required  this.khoa,
   required this.mota,
   required this.ngaysinh,
   required this.sdt,
   required this.sonamkinhnghiem,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'password': password,
      'anhDaiDien': avatar,
      'benhvien': benhvien,
      'cccd': cccd,
      'chuyenmon': chuyenmon,
      'diachi': diachi,
      'gioitinh': gioitinh,
      'khoa': khoa,
      'mota': mota,
      'ngaysinh': ngaysinh,
      'sdt': sdt,
      'sonamkinhnghiem': sonamkinhnghiem,
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      id: map['id'],
      email: map['email'] ,
      password: map['password'],
      avatar: map['anhDaiDien'],
      benhvien: map['benhvien'] ,
      cccd: map['cccd'],
      chuyenmon: map['chuyenmon'],
      diachi: map['diachi'],
      gioitinh: map['gioitinh'],
      khoa: map['khoa'],
      mota: map['mota'],
      ngaysinh: map['ngaysinh'],
      sdt: map['sdt'],
      sonamkinhnghiem: map['sonamkinhnghiem'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctor.fromJson(String source) => Doctor.fromMap(json.decode(source) as Map<String, dynamic>);
}
