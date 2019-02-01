// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Record _$RecordFromJson(Map<String, dynamic> json) {
  return Record(json['id'] as String, json['createdAt'] as String,
      json['topUpNum'] as int, json['status'] as Map);
}

Map<String, dynamic> _$RecordToJson(Record instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'topUpNum': instance.topUpNum,
      'status': instance.status
    };
