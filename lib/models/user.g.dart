// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['id'] as num
    ..username = json['username'] as String
    ..email = json['email'] as String
    ..qrCodeUrl = json['qrCodeUrl'] as String
    ..avatarUrl = json['avatarUrl'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'qrCodeUrl': instance.qrCodeUrl,
      'avatarUrl': instance.avatarUrl
    };
