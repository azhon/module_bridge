/// createTime: 2022/11/19 on 22:40
/// desc:
///
/// @author azhon
import 'package:flutter/material.dart';
import 'package:module_bridge/core/bridge_manager.dart';
import 'package:module_bridge/module_bridge.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  int? userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MessageModulePage'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _button(
              'get userId',
              () async {
                var r =
                    await BridgeManager.instance.get<int>('/user/getUserId');
                setState(() {
                  userId = r.data;
                });
              },
            ),
            Text('userId：$userId'),
            const SizedBox(height: 20),

            ///通过BridgeBuilder获取数据控制UI
            BridgeBuilder<int>(
              bridge: '/user/getUserId',
              builder: (_, data) {
                return Text('通过BridgeBuilder获取数据：$data');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _button(String text, VoidCallback press) {
    return TextButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.blue),
        padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 20, horizontal: 16)),
      ),
      onPressed: press,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
