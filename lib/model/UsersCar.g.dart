// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UsersCar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersCar _$UsersCarFromJson(Map<String, dynamic> json) {
  return UsersCar(json['carId'] as String, json['plateNumber'] as String,
      json['carType'] as Map<String, dynamic>, json['carOwner'] as bool);
}

Map<String, dynamic> _$UsersCarToJson(UsersCar instance) => <String, dynamic>{
      'carId': instance.carId,
      'plateNumber': instance.plateNumber,
      'carType': instance.carType,
      'carOwner': instance.carOwner
    };
