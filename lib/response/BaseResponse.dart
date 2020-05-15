import 'package:json_annotation/json_annotation.dart';

/// data : []
/// errorCode : 0
/// errorMsg : ""
@JsonSerializable(nullable: false)
class BaseResponse {

  List<dynamic> data;
  int errorCode;
  String errorMsg;

  BaseResponse({this.data, this.errorCode, this.errorMsg});

//不同的类使用不同的mixin即可
  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

}
