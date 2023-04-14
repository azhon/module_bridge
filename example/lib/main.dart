import 'package:flutter/material.dart';
import 'package:message_module/main.dart';
import 'package:message_module/view/message_page.dart';
import 'package:module_bridge/module_bridge.dart';
import 'package:user_module/view/user_page.dart';
import 'package:user_module/main.dart';

void main() {
  ///init submodule
  runApp(const MyApp());
  ModuleManager.add(MessageModule());
  ModuleManager.add(UserModule());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Module Bridge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Module Bridge'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _button(
              'go to MessageModule page',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MessagePage()),
                );
              },
            ),
            const SizedBox(height: 16),
            _button(
              'go to UserModule page',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const UserPage()),
                );
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
