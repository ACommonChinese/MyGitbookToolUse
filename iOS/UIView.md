# UIView

####生命周期

```swift
@IBAction func add(_ sender: Any) {
    print(self.redView)
    self.view.addSubview(self.redView)
}

@IBAction func remove(_ sender: Any) {
    self.redView.removeFromSuperview()
}

class RedView: UIView {
    override func willRemoveSubview(_ subview: UIView) {
        print("will remove sub view")
    }
    override func didAddSubview(_ subview: UIView) {
        print("did add subview")
    }
    override func willMove(toSuperview newSuperview: UIView?) {
        if nil == newSuperview {
            print("dismiss_____1. remove from super view")
        }
        else {
            print("show_____2. will move to super view");
        }
    }
    override func willMove(toWindow newWindow: UIWindow?) {
        if nil == newWindow {
            print("dismiss_____2. remove from super window")
        }
        else {
            print("show_____1. will move to super window")
        }
    }
    override func didMoveToSuperview() {
        if nil != self.superview?.description {
            print("show_____3. did move to super view")
        }
        else {
            print("dismiss_____3. did remove from super view")
        }
    }
}
```

打印结果：
```
show_____1. will move to super window
show_____2. will move to super view
show_____3. did move to super view
dismiss_____1. remove from super view
dismiss_____2. remove from super window
dismiss_____3. did remove from super view
```

影响view是否可接收到事件的因素：

A hidden view does not (normally) receive touch events.
A view whose background color is nil (the default) has a transparent background, it will be invisible, can receive touch events.
A view’s alpha affects it’s subviews, A view whose alpha is 0 or very close to it is like a view whose isHidden is true, it is completely transparent, invisible, along with subviews, and cannot (normally) be touched.





