import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:tezda/core/utils/type_id.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@HiveType(typeId: TypeId.user, adapterName: 'UserAdapter')
@freezed
class User with _$User {
  const factory User({
    @HiveField(0) String? id,
    String? bvn,
    String? nin,
    String? emailAddress,
    String? phoneNumber,
    @HiveField(1) String? firstname,
    @HiveField(2) String? lastname,
    String? othernames,
    String? gender,
    String? address1,
    String? address2,
    String? city,
    String? regionId,
    String? stateId,
    String? status,
    String? dateCreated,
    String? dateUpdated,
    String? createdBy,
    String? modifiedBy,
    @HiveField(3) String? password,
    @HiveField(4) String? token,
    @HiveField(5) String? loginUsername,
    @HiveField(6) String? profileImage,
    @HiveField(7) String? refreshToken,
    @HiveField(8) String? phoneCode,
    @HiveField(9) String? birthDate,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
