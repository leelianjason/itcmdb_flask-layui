# -*- coding : utf-8 -*-
import os, time
from flask import Blueprint, request, send_from_directory, jsonify, render_template
from werkzeug.datastructures import ImmutableMultiDict
from werkzeug.utils import secure_filename
from servers.tools.check_status import authentication
from servers.tools import tool_db, tool_excel
from ..system.utils import Response
from config import config


class APIResponse(Response):
    def __init__(self):
        self.code = 0  # 0为正常，1为执行错误
        self.msg = ''
        self.count = ''
        self.data = []


servers = Blueprint("servers", __name__)
# 引用配置文件
setting = config.SoftConfig()


@servers.route("/it", methods=['GET'], endpoint="it")
@authentication
def itdata():
    project_list = setting.project_list
    type_list = setting.type_list
    status_list = setting.status_list
    return render_template("/IT/itData.html", status_list=status_list, type_list=type_list, project_list=project_list)


@servers.route("/addit", methods=['GET'], endpoint="addit")
@authentication
def addit():
    project_list = setting.project_list
    type_list = setting.type_list
    status_list = setting.status_list
    return render_template("/IT/addItData.html", status_list=status_list, type_list=type_list,
                           project_list=project_list)


@servers.route("/excel", methods=['GET'], endpoint="excel")
@authentication
def excel():
    return render_template("/IT/uploadExcel.html")


@servers.route("/recycle", methods=['GET'], endpoint="recycle")
@authentication
def recycle():
    project_list = setting.project_list
    type_list = setting.type_list
    status_list = setting.status_list
    return render_template("/IT/recycle.html", status_list=status_list, type_list=type_list, project_list=project_list)


@servers.route("/plat", methods=["GET", "POST"], endpoint="plat")
@authentication
def platmanage():
    return "开发中......"


@servers.route('/getall_by_page', methods=['GET', 'POST'], endpoint="getall_by_page")
@authentication
def getall_by_page():
    # 获取后端的layui分页参数
    params = request.args
    page = params.get("page")
    limit = params.get("limit")
    result = APIResponse()
    # 获取数据条数
    count = tool_db.countAllData(params)
    result.count = count.data.get("data")
    # 查询所有的数据
    response = tool_db.getAllData(params)
    all_data = response.data.get("data")
    if all_data:
        dataLimit = all_data.paginate(page=int(page), per_page=int(limit)).items
        for list in dataLimit:
            appendinfo = {
                "id": list.id,
                "num": list.num,
                "project": list.project,
                "user": list.user,
                "status": list.status,
                "type": list.type,
                "buytime": list.buytime,
                "droptime": list.droptime,
                "cpu": list.cpu,
                "mb": list.mb,
                "gpu": list.gpu,
                "mem": list.mem,
                "maindisk": list.maindisk,
                "slavedisk": list.slavedisk,
                "maindisplay": list.maindisplay,
                "slavedisplay": list.slavedisplay,
                "comments": list.comments,
            }
            result.data.append(appendinfo)
        result.code, result.msg = 0, "OK"
        return jsonify(result.__dict__)
    else:
        result.code, result.msg = 1, "未获取到数据"
        print(result.__dict__)
        return jsonify(result.__dict__)


@servers.route('/insert', methods=['POST'], endpoint="insert")
@authentication
def insert():
    info = ImmutableMultiDict.to_dict(request.form)
    if info:
        print("增加数据：", info)
        result = tool_db.addDataByID(info)
        if result.code == 200:
            print('成功', result.__dict__)
            return jsonify(result.__dict__)
        else:
            print('失败', result.__dict__)
            return jsonify(result.__dict__)


@servers.route('/update_by_id', methods=['GET', 'POST'], endpoint="update_by_id")
@authentication
def update():
    result = {}
    if request.method == "GET":
        info = request.args
        id = info.get("id")
        response = tool_db.selectServerDataBydID(id=id)
        content = {
            "id": response.id,
            "num": response.num,
            "project": response.project,
            "user": response.user,
            "status": response.status,
            "type": response.type,
            "buytime": response.buytime,
            "droptime": response.droptime,
            "cpu": response.cpu,
            "mb": response.mb,
            "gpu": response.gpu,
            "mem": response.mem,
            "maindisk": response.maindisk,
            "slavedisk": response.slavedisk,
            "maindisplay": response.maindisplay,
            "slavedisplay": response.slavedisplay,
            "comments": response.comments,
        }
        project_list = setting.project_list
        status_list = setting.status_list
        type_list = setting.type_list
        return render_template("/IT/updateItData.html", content=content, status_list=status_list,
                               type_list=type_list, project_list=project_list)
    elif request.method == "POST":
        info = ImmutableMultiDict.to_dict(request.form)
        response = tool_db.updataDataByID(info)
        if response:
            result["code"], result["msg"] = 0, "更新成功！"
            return jsonify(result)
        else:
            result["code"], result["msg"] = 1, "更新失败，找不到该数据！"
            return jsonify(result)


###layui测试

@servers.route("/delete_by_id", methods=["POST"], endpoint="delete_by_id")
@authentication
def delete_by_id():
    params = request.form
    id = params.get("id")
    result = {}
    if id:
        response = tool_db.deleteDataByID(id=id)
        if response:
            result["code"], result["msg"] = 0, "删除成功！"
            return jsonify(result)
        else:
            result["code"], result["msg"] = 1, "删除失败，找不到该数据！"
            return jsonify(result)


# 获取excel模板
@servers.route('/get_excel', methods=["GET"], endpoint="get_excel")
@authentication
def getexcel():
    basepath = os.path.dirname(os.path.abspath(__file__))
    # 获取当前目录，然后利用send_from_directory发送文件
    return send_from_directory(basepath + "../../../static/src/file", "serverinfo.xlsx", as_attachment=True)


# 导入excel数据
@servers.route('/upload_excel', methods=['GET', 'POST'], endpoint="upload_excel")
@authentication
def upload_excel():
    f = request.files["file"]
    fileName = secure_filename(f.filename)
    suffix = fileName.split(".")[-1]
    nowTime = int(time.time() * 1000)
    new_filename = str(nowTime) + "." + suffix
    basepath = os.path.dirname(os.path.abspath(__file__))
    upload_path = os.path.join(basepath, '../../tmp/upload', new_filename)
    f.save(upload_path)
    result = {}
    response = tool_excel.insertFromExcel(upload_path)
    if response:
        result["code"], result["msg"] = 0, "删除成功！"
        return jsonify(result)
    else:
        result["code"], result["msg"] = 1, "删除失败，找不到该数据！"
        return jsonify(result)


@servers.route('/mutidelete', methods=['POST'], endpoint="mutidelete")
@authentication
def mutidelete():
    params = request.form
    print(params.get("id"))


@servers.route('/get_recycle', methods=['GET', 'POST'], endpoint="get_recycle")
@authentication
def get_recycle():
    params = request.args
    page = params.get("page")
    limit = params.get("limit")
    result = APIResponse()
    # 获取数据条数
    count = tool_db.countRecycleData(params)
    result.count = count.data.get("data")
    # 查询所有的数据
    response = tool_db.getRecycleData(params)
    all_data = response.data.get("data")
    if all_data:
        dataLimit = all_data.paginate(page=int(page), per_page=int(limit)).items
        for list in dataLimit:
            appendinfo = {
                "id": list.id,
                "num": list.num,
                "project": list.project,
                "user": list.user,
                "status": list.status,
                "type": list.type,
                "buytime": list.buytime,
                "droptime": list.droptime,
                "cpu": list.cpu,
                "mb": list.mb,
                "gpu": list.gpu,
                "mem": list.mem,
                "maindisk": list.maindisk,
                "slavedisk": list.slavedisk,
                "maindisplay": list.maindisplay,
                "slavedisplay": list.slavedisplay,
                "comments": list.comments,
            }
            result.data.append(appendinfo)
        result.code, result.msg = 0, "OK"
        # print(result.__dict__)
        return jsonify(result.__dict__)
    else:
        result.code, result.msg = 1, "未获取到数据"
        print(result.__dict__)
        return jsonify(result.__dict__)


@servers.route('/recover', methods=['POST'], endpoint="recover")
@authentication
def recover():
    params = request.form
    id = params.get("id")
    if id:
        result = tool_db.recoverDataByID(id=id)
        return jsonify(result.__dict__)


@servers.route('/realdelete', methods=['POST'], endpoint="realdelete")
def realdelete():
    params = request.form
    id = params.get("id")
    if id:
        result = tool_db.realDeleteByID(id=id)
        return jsonify(result.__dict__)
