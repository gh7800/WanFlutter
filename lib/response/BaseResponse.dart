/// data : []
/// errorCode : 0
/// errorMsg : ""

class BaseResponse {
  List<dynamic> data;
  int errorCode;
  String errorMsg;

  static BaseResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    BaseResponse baseResponseBean = BaseResponse();
    baseResponseBean.data = map['data'];
    baseResponseBean.errorCode = map['errorCode'];
    baseResponseBean.errorMsg = map['errorMsg'];
    return baseResponseBean;
  }

  Map toJson() => {
    "data": data,
    "errorCode": errorCode,
    "errorMsg": errorMsg,
  };
}