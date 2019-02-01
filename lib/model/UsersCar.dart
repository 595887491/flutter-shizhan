import 'package:json_annotation/json_annotation.dart';


part 'UsersCar.g.dart';


@JsonSerializable()
class UsersCar{

  UsersCar(this.carId,this.plateNumber,this.carType,this.carOwner);

  String carId;
  String plateNumber;
  Map carType;
  bool carOwner;
  factory UsersCar.fromJson(Map<String, dynamic> json) => _$UsersCarFromJson(json);

  Map<String, dynamic> toJson() => _$UsersCarToJson(this);

  // 命名构造函数
  UsersCar.empty();

}