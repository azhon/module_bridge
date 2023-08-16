import 'package:flutter/material.dart';
import 'package:module_bridge/bean/r.dart';
import 'package:module_bridge/core/bridge_manager.dart';

/// createTime: 2023/8/16 on 10:48
/// desc:
///
/// @author azhon
typedef BridgeWidgetBuilder<T> = Widget Function(BuildContext context, T? data);

class BridgeBuilder<T> extends StatelessWidget {
  final String bridge;
  final T? initialData;
  final BridgeWidgetBuilder builder;

  const BridgeBuilder({
    required this.bridge,
    required this.builder,
    super.key,
    this.initialData,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<R<T>>(
      future: BridgeManager.instance.get<T>(bridge),
      initialData: R.ok(data: initialData),
      builder: (context, snapshot) {
        return builder.call(context, snapshot.data?.data);
      },
    );
  }
}
