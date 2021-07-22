from servers.tools import models
from flask_sqlalchemy import SQLAlchemy
from flask import Flask
import pymysql, time, hashlib

pymysql.install_as_MySQLdb()
app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:123456@192.168.1.80:3306/cmdb_test'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
app.config['SQLALCHEMY_ECHO'] = True
db = SQLAlchemy(app)


class APIResponse(object):
    def __init__(self):
        self.code = 0  # 0为正常，1为执行错误
        self.msg = ''
        self.data = []


class Response(object):
    def __init__(self):
        self.code = 0  # 0为正常，1为执行错误
        self.msg = ''
        self.count = ''
        self.data = []


def selectServerDataBydID(id):
    # 查询没有会返回None
    result = db.session.query(models.Server).filter(
        models.Server.isdel == 0,
        models.Server.id == id).first()
    return result


def deleteDataByID(id):
    data = selectServerDataBydID(id)
    # 如果存在直接假删除
    if data:
        try:
            data.isdel = 1
            db.session.commit()
            return data
        except Exception as e:
            return e
    else:
        return data


def updataDataByID(info):
    # 获取数据
    id = info.get("id")
    num = info.get("num")
    project = info.get("project")
    user = info.get("user")
    status = info.get("status")
    type = info.get("type")
    buytime = info.get("buytime")
    cpu = info.get("cpu")
    mb = info.get("mb")
    gpu = info.get("gpu")
    mem = info.get("mem")
    maindisk = info.get("maindisk")
    slavedisk = info.get("slavedisk")
    maindisplay = info.get("maindisplay")
    slavedisplay = info.get("slavedisplay")
    comments = info.get("comments")

    data = selectServerDataBydID(id)
    if data:
        try:
            data.num = num
            data.project = project
            data.user = user
            data.status = status
            data.type = type
            data.buytime = buytime
            data.cpu = cpu
            data.mb = mb
            data.gpu = gpu
            data.mem = mem
            data.maindisk = maindisk
            data.slavedisk = slavedisk
            data.maindisplay = maindisplay
            data.slavedisplay = slavedisplay
            data.comments = comments
            db.session.commit()
            return data
        except Exception as e:
            db.session.rollback()
            print(e)
            return None


def getUserNum(params):
    keyWords = params.get("keyWords")

    result = APIResponse()
    try:
        response = db.session.query(models.User).filter(
            models.User.delete_flag == 0,
            models.User.nick_name.like("%" + keyWords + "%") if keyWords is not None else ""
        ).count()
        result.code, result.msg, result.data = 0, 'OK', {"data": response}
        return result
    except Exception as e:
        result.code, result.msg = 1, '程序执行错误：{0}'.format(e)
        return result


def getUser(params):
    keyWords = params.get("keyWords")

    result = APIResponse()
    try:
        response = db.session.query(models.User).filter(
            models.User.delete_flag == 0,
            models.User.nick_name.like("%" + keyWords + "%") if keyWords is not None else "",
        )
        result.code, result.msg, result.data = 0, 'OK', {"data": response}
        return result
    except Exception as e:
        result.code, result.msg = 1, '执行错误：{0}'.format(e)
        return result


def selectUserById(id):
    result = db.session.query(models.User).filter(
        models.User.delete_flag == 0,
        models.User.pk_id == id
    ).first()
    return result


def deleteUser(id):
    response = selectUserById(id)
    result = APIResponse()
    try:
        response.delete_flag = 1,
        db.session.commit()
        result.code, result.msg = 0, "删除成功！"
        return result
    except Exception as e:
        result.code, result.msg = 1, '删除执行错误：{0}'.format(e)
        db.session.rollback()
        return result


def updateUser(params):
    pk_id = params.get("userId")
    login_name = params.get("loginName")
    nick_name = params.get("nickName")
    passwordtmp = params.get("passWord")
    role_id = params.get("roleId")

    result = APIResponse()
    response = selectUserById(pk_id)
    if response and login_name and passwordtmp:
        nowtime = time.strftime("%Y-%m-%d %H:%M:%S")
        password = hashlib.md5(passwordtmp.encode("utf-8")).hexdigest()
        try:
            response.login_name = login_name
            response.nick_name = nick_name
            response.password = password
            response.role_id = role_id
            response.update_time = nowtime
            db.session.commit()
            result.code, result.msg = 0, "修改数据成功"
            return result
        except Exception as e:
            db.session.rollback()
            result.code, result.msg = 1, "修改数据失败{0}".format(e)
            return result
    else:
        result.code, result.msg = 1, "修改数据失败，数据不存在"
        return result


def addRole(pamams):
    role_name = pamams.get("roleName")
    role_des = pamams.get("roleDes")
    result = APIResponse()
    if role_name and role_des:
        nowtime = time.strftime("%Y-%m-%d %H:%M:%S")
        if db.session.query(models.User).filter(models.User.role_name == role_name).first():
            result.code, result.msg = 1, "规则{0}已注册".format(role_name)
            return result
        else:
            try:
                data = models.Role(
                    role_name=role_name,
                    role_des=role_des,
                    create_time=nowtime,
                    update_time=nowtime
                )
                db.session.add(data)
                db.session.commit()
                result.code, result.msg = 0, "OK,添加规则成功"
                return result
            except Exception as e:
                db.session.rollback()
                result.code, result.msg = 1, "执行错误：{0}".format(e)
                return result


def selectResourceAll():
    result = db.session.query(models.Resource).filter(
        models.Role.delete_flag == 0
    ).all()
    return result


# 查询两表

def getUserall():
    users = db.session.query(models.User).filter(
        models.User.delete_flag == 0
    )
    for user in users:
        appendinfo = {
            "userId": user.pk_id,
            "loginName": user.login_name,
            "nickName": user.nick_name,
            "roleName": user.roleName.role_name
        }
        print(appendinfo)


def getUserallnew():
    users = db.session.query(models.User, models.Role.role_name).join(models.Role).filter(
        models.Role.pk_id == models.User.role_id)
    for user in users:
        appendinfo = {
            "userId": user.pk_id,
            "loginName": user.login_name,
            "nickName": user.nick_name,
            "roleName": user.role_name
        }
        print(appendinfo)


def getAllData(params):
    keyWords = params.get("keyWords")
    status = params.get("status")
    project = params.get("project")
    type = params.get("type")

    result = APIResponse()
    try:
        # 需要用filter 否则会导致分页异常
        response = db.session.query(models.Server).filter(
            models.Server.isdel == 0,
            models.Server.user.like("%" + keyWords + "%") if keyWords is not None else "",
            models.Server.status.like("%" + status + "%") if status is not None else "",
            models.Server.project.like("%" + project + "%") if project is not None else "",
            models.Server.type.like("%" + type + "%") if type is not None else "")
        result.code, result.msg, result.data = 0, "OK", {"data": response}
        return result
    except Exception as e:
        raise e
    finally:
        db.session.close()
