library user_module;

import 'package:module_bridge/core/bridge_manager.dart';
import 'package:module_bridge/core/module_manager.dart';
import 'package:user_module/generated/bridge/user_module_bridge.dart';

class UserModule extends BaseModule {
  @override
  void register() {
    BridgeManager.instance.register(UserModuleBridge().bridges);
  }

  @override
  void unregister() {}
}
