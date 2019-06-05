# CFSocket

#### 什么是Socket?

Socket的英文原义是“孔”或“插座”, 在计算机里，网络上的两个程序通过一个双向的通信连接实现数据的交换，这个连接的一端称为一个socket。
在Internet上的主机一般运行了多个服务软件，同时提供几种服务。每种服务都打开一个Socket，并绑定到一个端口上，不同的端口对应于不同的服务。
Socket实质上提供了进程通信的端点。进程通信之前，双方首先必须各自创建一个端点，否则是没有办法建立联系并相互通信的。正如打电话之前，双方必须各自拥有一台电话机一样

Socket套接字有多种形式，但一般是指Internet套接字，根据数据的传输方式，一般可以将 Internet 套接字分成两种类型。通过 socket() 函数创建连接时，必须告诉它使用哪种数据传输方式：

[http://c.biancheng.net/view/2124.html](http://c.biancheng.net/view/2124.html)

**流格式套接字（SOCK_STREAM）**
流格式套接字（Stream Sockets）也叫“面向连接的套接字”, 使用TCP 协议，在代码中使用 SOCK_STREAM 表示，SOCK_STREAM 是一种可靠的、双向的通信数据流，数据可以准确无误地到达另一台计算机，如果损坏或丢失，可以重新发送。
SOCK_STREAM 有以下几个特征：
- 数据在传输过程中不会消失；
- 数据是按照顺序传输的；
- 数据的发送和接收不是同步的（有的教程也称“不存在数据边界”）

**数据报格式套接字（SOCK_DGRAM）**
数据报格式套接字（Datagram Sockets）也叫“无连接的套接字”，使用UDP协议，在代码中使用 SOCK_DGRAM 表示。
计算机只管传输数据，不作数据校验，如果数据在传输中损坏，或者没有到达另一台计算机，是没有办法补救的。也就是说，数据错了就错了，无法重传。
因为数据报套接字所做的校验工作少，所以在传输效率方面比流格式套接字要高。
可以将 SOCK_DGRAM 比喻成高速移动的摩托车快递，它有以下特征：
- 强调快速传输而非传输顺序；
- 传输的数据可能丢失也可能损毁；
- 限制每次传输的数据大小；
- 数据的发送和接收是同步的（有的教程也称“存在数据边界”）。



相关链接：
- [https://baike.baidu.com/item/socket/281150?fr=aladdin](https://baike.baidu.com/item/socket/281150?fr=aladdin)
- [https://www.jianshu.com/p/da02ffd2f718](https://www.jianshu.com/p/da02ffd2f718)
- [Apple CFSocket源码](https://opensource.apple.com/source/CF/CF-635/CFSocket.c.auto.html)
- [第三方CocoaAsyncSocket](https://github.com/robbiehanson/CocoaAsyncSocket)
- [http://c.biancheng.net/socket/](http://c.biancheng.net/socket/)