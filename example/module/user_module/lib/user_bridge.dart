import 'dart:math';

import 'package:module_bridge/module_bridge.dart';

class UserBridge with Bridge {
  @Url(url: '/user/getUserId')
  Future<R> getUserId(Map<String, String> params) async {
    return R.ok(data: Random().nextInt(9999));
  }
}
