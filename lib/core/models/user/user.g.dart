// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as String?,
      firstname: fields[1] as String?,
      lastname: fields[2] as String?,
      password: fields[3] as String?,
      token: fields[4] as String?,
      loginUsername: fields[5] as String?,
      profileImage: fields[6] as String?,
      refreshToken: fields[7] as String?,
      phoneCode: fields[8] as String?,
      birthDate: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstname)
      ..writeByte(2)
      ..write(obj.lastname)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.token)
      ..writeByte(5)
      ..write(obj.loginUsername)
      ..writeByte(6)
      ..write(obj.profileImage)
      ..writeByte(7)
      ..write(obj.refreshToken)
      ..writeByte(8)
      ..write(obj.phoneCode)
      ..writeByte(9)
      ..write(obj.birthDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String?,
      bvn: json['bvn'] as String?,
      nin: json['nin'] as String?,
      emailAddress: json['emailAddress'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      othernames: json['othernames'] as String?,
      gender: json['gender'] as String?,
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      city: json['city'] as String?,
      regionId: json['regionId'] as String?,
      stateId: json['stateId'] as String?,
      status: json['status'] as String?,
      dateCreated: json['dateCreated'] as String?,
      dateUpdated: json['dateUpdated'] as String?,
      createdBy: json['createdBy'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      password: json['password'] as String?,
      token: json['token'] as String?,
      loginUsername: json['loginUsername'] as String?,
      profileImage: json['profileImage'] as String?,
      refreshToken: json['refreshToken'] as String?,
      phoneCode: json['phoneCode'] as String?,
      birthDate: json['birthDate'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bvn': instance.bvn,
      'nin': instance.nin,
      'emailAddress': instance.emailAddress,
      'phoneNumber': instance.phoneNumber,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'othernames': instance.othernames,
      'gender': instance.gender,
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'regionId': instance.regionId,
      'stateId': instance.stateId,
      'status': instance.status,
      'dateCreated': instance.dateCreated,
      'dateUpdated': instance.dateUpdated,
      'createdBy': instance.createdBy,
      'modifiedBy': instance.modifiedBy,
      'password': instance.password,
      'token': instance.token,
      'loginUsername': instance.loginUsername,
      'profileImage': instance.profileImage,
      'refreshToken': instance.refreshToken,
      'phoneCode': instance.phoneCode,
      'birthDate': instance.birthDate,
    };
