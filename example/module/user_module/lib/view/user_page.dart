/// createTime: 2022/11/19 on 22:40
/// desc:
///
/// @author azhon
import 'package:flutter/material.dart';
import 'package:module_bridge/module_bridge.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String? messageCount;
  R? updateMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserModulePage'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _button(
              'get messageCount',
              () async {
                var r = await BridgeManager.instance
                    .get<String>('/message/messageCount');
                setState(() {
                  messageCount = r.data;
                });
              },
            ),
            Text('messageCount：$messageCount'),
            const SizedBox(height: 16),
            _button(
              'update message',
              () async {
                var r = await BridgeManager.instance
                    .get('/message/update?name=azhon&id=324');
                setState(() {
                  updateMessage = r;
                });
              },
            ),
            Text('update message result：${updateMessage?.toJson()}'),
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
