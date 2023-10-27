## Dart 模块化开发事件通信库

<p align="center"><img src="https://github.com/azhon/module_bridge/raw/main/img/logo.png"></p>


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
   Future<R<int>> getUserId(Map<String, String> params) {
     return R.ok(data: 1234);
   }

   @Url(url: '/user/getUserName', desc: '获取用户名称')
   Future<R<String>> getUserName(Map<String, String> params) async {
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

2.在子模块创建Module并在`register`回调内注册事件

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
3.在主项目中初始化子模块

```java
ModuleManager.add(UserModule());
```

### Step4
- 在任何模块中通过如下方式进行通信

```java
var r = await BridgeManager.instance.get<int>('/user/getUserId');
```
- 或者在`build`函数中使用

```java
BridgeBuilder<int>(
  bridge: '/user/getUserId',
  builder: (_, data) {
    /// data有可能为空
    return Text('通过BridgeBuilder获取数据：$data');
  },
),
```