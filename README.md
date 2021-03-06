# 基于JSP的在线书店

> author: NWPU 杨远林

> time: 2019.02.24

> description: 基于JSP的在线书店



+ 这个项目到此为止就算结束了，基本功能大概进行了实现，剩下的就是CRUD的重复性工作了，这个项目从上个学期开始，断断续续，一行一行敲出来的，期间心态上经历了不少，从刚入学的不知所措，到现在胸有成竹。
+ 项目需求功能详见项目开发说明书，下面凭借记忆概述一下项目大概用到的技术：
+ 1. BaseServlet：首先是抽取了一个BaseServlet，众所周知，使用JSP进行开发要编写大量的Servlet，每次前端界面请求都是在请求一个Servlet，然后处理代码写在get()或者post()方法里；但是使用BaseServlet抽取一个通用的Servlet，继承自HttpServlet，然后重写service()方法，这样的话，以后可以每个业务模块只创建一个Servlet继承自BaseServlet，每一次客户端的请求都是一个方法，这样就大大减少了Servlet的数量。原理是运用了反射的知识，当从客户端向服务端发起请求时，每次都要传递额外的键值对的数据method=””，服务端获取到method对应的内容之后,通过判断不同的内容调用不同的功能。
  2. Redis：使用Redis缓存实现了分类查询。
  3. 分页：对数据库中的商品信息、订单信息进行分页查询操作。
  4. 发送邮件：用户注册时，系统向用户输入的邮箱地址发送邮件，用户须在邮箱中激活邮件后才能登录。
  5. 用UUID工具类生成主键。
  6. 通过BeanFactory为项目解耦。
  7. MyBeanUtils自动填充实体类。
  8. 使用了MD5加密。
  9. 支付模块调用了易宝支付的接口。
  10. 上传图片。

+ 还有很多零零散散的小知识、小细节，遇到了很多问题，比如字符编码问题，数据库编码问题，连接池问题，数据库版本兼容问题，Tomcat服务器问题，一点一点解决，一点一点修改，有bug不错，仔细找到问题所在，总能解决的。

+ 总的来说，这个项目问题很多，功能也不尽完善，但是算是对大学期间所学到的有关Java EE相关知识的一个整合，当然，我从这个项目里也学到了很多，后边要学的的东西更多，要做的事也很多，慢慢来，慢慢学，一点点深入下去吧。

> GitHub: https://github.com/yangyl7239/

> Blog: https://yangyuanlin.club/

> Email: yylin7239@163.com