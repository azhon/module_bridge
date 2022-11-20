library message_module;

import 'package:message_module/generated/bridge/message_module_bridge.dart';
import 'package:module_bridge/core/bridge_manager.dart';

class MessageModule {
  void init() {
    BridgeManager.instance.register(MessageModuleBridge().bridges);
  }
}
