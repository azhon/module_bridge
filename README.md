## [Chinese Doc](https://github.com/azhon/module_bridge/blob/main/README-zh.md)

## Dart modular development event communication library.

<p align="center"><img src="https://github.com/azhon/module_bridge/raw/main/img/logo.png"></p>

### Step1

1.Install [FlutterModuleBridge](https://plugins.jetbrains.com/plugin/20491-fluttermodulebridge) plugin.

2.Add dependencies [latest_version](https://pub.dev/packages/module_bridge)

```java
dependencies:
    module_bridge: ^latest_version
```

### Step2
#### Create a communication template in the module `/lib` directory

```java
import 'package:module_bridge/module_bridge.dart';

class UserBridge with Bridge {

   @Url(url: '/user/getUserId', desc: 'Get UserId')
   Future<R<int>> getUserId(Map<String, String> params) {
     return R.ok(data: 1234);
   }

   @Url(url: '/user/getUserName', desc: 'Get user name')
   Future<R<String>> getUserName(Map<String, String> params) async {
     return R.ok(data: 'azhon');
   }
}
```
⚠️Notice
- A dart file can only have one class
- The class must be `with Bridge`
- The method must be annotated with `@Url`
- The method parameter must be `Map<String, String>`, and the return value must be `R` or `Future<R>` type

### Step3

1.Use `FlutterModuleBridge` plugin generate class

2.Create a Module in a submodule and register events in the `register()`

```java
class UserModule extends BaseModule {
  @override
  void register() {
    BridgeManager.instance.register(UserModuleBridge().bridges);
  }

  @override
  void unregister() {}
}
```
3.Initialize the submodules in the main module

```java
ModuleManager.add(UserModule());
```

### Step4
- In any module communicate through the following code

```java
var r = await BridgeManager.instance.get<int>('/user/getUserId');
```
- Or use in `build` method

```java
BridgeBuilder<int>(
  bridge: '/user/getUserId',
  builder: (_, data) {
    /// data maybe equal null
    return Text('use BridgeBuilder get data：$data');
  },
),
```