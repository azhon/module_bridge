## Dart 模块化开发事件通信库

<p align="center"><img src="https://github.com/azhon/module_bridge/blob/main/img/logo.png"></p>


### Step1

安装 [FlutterModuleBridge](https://plugins.jetbrains.com/plugin/20491-fluttermodulebridge) 插件.


2.添加依赖 [latest_version](https://pub.dev/packages/module_bridge)

```
dependencies:
    module_bridge: ^latest_version
```

### Step2
#### 在`/lib`目录下创建通信模板

```java
import 'package:module_bridge/module_bridge.dart';

class UserBridge with Bridge {

   @Url(url: '/user/getUserId', desc: '获取用户Id')
   R getUserId(Map<String, String> params) {
     return R.ok(data: 1234);
   }

   @Url(url: '/user/getUserName', desc: '获取用户名称')
   Future<R> getUserName(Map<String, String> params) async {
     return R.ok(data: 'azhon');
   }
}
```
⚠️注意
- 一个dart文件只能有一个class
- class必须`with Bridge`
- 方法必须使用`@Url`注解
- 方法参数必须是`Map<String, String>`，返回值必须是`R`或者`Future<R>`类型

### Step3

1.使用 `FlutterModuleBridge` 插件生成类

2.初始化模块的时候注册事件

```java
BridgeManager.instance.register(UserModuleBridge().bridges);
```

### Step4
在任何模块中通过如下方式进行通信

```java
var r = await BridgeManager.instance.get('/user/getUserId');
```
