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
    this.cccd,
    this.chuyenmon,
    this.diachi,
    this.gioitinh,
    this.khoa,
    this.mota,
    this.ngaysinh,
    this.sdt,
    this.sonamkinhnghiem,
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
      id: map['id'] != null ? map['id'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      benhvien: map['benhvien'] != null ? map['benhvien'] as String : null,
      cccd: map['cccd'] != null ? map['cccd'] as String : null,
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
