// ignore_for_file: avoid_dynamic_calls

import 'package:module_bridge/bean/r.dart';
import 'package:module_bridge/bean/r_code.dart';

/// createTime: 2022/11/19 on 12:41
/// desc:
///
/// @author azhon
class BridgeManager {
  static BridgeManager? _instance;

  static BridgeManager get instance => _getInstance();

  static BridgeManager _getInstance() {
    _instance ??= BridgeManager();
    return _instance!;
  }

  final Map<String, Function> _allBridges = {};

  ///register all modules bridges
  void register(Map<String, Function> bridges) {
    _allBridges.addAll(bridges);
  }

  ///remove one of bridges
  bool unregister(String url) {
    if (exist(url)) {
      _allBridges.remove(url);
      return true;
    }
    return false;
  }

  ///check has bridge(url)
  bool exist(String url) {
    return _allBridges.containsKey(url);
  }

  ///get response by [url]
  Future<R> get(String url) async {
    final uri = Uri.parse(url);
    if (!exist(uri.path)) {
      return R.error(code: RCode.notFound, msg: '$url not found!');
    }
    return _allBridges[uri.path]!.call(uri.queryParameters);
  }
}
