import 'package:module_bridge/bean/r_code.dart';

/// createTime: 2022/11/18 on 21:10
/// desc:
///
/// @author azhon
class R {
  final int code;
  final String msg;
  final dynamic data;

  ///[data] only support [String,num,bool,Map]
  R.ok({this.code = RCode.ok, this.msg = 'ok', this.data}) {
    _check(data);
  }

  ///[data] only support [String,num,bool,Map]
  R.error({this.code = RCode.error, this.msg = 'error', this.data}) {
    _check(data);
  }

  ///only support[String],[num],[bool],[Map]
  void _check(data) {
    if (data == null ||
        data is String ||
        data is num ||
        data is bool ||
        data is Map) {
      return;
    }
    throw Exception('Error: ${data.runtimeType} not supported! '
        'only support [String,num,bool,Map].');
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'msg': msg,
      'data': data,
    };
  }
}
