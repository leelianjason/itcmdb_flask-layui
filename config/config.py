"""
 这是项目的配置文件
"""
import redis


class MysqlConfig(object):
    SQLALCHEMY_DATABASE_URI = 'mysql://root:123456@192.168.1.80:3306/cmdb_test'
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
    SESSION_REDIS = redis.Redis(host='192.168.1.80', port='6379')  # 用于连接redis的配置
    PERMANENT_SESSION_LIFETIME = 3600  # session长期有效，则设定session生命周期，整数秒，默认大概不到3小时。


# 程序配置文件
class SoftConfig(object):
    def __init__(self):
        # 平台名称，类型：str
        self.systemName = "运维管理平台"
        # 平台所属组织名称，类型：str
        self.company = "leelian.jason@gmail.com"
        # IT 管理平台项目名称，类型：list
        self.project_list = ['行政', '财务', '技术部', '公共资源']
        # 部门类型
        self.group_list = ['人事', '财务', '测试']
        # IT设备状态，类型：list
        self.status_list = ['使用中', '工位闲置', '库房闲置', '已销毁']
        # IT设备类型，类型：list
        self.type_list = ['兼容机', '笔记本', 'iMac']
