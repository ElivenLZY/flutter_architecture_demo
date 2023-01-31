# flutter_architecture_demo

flutter 开发规范，包括：
1，分层架构规范


flutter 数据分层架构规范

一，背景
目前项目中对数据处理的部分没有统一管理的规范，比如同一个接口请求和数据解析出现在多个地方，修改一个接口需要多处查找修改等等。

二，概述
数据仓库分层架构可以在业务分层的基础上区分处理不同来源的数据，并对这些数据进行整合处理后对外统一暴露可信的输出接口，隔离底层数据处理的复杂性，能有效提高业务逻辑层对数据组装的灵活性。

三，规范
以用户模块为例：

1，标准版

![image](https://user-images.githubusercontent.com/22269028/215697224-f0342105-3840-4689-8423-5cb7dfe58909.png)


user_api：接口请求

user_local：本地数据处理

user_repository：统一对外暴露的接口，可以聚合处理多个来源的数据，比如网络/本地（数据库/文件/sp数据），也可以对数据进行转换等操作。

2，简版

![image](https://user-images.githubusercontent.com/22269028/215697284-6689b566-6ede-42d5-8839-ed58d7f40439.png)

user_repository：统一对外暴露的接口，不区分数据来源，所有的数据处理全部放在这里进行处理。

四，总结
1，分层架构里所有定义的需要有数据返回接口，必须以数据流的形式进行返回，比如Future/Stream进行数据流包装，方便调用方根据业务需要对数据进行转换处理。

2，业务数据多且复杂的模块可以使用标准版，否则可以使用简版的；根据实际业务选择一种，保证代码规范的同时，也尽可能的减少对代码编写的复杂性。
