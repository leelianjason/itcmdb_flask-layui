from servers.tools import models
from flask_sqlalchemy import SQLAlchemy
import time, hashlib
from ..system.utils import Response

db = SQLAlchemy()


class APIResponse(Response):
    def __init__(self):
        self.code = 0  # 0为正常，1为执行错误
        self.msg = ''
        self.data = dict()


def getUserNum(params):
    keyWords = params.get("keyWords")

    result = APIResponse()
    try:
        response = db.session.query(models.User).filter(
            models.User.delete_flag == 0,
            models.User.login_name.like("%" + keyWords + "%") if keyWords is not None else ""
        ).count()
        result.code, result.msg, result.data = 0, "OK", {"data": response}
        return result
    except Exception as e:
        result.code, result.msg = 1, "执行错误：{0}".format(e)
        raise result
    finally:
        db.session.close()


def getUser(params):
    keyWords = params.get("keyWords")

    result = APIResponse()
    try:
        response = db.session.query(models.User).filter(
            models.User.delete_flag == 0,
            models.User.login_name.like("%" + keyWords + "%") if keyWords is not None else "",
        )
        result.code, result.msg, result.data = 0, "OK", {"data": response}
        return result
    except Exception as e:
        result.code, result.msg = 1, "执行错误：{0}".format(e)
        raise result
    finally:
        db.session.close()


def addUser(params):
    login_name = params.get("loginName")
    nick_name = params.get("nickName")
    role_id = params.get("roleId")
    passwordtmp = params.get("passWord")
    password = hashlib.md5(passwordtmp.encode("utf-8")).hexdigest()

    result = APIResponse()
    if nick_name and nick_name and role_id:
        nowtime = time.strftime("%Y-%m-%d %H:%M:%S")
        if db.session.query(models.User).filter(models.User.login_name == login_name).first():
            result.code, result.msg = 1, "账号{0}已注册".format(login_name)
            return result
        else:
            try:
                data = models.User(
                    login_name=login_name,
                    nick_name=nick_name,
                    role_id=role_id,
                    password=password,
                    create_time=nowtime,
                    update_time=nowtime)
                db.session.add(data)
                db.session.commit()
                result.code, result.msg = 0, "OK,添加用户成功"
                return result
            except Exception as e:
                db.session.rollback()
                result.code, result.msg = 1, "执行错误：{0}".format(e)
                print(result)
                raise result
            finally:
                db.session.close()


# 根据ID获取用户
def selectUserById(userId):
    result = db.session.query(models.User).filter(
        models.User.delete_flag == 0,
        models.User.pk_id == userId
    ).first()
    return result


# 根据登录名判断用户
def selectUserByloginName(loginName):
    result = db.session.query(models.User).filter(
        models.User.delete_flag == 0,
        models.User.login_name == loginName
    ).first()
    return result


def deleteUser(userId):
    response = selectUserById(userId)
    result = APIResponse()
    try:
        response.delete_flag = 1,
        db.session.commit()
        result.code, result.msg = 0, "删除成功！"
        return result
    except Exception as e:
        result.code, result.msg = 1, '删除执行错误：{0}'.format(e)
        db.session.rollback()
        raise result
    finally:
        db.session.close()


def updateUser(params):
    pk_id = params.get("userId")
    login_name = params.get("loginName")
    nick_name = params.get("nickName")
    passwordtmp = params.get("passWord")
    role_id = params.get("roleId")

    result = APIResponse()
    response = selectUserById(pk_id)
    if response and login_name:
        try:
            nowtime = time.strftime("%Y-%m-%d %H:%M:%S")
            # 如果传递了密码就修改密码
            if passwordtmp:
                password = hashlib.md5(passwordtmp.encode("utf-8")).hexdigest()
                response.password = password
            response.login_name = login_name
            response.nick_name = nick_name
            response.role_id = role_id
            response.update_time = nowtime
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


'''
角色管理
'''


def getRoleNum(params):
    keyWords = params.get("keyWords")
    result = APIResponse()
    try:
        response = db.session.query(models.Role).filter(
            models.Role.delete_flag == 0,
            models.Role.role_name.like("%" + keyWords + "%") if keyWords is not None else ""
        ).count()
        result.code, result.msg, result.data = 0, 'OK', {"data": response}
        return result
    except Exception as e:
        result.code, result.msg = 1, '程序执行错误：{0}'.format(e)
        raise result
    finally:
        db.session.close()


def getRole(params):
    keyWords = params.get("keyWords")
    result = APIResponse()
    try:
        response = db.session.query(models.Role).filter(
            models.Role.delete_flag == 0,
            models.Role.role_name.like("%" + keyWords + "%") if keyWords is not None else ""
        )
        result.code, result.msg, result.data = 0, 'OK', {"data": response}
        return result
    except Exception as e:
        result.code, result.msg = 1, '执行错误：{0}'.format(e)
        raise result
    finally:
        db.session.close()


# 获取所有的角色
def getRoleAll():
    try:
        response = db.session.query(models.Role).filter(models.Role.delete_flag == 0).all()
        return response
    except Exception as e:
        raise e
    finally:
        db.session.close()


def addRole(pamams):
    role_name = pamams.get("roleName")
    role_des = pamams.get("roleDes")
    result = APIResponse()
    if role_name and role_des:
        nowtime = time.strftime("%Y-%m-%d %H:%M:%S")
        if db.session.query(models.Role).filter(models.Role.role_name == role_name).first():
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
                raise result
            finally:
                db.session.close()


# 根据id获取角色信息
def selectRoleById(roleId):
    result = db.session.query(models.Role).filter(
        models.Role.delete_flag == 0,
        models.Role.pk_id == roleId
    ).first()
    return result


# 获取角色id所有权限信息
def selectRoleResourceByRoleID(roleId):
    result = db.session.query(models.RoleResource).filter(
        models.RoleResource.role_id == roleId
    ).all()
    return result


# 获取角色信息，并更新角色描述
def updateRole(params):
    pk_id = params.get("roleId")
    role_name = params.get("roleName")
    role_des = params.get("roleDes")
    nowtime = time.strftime("%Y-%m-%d %H:%M:%S")

    result = APIResponse()
    try:
        roledata = selectRoleById(pk_id)
        roledata.role_name = role_name
        roledata.role_des = role_des
        roledata.update_time = nowtime
        db.session.commit()
        result.code, result.msg = 0, "修改数据成功"
        return result
    except Exception as e:
        db.session.rollback()
        result.code, result.msg = 1, "修改数据失败{0}".format(e)
        raise result
    finally:
        db.session.close()


# 更新角色权限
def updateRoleResource(roleId, resource):
    result = APIResponse()
    # 删除旧权限
    db.session.query(models.RoleResource).filter(
        models.RoleResource.role_id == roleId
    ).delete()
    db.session.commit()
    # 设置新权限
    nowtime = time.strftime("%Y-%m-%d %H:%M:%S")
    try:
        for resourceId in resource:
            data = models.RoleResource(
                role_id=roleId,
                resource_id=int(resourceId),
                create_time=nowtime,
                update_time=nowtime
            )
            db.session.add(data)
            db.session.commit()
        result.code, result.msg = 0, "OK,修改权限成功"
        return result
    except Exception as e:
        db.session.rollback()
        result.code, result.msg = 1, "执行错误：{0}".format(e)
        raise result
    finally:
        db.session.close()


def deleteRoleById(roleId):
    response = selectRoleById(roleId)
    result = APIResponse()
    try:
        response.delete_flag = 1,
        db.session.commit()
        result.code, result.msg = 0, "删除成功！"
        return result
    except Exception as e:
        result.code, result.msg = 1, '删除执行错误：{0}'.format(e)
        db.session.rollback()
        raise result
    finally:
        db.session.close()


# 获取所有的菜单级别
def selectResourceAll():
    result = db.session.query(models.Resource).all()
    return result


# 根据id查询菜单信息
def selectResourceById(resourceId):
    result = db.session.query(models.Resource).filter(
        models.Resource.pk_id == resourceId
    ).first()
    return result
