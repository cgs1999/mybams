http://www.pinhuba.com/bams/index.htm


用来快速开发“政企信息管理系统”的JAVA框架

一、框架介绍
BAMS是轻量级的，简单易学，本框架以Spring Framework为核心、Jsp+Dwr作为模型视图控制器、Hibernate作为数据库操作层。
BAMS已内置 一系列企业信息管理系统的基础功能，目前包括三大模块，系统管理（SYS）模块、人力资源管理（HRM）模块和在线办公（OA）模块。 系统管理模块，包括企业组织架构（用户管理、机构管理、区域管理）、菜单管理、角色权限管理、字典管理等功能。
BAMS提供了常用工具进行封装，包括日志工具、缓存工具、服务器端验证、数据字典、当前组织机构数据（用户、机构、区域）以及其它常用小工具等。另外还提供一个基于本基础框架的 代码生成器 ，为你生成基本模块代码，如果你使用了BAMS基础框架，就可以很快速开发出优秀的信息管理系统。

二、框架定位
BAMS是一个 开源的政企信息管理系统 基础框架。主要定位于“政企信息管理”领域，可用政企信息管理类系统。BAMS是非常强调开发的高效性、健壮性和安全性的。
目前的平台还是主要针对开发人员。
BAMS的业务构建是基于流程引擎Activiti＋代码生成器来共同完成流程业务和非流程业务的快速开发。感谢咖啡兔、临远对activiti的深入研究
希望BAMS能够对那些正在或即将开发自己团队的J2EE应用快速开发平台的个人或公司能有所启发！

三、框架适用环境
操作系统：windows、linux
JDK版本：1.6、1.7
tomcat版本：6.x、7.x
数据库：mysql、oracle
浏览器版本：IE7以上系列、chrome系列、火狐

四、框架演示、交流
演示地址：http://bams.coding.io/login.jsp
精简版：http://bams-simple.coding.io/login.jsp
交流QQ群：BAMS 开发框架 二群

五、框架源码、数据库下载
maven版本：https://coding.net/u/pinhuba/p/bams/git
数据库脚本请到QQ群共享下载

六、框架部署
将数据文件导入mysql数据库，推荐使用mysql5.0版本。
修改proxool.properties数据库配置属性。
普通账号 公司码：BIOS 账号：dxj 密码：111111
系统超级管理员 公司码：PINHUBA 账号：admin 密码：111111
演示系统超级管理员不开放，请下载部署后体验超级管理员功能。