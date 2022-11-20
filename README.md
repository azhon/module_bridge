## [Chinese Doc](https://github.com/azhon/module_bridge/blob/main/README-zh.md)

## Dart modular development event communication library.

### Step1

1.Install [FlutterModuleBridge](https://plugins.jetbrains.com/plugin/20491-fluttermodulebridge) plugin.

2.Add dependencies

```
dependencies:
    module_bridge: ^latest_version
```

### Step2
#### Create a communication template in the module `/lib` directory

```
import 'package:module_bridge/module_bridge.dart';

class UserBridge with Bridge {

   @Url(url: '/user/getUserId', desc: 'Get UserId')
   R getUserId() {
     return R.ok(data: 1234);
   }

   @Url(url: '/user/getUserName', desc: 'Get user name')
   Future<R> getUserName() async {
     return R.ok(data: 'azhon');
   }
}
```
⚠️Notice
- A dart file can only have one class
- The class must be `with Bridge`
- The method must be annotated with `@Url`
- The return value of the method must be `R` or `Future<R>` type

### Step3

1.Use `FlutterModuleBridge` plugin generate class

2.Register events when initializing the modules

```
BridgeManager.instance.register(UserModuleBridge().bridges);
```

### Step4
In any module communicate through the following code

```
var r = await BridgeManager.instance.get('/user/getUserId');
```
