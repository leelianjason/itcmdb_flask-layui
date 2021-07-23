# -*- coding : utf-8 -*-
import os, time
from flask import Blueprint, request, send_from_directory, jsonify, render_template
from werkzeug.datastructures import ImmutableMultiDict
from werkzeug.utils import secure_filename
from servers.tools.check_status import authentication
from servers.tools import itdata_db, excel_input
from ..system.utils import APIResponse
from config import config

itdata = Blueprint("itdata", __name__)
# 引用配置文件
setting = config.SoftConfig()


@itdata.route("/manageit", methods=['GET'], endpoint="manageit")
@authentication
def manageit():
    project_list = setting.project_list
    type_list = setting.type_list
    status_list = setting.status_list
    return render_template("/itdata/itData.html", status_list=status_list, type_list=type_list,
                           project_list=project_list)


@itdata.route("/addit", methods=['GET'], endpoint="addit")
@authentication
def addit():
    project_list = setting.project_list
    group_list = setting.group_list
    type_list = setting.type_list
    status_list = setting.status_list
    return render_template("/itdata/addItData.html", status_list=status_list, type_list=type_list,
                           project_list=project_list, group_list=group_list)


@itdata.route("/excel", methods=['GET'], endpoint="excel")
@authentication
def excel():
    return render_template("/itdata/uploadexcel.html")


@itdata.route("/recycle", methods=['GET'], endpoint="recycle")
@authentication
def recycle():
    project_list = setting.project_list
    type_list = setting.type_list
    status_list = setting.status_list
    return render_template("/itdata/recycle.html", status_list=status_list, type_list=type_list,
                           project_list=project_list)


@itdata.route("/plat", methods=["GET", "POST"], endpoint="plat")
@authentication
def platmanage():
    return "开发中......"


@itdata.route('/getall_by_page', methods=['GET', 'POST'], endpoint="getall_by_page")
@authentication
def getall_by_page():
    # 获取后端的layui分页参数
    params = request.args
    page = params.get("page")
    limit = params.get("limit")
    result = APIResponse()
    # 获取数据条数
    count = itdata_db.countAllData(params)
    result.count = count.count
    # 查询所有的数据
    response = itdata_db.getAllData(params)
    all_data = response.data
    if all_data:
        dataLimit = all_data.paginate(page=int(page), per_page=int(limit)).items
        for list in dataLimit:
            appendinfo = {
                "id": list.id,
                "num": list.num,
                "user": list.user,
                "project": list.project,
                "group": list.group,
                "owner": list.owner,
                "status": list.status,
                "type": list.type,
                "buytime": list.buytime,
                "droptime": list.droptime,
                "level": list.level,
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
        return jsonify(result.__dict__)


@itdata.route('/insert', methods=['POST'], endpoint="insert")
@authentication
def insert():
    info = ImmutableMultiDict.to_dict(request.form)
    result = itdata_db.addDataByID(info)
    print(result.__dict__)
    return jsonify(result.__dict__)


@itdata.route('/update_by_id', methods=['GET', 'POST'], endpoint="update_by_id")
@authentication
def update():
    if request.method == "GET":
        info = request.args
        id = info.get("id")
        response = itdata_db.selectServerDataBydID(id=id)
        # 设置Null值为空白字符传给前端
        maindisplay = response.maindisplay
        slavedisplay = response.slavedisplay
        if not maindisplay:
            maindisplay = ''
        if not slavedisplay:
            slavedisplay = ''
        content = {
            "id": response.id,
            "num": response.num,
            "user": response.user,
            "project": response.project,
            "group": response.group,
            "status": response.status,
            "type": response.type,
            "owner": response.owner,
            "level": response.level,
            "buytime": response.buytime,
            "droptime": response.droptime,
            "cpu": response.cpu,
            "mb": response.mb,
            "gpu": response.gpu,
            "mem": response.mem,
            "maindisk": response.maindisk,
            "slavedisk": response.slavedisk,
            "maindisplay": maindisplay,
            "slavedisplay": slavedisplay,
            "comments": response.comments,
        }
        project_list = setting.project_list
        group_list = setting.group_list
        status_list = setting.status_list
        type_list = setting.type_list
        return render_template("/itdata/updateItData.html", content=content, status_list=status_list,
                               type_list=type_list, project_list=project_list, group_list=group_list)
    elif request.method == "POST":
        info = ImmutableMultiDict.to_dict(request.form)
        result = itdata_db.updataDataByID(info)
        return jsonify(result.__dict__)


###layui测试

@itdata.route("/delete_by_id", methods=["POST"], endpoint="delete_by_id")
@authentication
def delete_by_id():
    params = request.form
    id = params.get("id")
    if id:
        result = itdata_db.deleteDataByID(id=id)
        return jsonify(result.__dict__)


# 获取excel模板
@itdata.route('/get_excel', methods=["GET"], endpoint="get_excel")
@authentication
def getexcel():
    basepath = os.path.dirname(os.path.abspath(__file__))
    # 获取当前目录，然后利用send_from_directory发送文件
    return send_from_directory(basepath + "../../../static/src/file", "template.xlsx", as_attachment=True)


# 导入excel数据
@itdata.route('/upload_excel', methods=['GET', 'POST'], endpoint="upload_excel")
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
    result = excel_input.insertFromExcel(upload_path)
    return jsonify(result.__dict__)


@itdata.route('/mutidelete', methods=['POST'], endpoint="mutidelete")
@authentication
def mutidelete():
    params = ImmutableMultiDict.to_dict(request.form)
    # 获取idlist的值并使用eval转换为list
    idlist = params.get("idlist")
    idlist = eval(idlist)
    # 依次删除id
    result = APIResponse()
    if idlist:
        for id in idlist:
            response = itdata_db.deleteDataByID(id=id)
            if response.code != 0:
                return jsonify(response.__dict__)
        result.code, result.msg = 0, "删除成功!"
        return jsonify(result.__dict__)
    else:
        result.code, result.msg = 1, "请选择删除的ID!"
        return jsonify(result.__dict__)


@itdata.route('/get_recycle', methods=['GET', 'POST'], endpoint="get_recycle")
@authentication
def get_recycle():
    params = request.args
    page = params.get("page")
    limit = params.get("limit")
    result = APIResponse()
    # 获取数据条数
    count = itdata_db.countRecycleData(params)
    result.count = count.count
    # 查询所有的数据
    response = itdata_db.getRecycleData(params)
    all_data = response.data
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
        return jsonify(result.__dict__)


@itdata.route('/recover', methods=['POST'], endpoint="recover")
@authentication
def recover():
    params = request.form
    id = params.get("id")
    if id:
        result = itdata_db.recoverDataByID(id=id)
        return jsonify(result.__dict__)


@itdata.route('/realdelete', methods=['POST'], endpoint="realdelete")
def realdelete():
    params = request.form
    id = params.get("id")
    if id:
        result = itdata_db.realDeleteByID(id=id)
        return jsonify(result.__dict__)


@itdata.route('/batch_recovery_delete', methods=['POST'], endpoint="batch_recovery_delete")
@authentication
def batch_recovery_delete():
    params = ImmutableMultiDict.to_dict(request.form)
    # 获取idlist的值并使用eval转换为list
    idlist = params.get("idlist")
    idlist = eval(idlist)
    # 依次删除id
    result = APIResponse()
    if idlist:
        for id in idlist:
            response = itdata_db.realDeleteByID(id=id)
            if response.code != 0:
                return jsonify(response.__dict__)
        result.code, result.msg = 0, "删除成功!"
        return jsonify(result.__dict__)
    else:
        result.code, result.msg = 1, "请选择删除的ID!"
        return jsonify(result.__dict__)
