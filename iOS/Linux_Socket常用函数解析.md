# Linux_Socket常用函数解析

接口查询参考[http://man.he.net/](http://man.he.net/)

**int socket(int af, int type, int protocol)**
- `#include <sys/socket.h>`
- 创建一个socket, af 为地址族（Address Family），也就是 IP 地址类型，常用的有 AF_INET 和 AF_INET6。AF 是“Address Family”的简写，INET是“Inetnet”的简写。AF_INET 表示 IPv4 地址，例如 127.0.0.1；AF_INET6 表示 IPv6 地址，例如 1030::C9B4:FF12:48AA:1A2B
注：127.0.0.1，它是一个特殊IP地址，表示本机地址。
也可以使用 PF 前缀，PF 是“Protocol Family”的简写，它和 AF 是一样的。例如，PF_INET 等价于 AF_INET，PF_INET6 等价于 AF_INET6
- 示例：`int serv_sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);`

**sockaddr_in**
- 套接字地址结构体
- 示例：
```
struct sockaddr_in serv_addr; // 套接字地址
memset(&serv_addr, 0, sizeof(serv_addr)); // 每个字节都用0填充
serv_addr.sin_family = AF_INET; // 使用IPv4地址
serv_addr.sin_addr.s_addr = inet_addr("30.16.104.56"); // IP地址
serv_addr.sin_port = htons(1234); // 端口号
```

**htons**
htonl, htons, ntohl, ntohs -- convert values between host and network
     byte order
即：htonl, htons, ntohl, ntohs这4个函数转换主机节序和网络的字节序。网络中使用大端big endian, 大字节在前
htonl: Host TO Network Long  ==> uint32_t htonl(uint32_t hostlong);
htons: Host To Network Short ==> uint16_t htons(uint16_t hostshort);
ntohl: Network To Host Long  ==> uint32_t ntohl(uint32_t netlong);
ntohs: Network To Host Short ==> uint16_t ntohs(uint16_t netshort);