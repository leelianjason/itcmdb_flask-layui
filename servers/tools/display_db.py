from servers.tools import models
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class APIResponse(object):
    def __init__(self):
        self.code = ''
        self.msg = ''
        self.data = dict()
        self.count = ''


def countDisplayNum(params):
    keyWords = params.get("keyWords")
    status = params.get("status")
    result = APIResponse()
    try:
        response = db.session.query(models.Display).filter(
            models.Display.isdel == 0,
            models.Display.num.like("%" + keyWords + "%") if keyWords is not None else "",
            models.Display.status.like("%" + status + "%") if status is not None else ""
        ).count()
        result.code, result.msg, result.data = 0, "OK", {"data": response}
        return result
    except Exception as e:
        result.code, result.msg = 1, "执行错误：{0}".format(e)
        raise result
    finally:
        db.session.close()


def getDisplayData(params):
    keyWords = params.get("keyWords")
    status = params.get("status")
    result = APIResponse()
    try:
        response = db.session.query(models.Display).filter(
            models.Display.isdel == 0,
            models.Display.num.like("%" + keyWords + "%") if keyWords is not None else "",
            models.Display.status.like("%" + status + "%") if status is not None else ""
        )
        result.code, result.msg, result.data = 0, "OK", {"data": response}
        return result
    except Exception as e:
        result.code, result.msg = 1, "执行错误：{0}".format(e)
        raise result
    finally:
        db.session.close()


def addDisplay(params):
    isdel = 0
    droptime = ''
    num = params.get('num'),
    type = params.get("type"),
    owner = params.get('owner'),
    usepc = params.get('usepc'),
    status = params.get('status'),
    buytime = params.get("buytime"),
    comments = params.get("comments")
    result = APIResponse()
    if num:
        if db.session.query(models.Display).filter(models.Display.num == num).first():
            result.code, result.msg = 1, "编号:{0}已添加".format(num)
            return result
        else:
            try:
                data = models.Display(
                    num=num,
                    type=type,
                    owner=owner,
                    usepc=usepc,
                    status=status,
                    isdel=isdel,
                    buytime=buytime,
                    droptime=droptime,
                    comments=comments)
                db.session.add(data)
                db.session.commit()
                result.code, result.msg = 0, "OK,添加显示器成功"
                return result
            except Exception as e:
                db.session.rollback()
                result.code, result.msg = 1, "执行错误：{0}".format(e)
                raise result
            finally:
                db.session.close()
    else:
        result.code, result.msg = 0, "编号不能为空！"


def selectDisplayById(id):
    id = id
    result = db.session.query(models.Display).filter(
        models.Display.isdel == 0,
        models.Display.id == id,
    ).first()
    return result


def updateDisplay(params):
    id = params.get("id")
    num = params.get("num")
    type = params.get("type")
    owner = params.get("owner")
    usepc = params.get("usepc")
    status = params.get("status")
    buytime = params.get("buytime")
    droptime = params.get("droptime")
    comments = params.get("comments")
    result = APIResponse()
    response = selectDisplayById(id)
    if response:
        try:
            response.num = num
            response.type = type
            response.owner = owner
            response.usepc = usepc
            response.status = status
            response.buytime = buytime
            response.droptime = droptime
            response.comments = comments
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


def deleteDataById(id):
    data = selectDisplayById(id)
    result = APIResponse()
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


def countDisplayRecycleNum(params):
    keyWords = params.get("keyWords")
    status = params.get("status")
    result = APIResponse()
    try:
        response = db.session.query(models.Display).filter(
            models.Display.isdel == 1,
            models.Display.num.like("%" + keyWords + "%") if keyWords is not None else "",
            models.Display.status.like("%" + status + "%") if status is not None else ""
        ).count()
        result.code, result.msg, result.data = 0, "OK", {"data": response}
        return result
    except Exception as e:
        result.code, result.msg = 1, "执行错误：{0}".format(e)
        raise result
    finally:
        db.session.close()


def getDisplayRecycleData(params):
    keyWords = params.get("keyWords")
    status = params.get("status")
    result = APIResponse()
    try:
        response = db.session.query(models.Display).filter(
            models.Display.isdel == 1,
            models.Display.num.like("%" + keyWords + "%") if keyWords is not None else "",
            models.Display.status.like("%" + status + "%") if status is not None else ""
        )
        result.code, result.msg, result.data = 0, "OK", {"data": response}
        return result
    except Exception as e:
        result.code, result.msg = 1, "执行错误：{0}".format(e)
        raise result
    finally:
        db.session.close()


def recoverDisplayDataByID(id):
    result = APIResponse()
    data = db.session.query(models.Display).filter(
        models.Display.isdel == 1,
        models.Display.id == id).first()
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


def realDeleteDisplayByID(id):
    result = APIResponse()
    data = db.session.query(models.Display).filter(
        models.Display.isdel == 1,
        models.Display.id == id).first()
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
