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
      'avatar': avatar,
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
      avatar: map['avatar'],
      benhvien: map['benhvien'] ,
      cccd: map['cccd'],
      chuyenmon: map['chuyenmon'] != null ? map['chuyenmon'] as String : null,
      diachi: map['diachi'] != null ? map['diachi'] as String : null,
      gioitinh: map['gioitinh'] != null ? map['gioitinh'] as String : null,
      khoa: map['khoa'] != null ? map['khoa'] as String : null,
      mota: map['mota'] != null ? map['mota'] as String : null,
      ngaysinh: map['ngaysinh'] != null ? map['ngaysinh'] as String : null,
      sdt: map['sdt'] != null ? map['sdt'] as String : null,
      sonamkinhnghiem: map['sonamkinhnghiem'] != null ? map['sonamkinhnghiem'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctor.fromJson(String source) => Doctor.fromMap(json.decode(source) as Map<String, dynamic>);
}
