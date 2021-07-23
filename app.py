# -*- coding : utf-8 -*-
from flask import Flask, redirect
from flask_session import Session
from servers.itdata.itdata import itdata
from servers.system.system_manage import system
from servers.display.display import display
from servers.tools.itdata_db import db
from config import config
import pymysql

pymysql.install_as_MySQLdb()

app = Flask(__name__)
# 注册蓝图到主文件
# 注册server.py文件的路由到主文件蓝图
app.register_blueprint(itdata, url_prefix="/itdata")
app.register_blueprint(system, url_prefix="/system")
app.register_blueprint(display, url_prefix="/display")

# 数据库配置
app.config.from_object(config.MysqlConfig())
app.config.from_object(config.RedisConfig())

Session(app)

db.init_app(app)


@app.route('/')
def index():
    ##只支持返回字符串和函数
    return redirect("/system/index")


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, port=80)
