import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@HiveType(typeId: 0)
enum BulletinType {
  @HiveField(0)
  student,

  @HiveField(1)
  mentor,

  @HiveField(2)
  book
}

@JsonSerializable()
@HiveType(typeId: 1)
class BulletinHiveObject extends HiveObject {
  @HiveField(0)
  UserHiveObject user;
  @HiveField(1)
  String title;
  @HiveField(2)
  String additional;
  @HiveField(3)
  String content;
  @HiveField(4)
  BulletinType type;
  @HiveField(7)
  DateTime createdTme;

  BulletinHiveObject(
      {this.user,
      this.title,
      this.additional,
      this.content,
      this.type,
      this.createdTme});

  factory BulletinHiveObject.fromJson(Map<String, dynamic> json) =>
      _$BulletinHiveObjectFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 2)
class UserHiveObject extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String mail;
  @HiveField(2)
  int age;
  @HiveField(3)
  String bio;
  @HiveField(4)
  String phone;
  @HiveField(5)
  String city;
  @HiveField(6)
  List<BulletinHiveObject> bulletins;
  @HiveField(7)
  DateTime createdTme;

  UserHiveObject(
      {this.name,
      this.mail,
      this.age,
      this.bio,
      this.phone,
      this.city,
      this.bulletins,
      this.createdTme});

  factory UserHiveObject.fromJson(Map<String, dynamic> json) =>
      _$UserHiveObjectFromJson(json);
}
