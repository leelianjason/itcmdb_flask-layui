## 简介

基于flask-web+layui框架的cmdb平台

```
Python 3.7.0
Flask  1.1.2
SQLAlchemy 1.4.3
layui  2.6.3
```

**功能：**

- 主机资产管理
- 显示器管理
- 回收站功能
- 多选删除
- excel批量导入
- 用户权限管理

## 部署步骤

准备环境

```
python 3.7.X
```

1.安装依赖

```
pip install -r  requirements.txt
```

依赖明细

```
Werkzeug==1.0.1
greenlet==0.4.14
Flask==1.1.2
flask_session==0.3.2
flask_sqlalchemy==2.5.1
flask_session==0.3.2
pymysql==1.0.2
redis==3.5.3
SQLAlchemy==1.4.3
xlrd==1.2.0
```

2.准备mysql和redis环境，如

```
#mysql
IP地址：127.0.0.1
用户：root 
密码：123456

#redis
IP地址：127.0.0.1
端口：6379
```

3.创建数据库，导入`script/cmdb.sql`即可

```
 mysql -h127.0.0.1  -uroot -p cmdb < script/cmdb.sql
```

4.修改项目配置文件`vim config/config.py`

```python
class MysqlConfig(object):
    SQLALCHEMY_DATABASE_URI = 'mysql://root:123456@127.0.0.1:3306/cmdb'
    SQLALCHEMY_COMMIT_ON_TEARDOWN = True  # 设置是否在每次连接结束后自动提交数据库中的变动。
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SQLALCHEMY_POOL_SIZE = 1024
    SQLALCHEMY_POOL_TIMEOUT = 30  # 指定数据库连接池的超时时间
    SQLALCHEMY_POOL_RECYCLE = 3600  # 自动回收连接的秒数


class RedisConfig(object):
    SESSION_TYPE = 'redis'  # session类型为redis
    SESSION_PERMANENT = False  # 如果设置为True，则关闭浏览器session就失效。
    SESSION_USE_SIGNER = False  # 是否对发送到浏览器上session的cookie值进行加密
    SESSION_KEY_PREFIX = 'session:'  # 保存到session中的值的前缀
    SESSION_REDIS = redis.Redis(host='127.0.0.1', port='6379')  # 用于连接redis的配置
    PERMANENT_SESSION_LIFETIME = 3600  # session长期有效，则设定session生命周期，整数秒，默认大概不到3小时。
```

5.修改项目自定义信息，`vim config/config.py`

```
class SoftConfig(object):
    def __init__(self):
        # 平台名称，类型：str
        self.systemName = "运维管理平台"
        # 平台所属组织名称，类型：str
        self.company = "google.com"
        # IT 管理平台项目名称，类型：list
        self.project_list = ['行政', '财务', '技术部', '公共资源']
        # IT设备状态，类型：list
        self.status_list = ['使用中', '闲置', ', '已销毁']
        # IT设备类型，类型：list
        self.type_list = ['兼容机', '笔记本', 'iMac']

```

6.运行程序

```
python app.py
```

默认使用80端口，可以打开app.py修改

```
if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, port=80)
```

7.访问地址http://IP:80

```
账号： admin
密码： 123456
```

<!--特殊要求-->

xlrd需要1.2.0版本，否则导入execl会报错不支持.xlsx文件，需要安装xlrd1.2.0

```
pip uninstall xlrd
pip install xlrd==1.2.0
```

## 更新日志：

#### 20210723：

1. 登录弹窗优化
2. 多选删除
3. 数据删除前弹窗提示

## 未实现的坑....

- 公司账号管理
- 右上角修改用户信息

## 补充

本项目借鉴了https://github.com/onceforyou/flask-admin  感谢大佬的贡献。

### 参考资料

SQLalchemy操作语句， https://blog.csdn.net/GiveMeFive_Y/article/details/80455978

SQLalchemy中文文档：https://wizardforcel.gitbooks.io/flask-extension-docs/content/flask-sqlalchemy.html

ORM操作已存在的数据表：https://blog.csdn.net/GiveMeFive_Y/article/details/80455978

前端框架：https://www.layui.com/

## 后台截图

![image-0](README.assets/image-0.png)

![image-1](README.assets/image-1.png)

![image-2](README.assets/image-2.png)

![image-3](README.assets/image-3.png)

![image-4](README.assets/image-4.png)

![image-5](README.assets/image-5.png)

![image-6](README.assets/image-6.png)

![image-7](README.assets/image-7.png)