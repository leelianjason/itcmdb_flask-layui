from flask import Blueprint, render_template, jsonify, request, session, redirect
from werkzeug.datastructures import ImmutableMultiDict
from servers.tools import system_db
from .utils import Response
from servers.tools.check_status import authentication
from config import config
import hashlib

system = Blueprint("system", __name__)

# 引用配置文件
setting = config.SoftConfig()


class APIResponse(Response):
    def __init__(self):
        self.code = 0  # 0为正常，1为执行错误
        self.msg = ''
        self.count = ''
        self.data = []


@system.route("/index", endpoint="index")
@authentication
def index():
    loginName = session.get("loginName")
    user = system_db.selectUserByloginName(loginName=loginName)
    # 获取系统信息
    content = {
        "systemName": setting.systemName,
        "company": setting.company,
        "user": user
    }
    return render_template("/index.html", content=content)


@system.route("/login", methods=["GET", "POST"], endpoint="login")
def login_system():
    result = APIResponse()
    if request.method == "GET":
        content = {
            "systemName": setting.systemName,
            "company": setting.company
        }
        return render_template("/login/login.html", content=content)
    elif request.method == "POST":
        params = request.form
        loginName = params.get("loginName")
        passwordtmp = params.get("passWord")
        # 简单的密码MD5加密对比
        passWord = hashlib.md5(passwordtmp.encode("utf-8")).hexdigest()
        userdata = system_db.selectUserByloginName(loginName=loginName)
        if userdata and userdata.password == passWord:
            session["loginName"] = userdata.login_name
            session["passWord"] = userdata.password
            session["nickName"] = userdata.nick_name
            result.code, result.msg = 0, "登录成功！"
        else:
            result.code, result.msg = 1, "用户名或密码错误！"
        return jsonify(result.__dict__)


@system.route("/logout", methods=["GET", "POST"])
def logout_system():
    session.clear()
    return redirect("/system/login")


# 管理用户和权限
@system.route("/user", methods=["GET", "POST"], endpoint="user")
@authentication
def usermanage():
    return render_template("/system/userManage.html")


@system.route("/role", methods=["GET", "POST"], endpoint="role")
@authentication
def rolemanage():
    return render_template("/system/roleManage.html")


@system.route("/menu", methods=["GET"], endpoint="menu")
@authentication
def menu():
    msg = {}
    msg["data"] = {}
    msg["data"]["list"] = []
    # loginName = session.get("loginName")
    loginName = session.get("loginName")
    user = system_db.selectUserByloginName(loginName=loginName)
    # 获取该角色的所有的该角色所属菜单
    roleResource = system_db.selectRoleResourceByRoleID(roleId=user.role_id)
    resourceList = []
    for roleResourceInfo in roleResource:
        # 拿权限中菜单的id idresource_id
        roleResourceId = roleResourceInfo.resource_id
        # 根据resource_id获取菜单id,存到临时list中
        resourceInfo = system_db.selectResourceById(resourceId=roleResourceId)
        resourceList.append(resourceInfo.pk_id)
    # print('该角色所属菜单id', resourceList)
    parentIdList = []
    for item in resourceList:
        # 根据菜单id 查询菜单信息
        info = system_db.selectResourceById(resourceId=item)
        resourceId = info.pk_id
        resourceName = info.name
        resourceUrl = info.url
        resourceParent = info.parent
        # print("resourceParent", resourceParent)
        if resourceParent not in parentIdList:
            # 如果菜单不在parentIdList中,就查询并生成父级菜单
            parentResource = system_db.selectResourceById(resourceId=resourceParent)
            parentIdList.append(resourceParent)
            appendInfo = {
                "id": parentResource.pk_id,
                "name": parentResource.name,
                "url": parentResource.url,
                "children": []
            }
            msg["data"]["list"].append(appendInfo)

        childrenAppendInfo = {
            "id": resourceId,
            "name": resourceName,
            "url": resourceUrl,
        }
        for childrenInfo in msg["data"]["list"]:
            if resourceParent == childrenInfo.get("id"):
                childrenInfo.get("children").append(childrenAppendInfo)
    # print("list", msg)
    return jsonify(msg)


@system.route("/getUser", methods=["GET"], endpoint="getUser")
@authentication
def getUser():
    params = request.args
    page = params.get("page")
    limit = params.get("limit")
    # 获取数据
    result = APIResponse()
    count = system_db.getUserNum(params)
    result.count = count.data.get("data")
    # print(params)
    response = system_db.getUser(params)
    userAll = response.data.get("data")
    if userAll:
        userLimit = userAll.paginate(page=int(page), per_page=int(limit)).items
        for user in userLimit:
            appendinfo = {
                "userId": user.pk_id,
                "loginName": user.login_name,
                "nickName": user.nick_name,
                "roleName": user.roleName.role_name
            }
            result.data.append(appendinfo)
        result.code, result.msg = 0, "OK"
        # print('获取总数据', result.__dict__)
        return jsonify(result.__dict__)
    else:
        result.code, result.msg = 1, "未获取到数据"
        return result.__dict__


@system.route("/addUser", methods=["GET", "POST"], endpoint="addUser")
@authentication
def addUser():
    if request.method == "GET":
        return render_template("/system/addUser.html")
    elif request.method == "POST":
        params = ImmutableMultiDict.to_dict(request.form)
        print(params)
        result = system_db.addUser(params)
        print('增加用户', result.__dict__)
        return result.__dict__


@system.route("/deleteUser", methods=["POST"], endpoint="deleteUser")
@authentication
def deleteUser():
    params = ImmutableMultiDict.to_dict(request.form)
    userId = params.get("userId")
    if userId:
        result = system_db.deleteUser(userId)
        print('删除', userId, result.__dict__)
        return jsonify(result.__dict__)


@system.route("/updateUser", methods=["GET", "POST"], endpoint="updateUser")
@authentication
def updateUser():
    if request.method == "GET":
        params = request.args
        userId = params.get("userId")
        user = system_db.selectUserById(userId)
        roleList = system_db.getRoleAll()
        content = {
            "user": user,
            "roleList": roleList
        }
        return render_template("/system/updateUser.html", content=content)
    elif request.method == "POST":
        params = ImmutableMultiDict.to_dict(request.form)
        result = system_db.updateUser(params)
        # print(result.__dict__)
        return jsonify(result.__dict__)


'''
角色管理
'''


@system.route("/getRole", methods=["GET", "POST"], endpoint="getRole")
@authentication
def getRole():
    result = APIResponse()

    if request.method == "GET":
        params = request.args
        page = params.get("page")
        limit = params.get("limit")
        # 获取数据
        count = system_db.getRoleNum(params)
        result.count = count.data.get("data")
        response = system_db.getRole(params)
        roleAll = response.data.get("data")
        if roleAll:
            roleLimit = roleAll.paginate(page=int(page), per_page=int(limit)).items
            for role in roleLimit:
                appendinfo = {
                    "roleId": role.pk_id,
                    "roleName": role.role_name,
                    "roleDes": role.role_des,
                }
                result.data.append(appendinfo)
            result.code, result.msg = 0, "OK"
            # print('getRole', result.__dict__)
            return jsonify(result.__dict__)
        else:
            result.code, result.msg = 1, "未获取到数据"
            return jsonify(result.__dict__)
    elif request.method == "POST":
        roleList = system_db.getRoleAll()
        for role in roleList:
            appendinfo = {
                "roleId": role.pk_id,
                "roleName": role.role_name
            }
            result.data.append(appendinfo)
        result.code, result.msg = 0, "OK"
        return jsonify(result.__dict__)


@system.route("/addRole", methods=["GET", "POST"], endpoint="addRole")
@authentication
def addRole():
    if request.method == "GET":
        return render_template("/system/addRole.html")
    elif request.method == "POST":
        params = ImmutableMultiDict.to_dict(request.form)
        result = system_db.addRole(params)
        print('addRole', result.__dict__)
        return jsonify(result.__dict__)


@system.route("/updateRole", methods=["GET", "POST"], endpoint="updateRole")
@authentication
def updateRole():
    if request.method == "GET":
        params = request.args
        roleId = params.get("roleId")

        # 获取数据库中所有的菜单级别
        resourceList = system_db.selectResourceAll()
        resourceItems = []
        for resourceItem in resourceList:
            resourceId = resourceItem.pk_id
            resourceName = resourceItem.name
            resourceParent = resourceItem.parent
            # 是-1，就生成父列表
            if resourceParent == -1:
                appendInfo = {
                    "resourceId": resourceId,
                    "resourceName": resourceName,
                    "children": []
                }
                resourceItems.append(appendInfo)
            else:
                # 不是-1 就依次将内容放到父列表的list中
                for parentInfo in resourceItems:
                    if resourceParent == parentInfo["resourceId"]:
                        appendChildrenInfo = {
                            "resourceId": resourceId,
                            "resourceName": resourceName,
                            "checked": False
                        }
                        parentInfo["children"].append(appendChildrenInfo)
        ## 获取角色已有的权限，并标记checked= True
        roleResource = system_db.selectRoleResourceByRoleID(roleId)
        # 1.查询该角色的菜单信息
        # 2.查询系统中所有菜单信息
        # 3.将所有菜单信息id与角色的菜单匹配，相等则设置checked= True
        roleResourceList = []
        for roleResourceItem in roleResource:
            roleResourceId = roleResourceItem.resource_id
            roleResourceList.append(roleResourceId)
        for item in resourceItems:
            for roleResourceChildrenItems in item["children"]:
                if roleResourceChildrenItems["resourceId"] in roleResourceList:
                    roleResourceChildrenItems["checked"] = True
        # 获取角色的id，描述，角色名
        roledata = system_db.selectRoleById(roleId)
        content = {
            "roleId": roledata.pk_id,
            "roleDes": roledata.role_des,
            "roleName": roledata.role_name,
            "resourceList": resourceItems
        }
        print('content', content)
        return render_template("/system/updateRole.html", content=content)

    elif request.method == "POST":
        # print(ImmutableMultiDict.to_dict(request.form))
        params = request.form
        # 更新角色信息、描述
        responserole = system_db.updateRole(params)
        # 删除权限，再写入新权限，resource为迭代器
        roleId = params.get("roleId")
        resource = filter(None, params.get("resource").split(","))
        result = system_db.updateRoleResource(roleId, resource)
        return jsonify(result.__dict__)


@system.route("/deleteRole", methods=["GET", "POST"], endpoint="deleteRole")
@authentication
def deleteRole():
    params = request.form
    roleId = params.get("roleId")
    result = system_db.deleteRoleById(roleId)
    return jsonify(result.__dict__)
