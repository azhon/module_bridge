/// createTime: 2022/11/19 on 22:40
/// desc:
///
/// @author azhon
import 'package:flutter/material.dart';
import 'package:module_bridge/core/bridge_manager.dart';

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
                var r = await BridgeManager.instance.get('/user/getUserId');
                setState(() {
                  userId = r.data;
                });
              },
            ),
            Text('userId：$userId'),
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
