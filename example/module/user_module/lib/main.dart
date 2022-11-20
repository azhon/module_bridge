library user_module;

import 'package:module_bridge/core/bridge_manager.dart';
import 'package:user_module/generated/bridge/user_module_bridge.dart';

class UserModule {
  void init() {
    BridgeManager.instance.register(UserModuleBridge().bridges);
  }
}
