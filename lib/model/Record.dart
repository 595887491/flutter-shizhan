
import 'package:json_annotation/json_annotation.dart';

part 'Record.g.dart';

@JsonSerializable()
class Record {
  Record(this.id,this.createdAt,this.topUpNum,this.status);
  String id; //1
  String createdAt;
  int topUpNum;
  Map status;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);


  Map<String, dynamic> toJson() => _$RecordToJson(this);

  // 命名构造函数
  Record.empty();

}
