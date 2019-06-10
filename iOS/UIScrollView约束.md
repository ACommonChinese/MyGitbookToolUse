# UIScrollView约束

我的简书一篇文章（简书文章几乎不再更新，以后通过GitBook写博文）:
[https://www.jianshu.com/p/29a2a4d840fd](https://www.jianshu.com/p/29a2a4d840fd)

以新建一和控制器的view同大的UIScrollView并垂直滚动为例:

**代码布局约束示例**
```Objective-C
// Step 1> ScrollView上下左右为0
[scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
	make.left.top.right.bottom.mas_equalTo(0);    
}];

// Step 2> 新建ContentView并加入ScrollView, 设置其上下左右，宽和ScrollView相同
UIView* contentView = UIView.new;
[self.scrollView addSubview:contentView];
    
[contentView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.equalTo(self.scrollView);
    make.width.equalTo(self.scrollView);
}];

// Step 3> 把各个子控制加入ContentView, 而不是ScrollView
UIView *view1 = UIView.new;
[contentView addSubview:view1];
...
UIView *view2 = UIView.new;
[contentView addSubview:view2];
...
UIView *lastSubView = UIView.new;
[contentView addSubview:lastSubView];
...

// Step 4> 使用最后一个subView控制contentView的高，从而控制scrollView的contentSize.height
- (void)resetContentViewConstraint:(UIView *)contentView withLastSubview:(UIView *)lastSubview {
    if (!contentView || !lastSubview) {
        return;
    }
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(lastSubview.mas_bottom);
    }];
}
```
