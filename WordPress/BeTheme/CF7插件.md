# CF7插件

![](images/22.png)

CF7插件用来做“联系我们”留言板。 访客填写信息留言后，网站会把这些信息发送到指定邮箱。CF7是免费的。

这个插件管理位置在：联系(Contact)
上图所示的留言板引用的是：`[contact-form-7 id="2338" title="Contact form"]`对应的位置是：
Contact（联系） > Contact Forms下面Contact form
![](images/23.png)
![](images/24.png)
要使用访客留言可以发送到正确的邮箱，还需要填写邮箱信息：
![](images/25.png)

借助第三方邮箱服务器发邮件还需要一个SMTP插件，比如：
![](images/26.png)

邮箱的设置在：Settings > WP Mail SMTP:
- From Email: 填写自己的Email
- From Name: 对方看到的邮箱名
- SMTP Host: SMTP服务器地址
- Encryption: 可以勾选SSL
- SMTP Port: 如果勾选了SSL，则此处使用465
- Aoto TLS: 不必要选中
- Authentication: ON 打开
- SMTP Username: 用户名
- SMTP Password: 密码


