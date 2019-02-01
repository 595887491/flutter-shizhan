
import 'package:json_annotation/json_annotation.dart';

part 'Unfinishorder.g.dart';

@JsonSerializable()
class Unfinishorder {
  Unfinishorder(this.id,this.originalMoney,this.realMoney,this.startAt,this.endAt,this.duringTime,this.plateNumber,this.areaName,this.streetName,this.createdAt,this.lotName,this.placeNum);
  String id; //1
  int originalMoney;
  int realMoney;
  String startAt;
  String endAt;
  int duringTime;
  String plateNumber;
  String areaName;
  String streetName;
  String lotName;
  String createdAt;
  String placeNum;

  factory Unfinishorder.fromJson(Map<String, dynamic> json) => _$UnfinishorderFromJson(json);


  Map<String, dynamic> toJson() => _$UnfinishorderToJson(this);

  // 命名构造函数
  Unfinishorder.empty();

}
