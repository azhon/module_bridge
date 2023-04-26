import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:module_bridge/module_bridge.dart';

class MessageBridge with Bridge {
  @Url(url: '/message/messageCount', desc: 'return msg count')
  Future<R<String>> getMessageCount(Map<String, String> params) async {
    return R.ok(data: '${Random().nextInt(888)}');
  }

  @Url(url: '/message/update', desc: '')
  R updateMessage(Map<String, String> params) {
    debugPrint('receive update message request.');
    return R.ok();
  }
}
