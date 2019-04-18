# Swift基本语法

#### ?和!
```Swift
var myString: String? // 可能没有值(none)，或有一个类型为String的值
//var myString: Optional<String>
myString = "Hello, Swift!"
if myString != nil {
    print(myString) // Optional("Hello, Swift!")
}
else {
    print("It's null!")
}

import Foundation

//var myString: String! = nil
var myString: String!
print(myString) // none

if myString == nil {
    print("It's none!”)
}
```

#### 函数
Swift 函数参数可以同时有一个局部名称（在函数体内部使用）和一个外部名称（在调用函数时使用)
```Swift
// 局部参数名
func eat(food: String) -> Void {
    print("eat \(food)")
}

// 此处food作是局部参数名，调用时不可省略
eat(food: "fruit")

// 局部参数名也可作为函数重载的一部分
func eat(food_2: String) -> Void {
    print("\(food_2)")
}
eat(food: "haha")

// 这样可以省略参数名
func drink(_: String) -> Void {
    print("drink water")
}

drink("Water")

// 外部参数名：可以在局部参数名前指定外部参数名，中间以空格分隔，外部参数名用于在函数调用时传递给函数的参数
// 即调用函数时要使用外部参数名
func pow(firstArg a: Int, secondArg b: Int) -> Int {
    var res = a
    for _ in 1..<b {
        res = res * a
    }
    return res
}

// 2的3次方: 8
print(pow(firstArg: 2, secondArg: 3))

// 几种写法：

// 调用时不传参数，空：
func eat() -> Void {
   print("1. eat()")
}
eat()

// 调用时传局部参数：
func eat(food: String) -> Void {
    print("eat: \(food)")
}
eat(food: "2. eat(food: String)")

// 调用时传外部参数：
func eat(FOOD food: String) -> Void {
    print("\(food)")
}
eat(FOOD: "3. eat(FOOD food: String)")

// 调用时不使用参数，但传了值
func eat(_ food: String) -> Void {
    print("\(food)")
}
eat("4. eat(_ food: String) ")
```

#### 可变参数
```Swift
func vari<N>(members: N...) -> Void {
    for i in members {
        print(i)
    }
}

vari(members: 4, 3, 5)
vari(members: "Google", "Baidu", "Runboob")
```
#### 常量，变量及 I/O 参数
默认在函数中定义的参数都是常量参数，这个参数你只可以查询使用，不能改变它的值
```Swift
func eat(_ food: String) -> Void {
    food = "Banana" // Error: Cannot assign to value: 'food' is a 'let' constant
    print("eat: \(food)")
}
```

如果想要声明一个变量参数，可以在参数定义前加 inout 关键字:
```Swift
func eat(_ food: inout String) -> Void {
    food = "Banana"
    print("\(food)")
}

var food = "watermelon"
eat(&food)
```

再示例：
```Swift
func swap(_ a: inout Int, _ b: inout Int) -> Void {
    let temp = a
    a = b
    b = temp
}

var a = 1
var b = 2
swap(&a, &b)
print("a: \(a) -- b: \(b)") // a: 2 -- b: 1
```

