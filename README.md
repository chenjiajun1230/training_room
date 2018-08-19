# 实测练习题
请在两周完成以下需求

# 需求描述
开发一个图书列表查询页面
* 图书属性包括: 书名/作者/ISBN号
* 通过表格展示系统里的图书
* 需要支持的操作: 借出/归还
    * 借出的图书不能再次借出, 必须归还后才能再次借出

# 第一阶段目标, 准备开发环境, 把项目工程跑起来:
* 安装软件:
    * [JAVA 1.8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
    * [Intellj IDEA](https://www.jetbrains.com/idea/download)
    * [MySQL 5.7](https://dev.mysql.com/downloads/mysql/)
    * [Gradle 2.4](https://gradle.org/next-steps/?version=2.14.1&format=bin)
    * Git
    * 框架工程(https://github.com/hank-cp/training_room)
* 用Git把框架工程下到本地
  * `git clone https://github.com/hank-cp/training_room`
* 导入IDEA
  * Import Project
  * 选择Gradle
  * 下载依赖包的过程可能要翻墙
* 运行
  * 点绿色三角"运行"按钮, 弹出Run/Debug Configuration框
  * 点左上"+"号, 选择Spring Boot
  * 选择MainClass, 应该只会有一个类在列表中, 选择确认
  * 点"OK"
  * 点绿色三角"运行"按钮, 观察运行日志
  * 打开http://localhost:8080 访问本地环境
  * 可以直接往数据库插测试数据调试程序
  
# 第二阶段, 理解需求, 建模, 实现后台业务逻辑:
* 根据需求设计领域对象, 自动生成数据库表
* 实现配套的Repository, 在Repository中实现对Model的CRUD
* 实现Controller, 在Controller中实现对Model的业务操作

# 第三阶段, 界面UI:
* 参考例子实现
* 可以适当改良优化, 使界面尽量看起来美观