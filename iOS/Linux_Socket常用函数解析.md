# Linux_Socket常用函数解析

接口查询参考[http://man.he.net/](http://man.he.net/)

**int socket(int af, int type, int protocol)**
- `#include <sys/socket.h>`
- 创建一个socket, af 为地址族（Address Family），也就是 IP 地址类型，常用的有 AF_INET 和 AF_INET6。AF 是“Address Family”的简写，INET是“Inetnet”的简写。AF_INET 表示 IPv4 地址，例如 127.0.0.1；AF_INET6 表示 IPv6 地址，例如 1030::C9B4:FF12:48AA:1A2B
注：127.0.0.1，它是一个特殊IP地址，表示本机地址。
也可以使用 PF 前缀，PF 是“Protocol Family”的简写，它和 AF 是一样的。例如，PF_INET 等价于 AF_INET，PF_INET6 等价于 AF_INET6
