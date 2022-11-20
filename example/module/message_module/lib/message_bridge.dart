import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:module_bridge/module_bridge.dart';

class MessageBridge with Bridge {
  @Url(url: '/message/messageCount', desc: 'return msg count')
  Future<R> getMessageCount() async {
    return R.ok(data: '${Random().nextInt(888)}');
  }

  @Url(url: '/message/update', desc: '')
  R updateMessage() {
    debugPrint('receive update message request.');
    return R.ok();
  }
}
