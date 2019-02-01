// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Unfinishorder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Unfinishorder _$UnfinishorderFromJson(Map<String, dynamic> json) {
  return Unfinishorder(
      json['id'] as String,
      json['originalMoney'] as int,
      json['realMoney'] as int,
      json['startAt'] as String,
      json['endAt'] as String,
      json['duringTime'] as int,
      json['plateNumber'] as String,
      json['areaName'] as String,
      json['streetName'] as String,
      json['createdAt'] as String,
      json['lotName'] as String,
      json['placeNum'] as String,
  );
}

Map<String, dynamic> _$UnfinishorderToJson(Unfinishorder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'originalMoney': instance.originalMoney,
      'realMoney': instance.realMoney,
      'startAt': instance.startAt,
      'endAt': instance.endAt,
      'duringTime': instance.duringTime,
      'plateNumber': instance.plateNumber,
      'areaName': instance.areaName,
      'streetName': instance.streetName,
      'lotName': instance.lotName,
      'createdAt': instance.createdAt,
      'placeNum': instance.placeNum
    };
