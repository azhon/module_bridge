library message_module;

import 'package:message_module/generated/bridge/message_module_bridge.dart';
import 'package:module_bridge/core/bridge_manager.dart';
import 'package:module_bridge/core/module_manager.dart';

class MessageModule extends BaseModule {
  @override
  void register() {
    BridgeManager.instance.register(MessageModuleBridge().bridges);
  }

  @override
  void unregister() {}
}
