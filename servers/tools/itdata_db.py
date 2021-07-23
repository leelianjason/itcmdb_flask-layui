from servers.tools import models
from flask_sqlalchemy import SQLAlchemy
from ..system.utils import APIResponse, CheckParams

db = SQLAlchemy()


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
        result.code, result.msg, result.data = 0, "OK", response
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
        result.code, result.msg, result.count = 0, "OK", response
        return result
    except Exception as e:
        raise e
    finally:
        db.session.close()


def addDataByID(info):
    num = info.get("num")
    user = info.get("user")
    project = info.get("project")
    group = info.get("group")
    owner = info.get("owner")
    status = info.get("status")
    type = info.get("type")
    buytime = info.get("buytime")
    droptime = info.get("droptime")
    level = info.get("level")
    cpu = info.get("cpu")
    mb = info.get("mb")
    gpu = info.get("gpu")
    mem = info.get("mem")
    maindisk = info.get("maindisk")
    slavedisk = info.get("slavedisk")
    maindisplay = info.get("maindisplay")
    slavedisplay = info.get("slavedisplay")
    comments = info.get("comments")
    # 没有isdel,droptime传递的话添加默认值
    isdel = info.get("isdel")
    if not isdel:
        isdel = 0
    if not droptime:
        droptime = ''

        # 过滤maindisplay的空值
    maindisplay = CheckParams(maindisplay)
    slavedisplay = CheckParams(slavedisplay)

    result = APIResponse()
    if num:
        if db.session.query(models.Server).filter(models.Server.num == num).first():
            result.code, result.msg = 1, "编号:{0}已添加".format(num)
            return result
        else:
            try:
                data = models.Server(
                    num=num,
                    user=user,
                    project=project,
                    group=group,
                    owner=owner,
                    status=status,
                    type=type,
                    buytime=buytime,
                    droptime=droptime,
                    isdel=isdel,
                    level=level,
                    cpu=cpu,
                    mb=mb,
                    gpu=gpu,
                    mem=mem,
                    maindisk=maindisk,
                    slavedisk=slavedisk,
                    maindisplay=maindisplay,
                    slavedisplay=slavedisplay,
                    comments=comments)
                db.session.add(data)
                db.session.commit()
                result.code, result.msg = 0, "OK,数据添加成功！"
                return result
            except Exception as e:
                db.session.rollback()
                result.code, result.msg = 1, "数据添加失败！错误信息：{}".format(e)
                return result
            finally:
                db.session.close()
    else:
        result.code, result.msg = 0, "编号不能为空！"


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
    user = info.get("user")
    project = info.get("project")
    group = info.get("group")
    owner = info.get("owner")
    status = info.get("status")
    type = info.get("type")
    buytime = info.get("buytime")
    droptime = info.get("droptime")
    level = info.get("level")
    cpu = info.get("cpu")
    mb = info.get("mb")
    gpu = info.get("gpu")
    mem = info.get("mem")
    maindisk = info.get("maindisk")
    slavedisk = info.get("slavedisk")
    maindisplay = info.get("maindisplay")
    slavedisplay = info.get("slavedisplay")
    comments = info.get("comments")
    # 过滤显示器编号空值
    maindisplay = CheckParams(maindisplay)
    slavedisplay = CheckParams(slavedisplay)

    result = APIResponse()
    data = selectServerDataBydID(id)
    if data:
        try:
            data.num = num
            data.user = user
            data.project = project
            data.group = group
            data.owner = owner
            data.status = status
            data.type = type
            data.buytime = buytime
            data.droptime = droptime
            data.level = level
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
            return result
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
        result.code, result.msg, result.data = 0, "OK", response
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
        result.code, result.msg, result.count = 0, "OK", response
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
