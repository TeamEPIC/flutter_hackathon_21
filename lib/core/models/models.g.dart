// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BulletinTypeAdapter extends TypeAdapter<BulletinType> {
  @override
  final int typeId = 0;

  @override
  BulletinType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BulletinType.student;
      case 1:
        return BulletinType.mentor;
      case 2:
        return BulletinType.book;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, BulletinType obj) {
    switch (obj) {
      case BulletinType.student:
        writer.writeByte(0);
        break;
      case BulletinType.mentor:
        writer.writeByte(1);
        break;
      case BulletinType.book:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BulletinTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BulletinHiveObjectAdapter extends TypeAdapter<BulletinHiveObject> {
  @override
  final int typeId = 1;

  @override
  BulletinHiveObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BulletinHiveObject(
      fields[0] as UserHiveObject,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as BulletinType,
    );
  }

  @override
  void write(BinaryWriter writer, BulletinHiveObject obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.user)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.additional)
      ..writeByte(3)
      ..write(obj.content)
      ..writeByte(4)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BulletinHiveObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserHiveObjectAdapter extends TypeAdapter<UserHiveObject> {
  @override
  final int typeId = 2;

  @override
  UserHiveObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserHiveObject(
      name: fields[0] as String,
      mail: fields[1] as String,
      age: fields[2] as int,
      bio: fields[3] as String,
      phone: fields[4] as String,
      city: fields[5] as String,
      bulletins: (fields[6] as List)?.cast<BulletinHiveObject>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserHiveObject obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.mail)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.bio)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.city)
      ..writeByte(6)
      ..write(obj.bulletins);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserHiveObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BulletinHiveObject _$BulletinHiveObjectFromJson(Map<String, dynamic> json) {
  return BulletinHiveObject(
    json['user'] == null
        ? null
        : UserHiveObject.fromJson(json['user'] as Map<String, dynamic>),
    json['title'] as String,
    json['additional'] as String,
    json['content'] as String,
    _$enumDecodeNullable(_$BulletinTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$BulletinHiveObjectToJson(BulletinHiveObject instance) =>
    <String, dynamic>{
      'user': instance.user,
      'title': instance.title,
      'additional': instance.additional,
      'content': instance.content,
      'type': _$BulletinTypeEnumMap[instance.type],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$BulletinTypeEnumMap = {
  BulletinType.student: 'student',
  BulletinType.mentor: 'mentor',
  BulletinType.book: 'book',
};

UserHiveObject _$UserHiveObjectFromJson(Map<String, dynamic> json) {
  return UserHiveObject(
    name: json['name'] as String,
    mail: json['mail'] as String,
    age: json['age'] as int,
    bio: json['bio'] as String,
    phone: json['phone'] as String,
    city: json['city'] as String,
    bulletins: (json['bulletins'] as List)
        ?.map((e) => e == null
            ? null
            : BulletinHiveObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserHiveObjectToJson(UserHiveObject instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mail': instance.mail,
      'age': instance.age,
      'bio': instance.bio,
      'phone': instance.phone,
      'city': instance.city,
      'bulletins': instance.bulletins,
    };
