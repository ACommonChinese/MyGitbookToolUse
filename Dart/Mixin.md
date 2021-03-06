# Mixin

Mixins可以通过普通的类声明隐式定义：

```dart
class Walker {
  void walk() {
    print("I'm walking");
  }
}
```

如果我们不想让我们创建的mixin被实例化或扩展，我们可以像这样定义它：

```dart
abstract class Walker {
  // This class is intended to be used as a mixin, and should not be
  // extended directly.
  factory Walker._() => null;

  void walk() {
    print("I'm walking");
  }
}
```

要使用mixin的话，你需要使用with关键字，后跟一个或多个mixin的名称：

```dart
class Cat extends Mammal with Walker {}

class Dove extends Bird with Walker, Flyer {}
```

再来看示例：

```dart
class A {
  String getMessage() => 'A';
}

class B {
  String getMessage() => 'B';
}

class P {
  String getMessage() => 'P';
}

class AB extends P with A, B {}

class BA extends P with B, A {}

void main() {
  AB ab = AB();
  print(ab.getMessage()); // B

  BA ba = BA();
  print(ba.getMessage()); // A
}
```

![](./images/1.png)

```dart
class A {
  String getMessage() => 'A';
}

class B {
  String getMessage() => 'B';
}

class P {
  String getMessage() => 'P';
}

class AB extends P with A, B {}

class BA extends P with B, A {}

void main() {
  AB ab = AB();
  print(ab is P); // true
  print(ab is A); // true
  print(ab is B); // true

  BA ba = BA();
  print(ba is P); // true
  print(ba is A); // true
  print(ba is B); // true
}
```

再看一个示例：

```dart
abstract class Super {
  void method() {
    print("Super");
  }
}

class MySuper implements Super {
  void method() {
    print("MySuper");
  }
}

mixin Mixin on Super { // 此Mixin只能被Super或其子类with
  void method() {
    super.method();
    print("Sub");
  }
}

class Client extends MySuper with Mixin {}

void main() {
  Client().method();
}

// 程序输出结果：
// MySuper
// Sub
```
![](./images/2.png)

参考：

* [https://www.jianshu.com/p/a578bd2c42aa](https://www.jianshu.com/p/a578bd2c42aa)
* [https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3](https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3)



