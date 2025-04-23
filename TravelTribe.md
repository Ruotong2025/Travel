ICOM 6034 网站工程



**小组 Z-3**



**目录**
1. 项目概述	3  
   1.1 网站主题与背景	3  
   1.2 技术栈	3  
   1.3 系统框架与核心功能	3
2. 功能规格	4  
   2.1 用户账户管理	4  
   2.2 旅行日志管理	4  
   2.3 旅行日志探索	5  
   2.4 评论功能	6  
   2.5 数据验证	7
3. 系统设计	8  
   3.1 架构概述	8  
   3.2 模块设计	8  
   3.3 视图结构	9
4. 数据库设计	11  
   4.1 实体关系图	11
5. 实现细节	12  
   5.1 后端实现	12  
   5.2 前端实现	12  
   5.3 第三方API集成	13
6. 部署	14  
   6.1 后端部署	14  
   6.2 前端部署	14
7. 工作分配	15  
   7.1 易超群	15  
   7.2 廖建华	15
8. 结论与未来改进	15  
   8.1 成果总结	15  
   8.2 可能的改进方向	16
9. 参考文献	17



### 1. 项目概述
#### 1.1 网站主题与背景
TravelTribe旅行社区平台旨在为用户提供一个分享和讨论旅行计划与经验的场所。网站的主要目的是通过让用户发布旅行日志、添加相关标签以及通过评论互动，促进协作式旅行规划。  
平台集成了外部网络API，通过实时信息（如酒店预订、天气预报）丰富旅行规划体验，为用户提供更全面的旅游信息服务。

#### 1.2 技术栈
网站后端采用Java语言和Spring MVC框架，为业务逻辑和用户请求处理提供了稳健的结构。数据持久化通过MyBatis实现，提供了灵活的数据库交互能力，而MySQL作为关系型数据库存储用户账户、旅行日志和评论。Redis用于提升性能，特别是缓存频繁访问的数据。  
前端使用HTML5构建页面结构，CSS3进行样式设计，JavaScript实现动态交互（包括通过AJAX实现无刷新评论更新）。开发流程通过Maven进行项目管理和依赖控制，Navicat用于高效的数据库管理与维护。这些技术共同确保了一个可扩展、易维护且用户友好的旅行社区平台。以下是所有的技术列表：
##### 1.2.1 前端技术
- **JSP (JavaServer Pages)**: 用于动态网页生成
- **HTML5/CSS3**: 页面结构和样式
- **JavaScript/jQuery**: 实现前端交互效果
- **Bootstrap 4**: 响应式布局框架
- **Layui**: 提供丰富的UI组件，如表单、编辑器等
- **jQuery UI**: 提供日期选择器等交互组件
- **AJAX**: 实现异步数据加载，如天气信息实时更新

##### 1.2.2 后端技术
- **Spring MVC**: Web应用框架，处理HTTP请求
- **Spring**: IoC容器，管理对象生命周期和依赖注入
- **MyBatis**: 持久层框架，数据库交互
- **JSP/JSTL**: 视图层技术
- **Rapid-Framework**: 用于JSP模板继承
- **JSON**: 数据交换格式
- **RESTful API**: 接口设计规范

##### 1.2.3 数据库
- **MySQL**: 关系型数据库

##### 1.2.4 开发工具
- **Maven**: 项目管理工具
- **Git**: 版本控制
- **IntelliJ IDEA/Eclipse**: 开发IDE
- **navicat**:  数据库管理工具

#### 1.3 系统框架与核心功能
（此处插入系统框架图）
系统架构

核心功能
- 用户账户管理（注册、登录、资料管理）
- 图片上传与管理功能
- 旅行日志创建、编辑与删除（含目的地、日期范围）
- 旅行日志搜索与分页展示功能、多个侧栏互动
- 实时用户互相评论（AJAX轮询实现）
- 第三方API集成（AccuWeather天气信息、Amadeus酒店预订）


### 2. 功能规格
#### 2.1 用户账户管理
用户账户管理系统实现了安全且稳健的认证流程，处理注册、登录、注销和会话验证。系统通过`HomeLoginController`类利用Spring MVC的控制器架构处理所有认证相关的HTTP请求。注册时，控制器验证用户提交的信息（包括邮箱格式唯一性和用户名唯一性），然后将用户信息持久化到MySQL数据库。登录流程将凭证与存储的值进行比对，并建立服务器端会话以保持跨请求的登录状态。  
安全性通过多层防护实现，包括`LoginInterceptor`检查受保护路由的会话有效性，将未认证用户重定向到登录页面。系统通过"记住我"Cookie实现持久化登录状态，Cookie设置3天有效期。表单验证在客户端和服务器端同时进行，确保数据完整性和安全性。注销功能会正确使服务器会话失效并清除认证Cookie，防止会话固定攻击。
关键代码：

LoginInterceptor.java
```java
public class LoginInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws IOException {
        if(request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return false;
        }
        return true;
    }
}
```
#### 2.2 旅行日志管理
平台允许用户创建、编辑和删除旅行日志，每条日志包含标题、目的地、起止日期、内容和可选标签。添加新日志时，前端（HTML5 + JavaScript）在提交前验证表单输入（如确保日期逻辑合理且目的地非空）。后端（Spring MVC中的`BackArticleController`）处理请求，对输入进行清理以防止注入攻击，并通过MyBatis将数据持久化到MySQL。标签存储在单独的表中，与旅行日志形成多对多关系，便于后续高效搜索。
3. **文件上传处理**：
   - 实现类：`UploadFileController`
   - 端点：`/admin/upload/img`
   - 功能：处理图片上传并生成URL
   - 技术细节：
     - 使用MultipartFile处理上传
     - 文件类型验证（白名单）
     - 使用UUID生成唯一文件名
     - 保存到服务器文件系统
     - 返回访问URL给前端

**图2.1 搜索功能**  
编辑时，用户可以修改已发布日志的任何字段，包括缩略图。系统在允许更改前检查所有权，确保用户只能编辑自己的内容。后端使用`articleService.updateArticleDetail()`方法更新数据库内容。删除日志时先检查权限，允许作者或管理员删除内容，使用`articleService.deleteArticle()`方法级联删除关联的标签、分类和评论。  
搜索功能依赖于存储的标签和目的地，MyBatis动态SQL支持模糊匹配。系统通过事务更新确保数据一致性，日志及其关联标签的修改是原子的——要么完全应用，要么在出错时回滚。

#### 2.3 旅行日志探索
平台提供分页式旅行日志浏览功能，通过`ArticleController`实现。系统使用MyBatis的PageHelper插件进行分页，默认每页显示10条日志。每篇日志展示标题、目的地、日期范围（格式为MM/yyyy）和评论数，并支持按热度（评论数或浏览量）排序。

**图2.2 文章**  
系统还支持多种探索方式：
- 分类浏览：通过`/category/{categoryId}`路径展示特定分类下的日志
- 标签浏览：通过`/tag/{tagId}`路径展示包含特定标签的日志
- 相关推荐：在文章详情页展示同类别的其他旅行日志
- 热门推荐：基于浏览量展示最受欢迎的旅行内容

探索功能利用自定义SQL查询优化数据库性能，使用JOIN和子查询减少多次数据库访问。

#### 2.4 评论功能
评论系统使用户能够实时讨论旅行日志内容，通过`CommentController`实现。评论提交通过AJAX处理，发送到Spring MVC控制器，控制器处理请求、进行服务器端验证，并通过MyBatis将评论存储到MySQL。

**图2.3 评论**  
系统实现了以下评论功能：
- 实时评论更新：使用AJAX轮询(`/comment/new`端点)实现每3秒检查新评论
- 防刷机制：同一用户对同一文章的评论间隔不少于3秒
- 内容限制：评论长度上限为255字符
- 权限控制：评论列表按时间倒序显示，仅允许评论作者或文章作者删除评论

评论功能为每篇旅行日志创建互动社区，增强用户参与度和停留时间。系统使用`articleService.updateCommentCount()`方法自动更新文章评论计数，确保统计数据准确性。

#### 2.5 数据验证
数据验证对维护平台的安全性和可用性至关重要。系统实现了多层次的验证机制：

- 用户注册验证：
  - 用户名唯一性检查(`userService.getUserByName()`)
  - 邮箱格式及唯一性验证(`userService.getUserByEmail()`)
  - 前端JavaScript实时表单验证

- 旅行日志验证：
  - 标题和内容必填检查
  - 日期格式验证（使用DatePicker组件）
  - 目的地必填验证
  - 内容摘要自动生成（截取150字符）

- 上传文件验证：
  - 文件类型限制（仅允许.bmp、.jpg、.jpeg、.png、.gif等格式）
  - 文件大小限制（最大50MB）
  - 安全文件名生成（使用UUID和时间戳）

服务器端验证辅以事务错误处理，无效提交会触发用户友好的错误消息。系统使用MyBatis参数化查询防止SQL注入，同时实施输入清理防止XSS攻击。

### 3. 系统设计
#### 3.1 架构概述
系统采用经典的**模型-视图-控制器（MVC）**架构，清晰分离业务逻辑、数据管理和展示层。后端基于Spring MVC，处理路由、请求处理和业务逻辑，而MyBatis作为ORM层，将Java对象映射到MySQL数据库表。前端由JSP、HTML5、CSS和JavaScript构成，动态渲染内容。  

系统架构特点：
- **控制器层**：处理HTTP请求，调用服务层，返回模型和视图
- **服务层**：包含业务逻辑，与数据访问层交互
- **数据访问层**：MyBatis映射器与数据库交互
- **实体层**：Java对象（POJO）映射数据库表
- **视图层**：JSP模板结合JSTL标签显示数据

前后端通过**RESTful API**通信，JSON负载用于用户认证、旅行日志提交和搜索查询等操作。

#### 3.2 模块设计
应用采用组织良好的包结构，根据标准架构模式清晰分离关注点：

- **controller包**：包含所有控制器类
  - `home`子包：包含前台页面控制器（如`ArticleController`、`HomeLoginController`）
  - 管理员功能已通过权限控制整合到用户控制器中

- **service包**：定义服务接口
  - `impl`子包：包含服务接口实现类
  - 主要服务：`ArticleService`、`UserService`、`CommentService`等

- **entity包**：包含所有实体类
  - 主要实体：`Article`、`User`、`Comment`、`Tag`、`Category`等

- **mapper包**：定义MyBatis数据访问接口

- **dto包**：包含数据传输对象
  - `ArticleParam`：用于接收文章表单数据
  - `JsonResult`：封装JSON响应

- **enums包**：包含枚举类型
  - `ArticleStatus`：文章状态（草稿、发布）
  - `UserRole`：用户角色（管理员、普通用户）

- **interceptor包**：包含Spring MVC拦截器
  - `LoginInterceptor`：验证用户登录状态
  - `HomeResourceInterceptor`：加载全局资源

- **util包**：包含工具类

这种模块化设计促进关注点分离，使系统更易维护和测试。服务层通过接口定义与实现分离，便于单元测试和替换实现。

#### 3.3 视图结构
视图层按功能区域逻辑组织，遵循一致的命名约定和文件结构：

- `/WEB-INF/view/`：根视图目录
  - `Home/`：前台视图
    - `Article/`：文章相关视图（编辑、创建、列表）
    - `Page/`：静态页面和文章详情
    - `User/`：用户相关视图（登录、注册、个人资料）
    - `Public/`：公共组件（页眉、页脚、侧边栏）
    - `hotel/`：酒店查询视图
    - `Error/`：错误页面（404、403等）

静态资源组织：
- `/resource/assets/`：根静态资源目录
  - `css/`：样式表
  - `js/`：JavaScript文件
    - `article/`：文章相关脚本（上传、日期选择器）
  - `img/`：图像资源
    - `thumbnail/`：文章缩略图
  - `plugin/`：第三方插件（Bootstrap、jQuery等）

视图结构采用基于组件的方法，使用JSP标签库（JSTL）和自定义标签简化视图开发。各页面复用公共组件，提高开发效率和UI一致性。系统使用Rapid Framework实现页面模板继承，允许子页面覆盖父模板的特定部分。
### 4. 数据库设计
#### 4.1 实体关系图

**图4.1 数据库结构**  
数据库模式采用关系模型，支持旅行点子平台，明确定义的实体和关系确保数据完整性和高效查询。核心实体`article`代表旅行点子，包含`article_destination`（旅行地点）、`article_sundance`（开始日期）和`article_enddate`（结束日期）等字段，存储为`datetime`以便精确筛选。`article_view_count`和`article_commute_count`（互动指标）等元数据作为整数跟踪，而`article_status`（如草稿/已发布）控制可见性。`article_content`和`article_summary`字段使用`varchar(255)`，平衡存储效率和描述空间。  
`comment`表促进用户讨论，通过`comment_stable_id`（外键指向`article_id`）关联文章。每条评论存储作者名（`comment_name`）、内容（`comment_content`）和时间戳（`comment_create_time`）。值得注意的是，`comment_status_result`和`comment_status_url`允许 moderation 标记（如“垃圾”），`comment_agent`字段记录用户代理字符串供分析。  
关系通过关联表（如`article_tag_url`（点子与标签多对多）和`article_category_url`（分类））强制执行。`link`表管理外部引用（如API生成的酒店URL），`link_url`验证格式，`link_status`跟踪活跃状态。为优化搜索，`directory`和`menu`表支持层次组织，`directory_float`和`menu_level`支持嵌套结构。  
索引应用于频繁查询的列（如`article_destination`、`comment_stable_id`、`link_url`），外键级联更新/删除以保持引用完整性。模式避免冗余——如标签归一化到单独表而非逗号分隔字符串。此设计确保可扩展性，MyBatis动态生成高效JOIN查询以支持复杂操作（如标签搜索或评论线程）。

### 5. 实现细节
#### 5.1 后端实现
后端基于Spring MVC构建，所有请求通过DispatcherServlet路由到相应的控制器。关键控制器包括：

1. **HomeLoginController**：
   - `loginVerify()`：处理登录验证，设置会话和Cookie
   - `registerSubmit()`：处理用户注册，验证用户名和邮箱唯一性

2. **ArticleController**：
   - `getArticleDetailPage()`：显示文章详情，增加浏览计数
   - `getArticleListByCategoryId()`：按分类显示文章列表

3. **BackArticleController**：
   - `insertArticleSubmit()`：处理文章创建，设置文章属性和关联
   - `editArticleSubmit()`：处理文章编辑，更新文章及其关联

4. **CommentController**：
   - `insertComment()`：处理评论提交，包含防刷机制
   - `getNewComments()`：获取新评论，支持实时更新

5. **HotelController**：
   - `searchHotels()`：调用Amadeus API搜索酒店
   - `getHotelDetails()`：获取酒店详情和价格

6. **GoWeatherController**：
   - `getTopCitiesWeather()`：调用AccuWeather API获取天气数据

关键服务实现：
- **ArticleServiceImpl**：实现文章CRUD操作，使用事务管理确保数据一致性
- **CommentServiceImpl**：处理评论创建和查询，支持分页和嵌套评论
- **UserServiceImpl**：管理用户认证和资料更新

数据访问层通过MyBatis映射器实现，每个实体对应一个Mapper接口和XML配置文件。

#### 5.2 前端实现
前端使用**HTML5表单**和客户端验证提升用户体验。例如，旅行点子提交表单在提交前通过JavaScript验证必填字段（目的地、日期），减少不必要的服务器请求。**AJAX**支持动态交互，如加载搜索结果或评论而无需整页刷新。用户搜索“亚洲”时，前端异步请求后端，返回的JSON数据通过JavaScript模板（如Handlebars.js）动态渲染。

静态资源组织：
- `/resource/assets/`：根静态资源目录
  - `css/`：样式表
  - `js/`：JavaScript文件
    - `article/`：文章相关脚本（上传、日期选择器）
  - `img/`：图像资源
    - `thumbnail/`：文章缩略图
  - `plugin/`：第三方插件（Bootstrap、jQuery等）

视图结构采用基于组件的方法，使用JSP标签库（JSTL）和自定义标签简化视图开发。各页面复用公共组件，提高开发效率和UI一致性。系统使用Rapid Framework实现页面模板继承，允许子页面覆盖父模板的特定部分。

1. **表单处理**：
   - 文章创建/编辑表单使用JavaScript验证
   - 文件上传使用LayUI组件实现预览和提交
   - 日期选择使用jQuery UI DatePicker组件

2. **AJAX交互**：
   - 评论提交和实时更新使用jQuery AJAX
   - 酒店搜索结果异步加载
   - 天气数据定时刷新（5分钟间隔）

3. **响应式设计**：
   - 使用CSS媒体查询适配不同设备
   - 图片缩放适应不同屏幕尺寸

4. **用户体验优化**：
   - 表单即时验证提供用户反馈
   - 加载状态指示器（spinner）
   - 平滑滚动和过渡效果

主要JavaScript功能：
- 图片上传预览和提交（upload.js）
- 日期选择器初始化（datepicker-init.js）
- 评论实时更新和防重复提交
- 酒店搜索和详情展示

#### 5.3 第三方API集成
系统集成了两个主要的第三方API，扩展了平台功能：

1. **AccuWeather API集成**：
   - 实现类：`GoWeatherController`
   - 端点：`/weather/top-cities`
   - 功能：获取全球50个主要城市的实时天气
   - 技术细节：
     - 使用RestTemplate发送HTTP请求
     - 使用JSONArray解析响应
     - 数据缓存减少API调用频率
     - 错误处理和重试机制
     - 前端实现排序和过滤功能

2. **Amadeus API集成**：
   - 实现类：`HotelController`
   - 端点：`/hotel/search`和`/hotel/details`
   - 功能：酒店搜索和详情查询
   - 技术细节：
     - 使用Amadeus Java SDK
     - 基于城市代码（IATA）搜索酒店
     - 支持过滤（评级、半径）
     - 分页显示搜索结果
     - AJAX加载酒店详情和价格

这些API集成丰富了平台功能，为用户提供更全面的旅行规划工具。

### 6. 部署
#### 6.1 后端部署
后端部署采用传统Java Web应用方式：

1. **环境要求**：
   - JDK 1.8（兼容Spring 4.3.19）
   - Apache Tomcat 9.0
   - MySQL 5.7+/8.0

2. **构建过程**：
   - Maven构建WAR文件：`mvn clean package`
   - 配置Tomcat服务器实例
   - 设置上下文路径为根路径（`/`）
   - 部署WAR文件到Tomcat webapps目录

3. **配置文件**：
   - `db.properties`：数据库连接参数
   - `spring-mvc.xml`：Spring MVC配置
   - `spring-mybatis.xml`：MyBatis和事务配置
   - `logback.xml`：日志配置

4. **数据库初始化**：
   - 执行SQL脚本创建表结构
   - 导入初始数据（用户、分类、标签）

部署成功后，应用运行在Tomcat默认端口（8080），使用根上下文路径访问。

#### 6.2 前端部署
前端作为后端应用的一部分集成在WAR文件中，同时可以配置Nginx作为反向代理和静态资源服务器：

1. **Nginx配置**：
   - 静态资源缓存和压缩（CSS、JS、图片）
   - 反向代理到Tomcat后端
   - HTTPS配置（SSL证书）
   - 负载均衡（多Tomcat实例）

2. **性能优化**：
   - 启用Gzip压缩
   - 设置静态资源长期缓存
   - 图片懒加载减少初始加载时间
   - 合并和压缩CSS/JS文件

3. **监控与日志**：
   - 使用Logback记录应用日志
   - 配置错误页面和错误处理
   - 定期备份数据和日志

这种部署方式确保了应用的可伸缩性和高可用性，适合中小规模的Web应用。

### 7. 工作分配
#### 7.1 易超群
- 旅行日志探索与实时评论系统实现
- 第三方API集成（AccuWeather天气和Amadeus酒店搜索）
- 数据库设计与SQL优化
- 安全性实现（拦截器）
- 系统部署与服务器配置
- 前端交互设计

#### 7.2 廖建华
- 用户管理与旅行日志管理模块
- 文件上传系统
- 安全性实现（输入验证）
- 数据库设计与SQL优化
- 用户界面设计与项目测试

### 8. 结论与未来改进
#### 8.1 成果总结
TravelTribe是一个基于Spring MVC、MyBatis和JSP等成熟技术栈构建的全方位旅行社区平台。系统实现了以下核心功能：

1. **用户功能**：
   - 完整的用户注册、登录和退出机制
   - 个人资料管理
   - 基于会话和Cookie的认证系统

2. **旅行日志管理**：
   - 创建、编辑、删除旅行日志
   - 特定字段（目的地、日期范围）支持旅行计划
   - 缩略图上传和管理
   - 分类和标签系统

3. **社区互动**：
   - 实时评论系统
   - 分页浏览与搜索
   - 相关内容推荐

4. **第三方集成**：
   - 酒店搜索和价格比较
   - 全球主要城市天气预报
   - 动态加载和更新

系统采用模块化设计，清晰分离关注点，便于维护和扩展。MVC架构确保了代码组织良好，降低了耦合度。数据库设计考虑了性能和可扩展性，使用适当的索引和关联表优化查询性能。

#### 8.2 可能的改进方向
尽管当前实现覆盖所有基本功能，仍有若干方向可进一步提升平台：

1. **功能扩展**：
   - 社交功能：用户关注、私信、动态
   - 行程规划工具：日程安排、交通信息
   - 多语言支持：国际化和本地化
   - 高级搜索：按日期范围、预算、活动类型筛选

2. **技术升级**：
   - 前后端分离架构：使用React或Vue重构前端
   - 微服务架构：拆分为独立微服务
   - 搜索引擎集成：使用Elasticsearch提升搜索体验
   - 实时通信：使用WebSocket替代轮询

3. **用户体验优化**：
   - 移动应用：开发原生移动应用
   - 地图集成：可视化旅行路线
   - 个性化推荐：基于用户兴趣的智能推荐
   - 接入支付系统：酒店直接预订和支付

4. **安全性增强**：
   - OAuth2集成：第三方登录
   - 加强密码安全：使用BCrypt哈希
   - CSRF和XSS防护增强
   - 内容审核系统：防止不当内容


### 9. 参考文档
1. Spring Framework Documentation, https://docs.spring.io/spring-framework/docs/4.3.x/spring-framework-reference/html/
2. MyBatis Documentation, https://mybatis.org/mybatis-3/
3. AccuWeather API Documentation, https://developer.accuweather.com/apis
4. Amadeus API for Developers, https://developers.amadeus.com/
5. Mozilla Developer Network (MDN) Web Docs, https://developer.mozilla.org/
6. Bootstrap Documentation, https://getbootstrap.com/docs/
7. jQuery Documentation, https://api.jquery.com/
8. Redis Documentation, https://redis.io/documentation