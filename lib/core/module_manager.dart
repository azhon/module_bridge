import 'dart:collection';

import 'package:flutter/material.dart';

/// createTime: 2023/4/14 on 10:14
/// desc:
///
/// @author azhon
class ModuleManager {
  static final Set<BaseModule> _moduleSet = HashSet();

  ///加入模块
  static void add(BaseModule module) {
    if (_moduleSet.contains(module)) {
      debugPrint('$module is already added.');
      return;
    }
    _moduleSet.add(module);
    module.register();
  }

  ///获取模块
  static T? get<T extends BaseModule>() {
    final key = T.toString();
    final result = _moduleSet
        .where((element) => element.runtimeType.toString() == key)
        .toList();
    return result.isEmpty ? null : result.first as T;
  }

  ///移除模块
  static bool remove(BaseModule module) {
    module.unregister();
    return _moduleSet.remove(module);
  }

  ///移除所有模块
  static void clear() {
    _moduleSet.forEach((element) {
      element.unregister();
    });
    _moduleSet.clear();
  }
}

abstract class BaseModule {
  void register();

  void unregister();
}
