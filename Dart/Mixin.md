# Mixin

Mixins可以通过普通的类声明隐式定义：

```cpp
class Walker {
  void walk() {
    print("I'm walking");
  }
}
```

如果我们不想让我们创建的mixin被实例化或扩展，我们可以像这样定义它：

```
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

```
class Cat extends Mammal with Walker {}

class Dove extends Bird with Walker, Flyer {}
```



参考：

* [https://www.jianshu.com/p/a578bd2c42aa](https://www.jianshu.com/p/a578bd2c42aa)
* [https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3](https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3)



