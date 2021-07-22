from servers.tools import models
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class APIResponse(object):
    def __init__(self):
        self.code = ''
        self.msg = ''
        self.data = dict()
        self.count = ''


# 获取搜索参数然后返回查询结果
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


# 计数
def countAllData(params):
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
            models.Server.type.like("%" + type + "%") if type is not None else ""
        ).count()
        result.code, result.msg, result.data = 0, "OK", {"data": response}
        return result
    except Exception as e:
        raise e
    finally:
        db.session.close()


def addDataByID(info):
    # 没有传递的话添加默认值
    isdel = info.get("isdel")
    droptime = info.get("droptime")
    if isdel == None:
        isdel = 0
    if droptime == None:
        droptime = ''

    result = APIResponse()
    try:
        data = models.Server(num=info.get("num"), project=info.get("project"), user=info.get("user"),
                             status=info.get("status"), type=info.get("type"),
                             buytime=info.get("buytime"), droptime=droptime, isdel=isdel,
                             cpu=info.get("cpu"), mb=info.get("mb"), gpu=info.get("gpu"),
                             mem=info.get("mem"), maindisk=info.get("maindisk"), slavedisk=info.get("slavedisk"),
                             maindisplay=info.get("maindisplay"), slavedisplay=info.get("slavedisplay"),
                             comments=info.get("comments"))
        db.session.add(data)
        db.session.commit()
        result.code, result.msg = 0, "OK,数据添加成功！"
        return result
    except Exception as e:
        db.session.rollback()
        result.code, result.msg = 1, "数据添加失败！错误信息：{}".format(e)
        raise result
    finally:
        db.session.close()


def selectServerDataBydID(id):
    # 查询没有会返回None
    result = db.session.query(models.Server).filter(
        models.Server.isdel == 0,
        models.Server.id == id).first()
    return result


def deleteDataByID(id):
    data = selectServerDataBydID(id)
    result = APIResponse()
    # 如果存在直接假删除
    try:
        data.isdel = 1
        db.session.commit()
        result.code, result.msg = 0, "删除成功！"
        return result
    except Exception as e:
        db.session.rollback()
        result.code, result.msg = 1, '删除执行错误：{0}'.format(e)
        raise result
    finally:
        db.session.close()


def updataDataByID(info):
    # 获取数据
    id = info.get("id")
    num = info.get("num")
    project = info.get("project")
    user = info.get("user")
    status = info.get("status")
    type = info.get("type")
    buytime = info.get("buytime")
    droptime = info.get("droptime")
    cpu = info.get("cpu")
    mb = info.get("mb")
    gpu = info.get("gpu")
    mem = info.get("mem")
    maindisk = info.get("maindisk")
    slavedisk = info.get("slavedisk")
    maindisplay = info.get("maindisplay")
    slavedisplay = info.get("slavedisplay")
    comments = info.get("comments")

    result = APIResponse()
    data = selectServerDataBydID(id)
    if data:
        try:
            data.num = num
            data.project = project
            data.user = user
            data.status = status
            data.type = type
            data.buytime = buytime
            data.droptime = droptime
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
            result.code, result.msg = 0, "修改数据成功"
            return result
        except Exception as e:
            db.session.rollback()
            result.code, result.msg = 1, "修改数据失败{0}".format(e)
            raise result
        finally:
            db.session.close()
    else:
        result.code, result.msg = 1, "修改数据失败，数据不存在"
        return result


# 获取搜索参数然后返回查询结果
def getRecycleData(params):
    keyWords = params.get("keyWords")
    status = params.get("status")
    project = params.get("project")
    type = params.get("type")

    result = APIResponse()
    try:
        # 需要用filter 否则会导致分页异常
        response = db.session.query(models.Server).filter(
            models.Server.isdel == 1,
            models.Server.user.like("%" + keyWords + "%") if keyWords is not None else "",
            models.Server.status.like("%" + status + "%") if status is not None else "",
            models.Server.project.like("%" + project + "%") if project is not None else "",
            models.Server.type.like("%" + type + "%") if type is not None else "")
        result.code, result.msg, result.data = 0, "OK", {"data": response}
    except Exception as e:
        raise e
    finally:
        db.session.close()
        return result


# 计数
def countRecycleData(params):
    keyWords = params.get("keyWords")
    status = params.get("status")
    project = params.get("project")
    type = params.get("type")

    result = APIResponse()
    try:
        # 需要用filter 否则会导致分页异常
        response = db.session.query(models.Server).filter(
            models.Server.isdel == 1,
            models.Server.user.like("%" + keyWords + "%") if keyWords is not None else "",
            models.Server.status.like("%" + status + "%") if status is not None else "",
            models.Server.project.like("%" + project + "%") if project is not None else "",
            models.Server.type.like("%" + type + "%") if type is not None else ""
        ).count()
        result.code, result.msg, result.data = 0, "OK", {"data": response}
    except Exception as e:
        result.code, result.msg = 1, '恢复执行错误：{0}'.format(e)
        raise result
    finally:
        db.session.close()
        return result


def recoverDataByID(id):
    result = APIResponse()
    data = db.session.query(models.Server).filter(
        models.Server.isdel == 1,
        models.Server.id == id).first()
    try:
        data.isdel = 0
        db.session.commit()
        result.code, result.msg = 0, "恢复成功！"
        return result
    except Exception as e:
        db.session.rollback()
        result.code, result.msg = 1, '恢复执行错误：{0}'.format(e)
        raise result
    finally:
        db.session.close()
        return result


def realDeleteByID(id):
    result = APIResponse()
    data = db.session.query(models.Server).filter(
        models.Server.isdel == 1,
        models.Server.id == id).first()
    if data:
        try:
            db.session.delete(data)
        except Exception as e:
            db.session.rollback()
            result.code, result.msg = 1, '恢复执行错误：{0}'.format(e)
            raise result
        finally:
            db.session.commit()
            result.code, result.msg = 0, "数据已彻底删除！"
            return result
    else:
        result.code, result.msg = 1, '数据不存在'
        return result
