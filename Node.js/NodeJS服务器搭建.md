# NodeJS服务器搭建


- 新建项目文件夹比如 MyNode
- 在文件夹内打开终端，运行 npm init , 一直回车或者填你想填的内容
- 在MyNode中新建文件如：app.js
- 安装express, 终端输入  npm i express --save
- 在app.js中写如下代码:





4） 

5） 

var express = require('express')

var app = express()

 

app.use(function(req, res, next) {

  res.end('hello world')

})

 

app.listen(8090, () => {

  console.log(`App listening at http://127.0.0.1:8090`)

})

6） 终端指令 node app.js启动服务器

7） 浏览器中 <http://127.0.0.1:8090>访问服务器My