# 使用FTP上传WordPress

FTP是File Transfer Protocol文件传输协议，上传文件的软件有很多，我这里使用[FileZilla](https://filezilla-project.org/)，下载时注意Download FileZilla Client（所有平台都有）, 没有必要Download FileZilla Server, 因为阿里云里面有Server端的解压等功能，我们只是上传文件，使用Client端的就可以了。

接下来我们使用FileZilla把WordPress上传到主机。
首先，我们下载下来最新版的WordPress[https://wordpress.org/download/](https://wordpress.org/download/), 这个.org是英文官网，也有中文官网，最新版的通过.org这个网站下载，下载好后接下来登录FTP。

主机地址、FTP用户名、FTP密码是登录FTP软件的必要条件，这些可以在主机控制台的站点信息里找到
![](/WordPress/images/5.png)
打开FileZilla, 文件 --> 站点管理器 --> 新站点 --> 输入相关内容，其中端口使用默认的21，填好后点击连接，如果连接不成功，则试着加密选项中选择：只使用明文FTP(不安全)
![](/WordPress/images/6.png)

连接成功后，其目录结构类似于：
![](/WordPress/images/7.png)
我们主要操作的目录是htdocs目录，htdocs是网站的主目录，也是网站前台的根目录，只有这个目录下面的文件，前台才可以访问到。FTP软件看到的假如是：/htdocs/abc/123.html，那么在浏览器中看到的就是：www.xxx.com/abc/123.html。

进入到htdocs目录中，为了把WordPress上传到网站言目录，把htdocs里面的内容全部清空（全选，清空），注：可能有个文件logreport无法清除，这没有，它是系统文件，可以忽略。
清理干净后把刚才下载的WordPress压缩包托入htdocs目录下，或者在左侧右键这个压缩包，然后上传。wordpress解压后约占30M。

上传完之后在主机控制台解压WordPress。
