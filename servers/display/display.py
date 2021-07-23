# -*- coding : utf-8 -*-
import os, time
from flask import Blueprint, request, jsonify, render_template
from werkzeug.datastructures import ImmutableMultiDict
from servers.tools.check_status import authentication
from servers.tools import display_db
from ..system.utils import APIResponse
from config import config

display = Blueprint("display", __name__)
# 引用配置文件
setting = config.SoftConfig()


@display.route('/showdisplay', methods=["GET", "POST"], endpoint="display")
@authentication
def showdisplay():
    status_list = setting.status_list
    return render_template("/display/displayManage.html", status_list=status_list)


@display.route('/getdisplay', methods=["GET"], endpoint="getdisplay")
@authentication
def getdisplay():
    params = request.args
    page = params.get("page")
    limit = params.get("limit")
    # 获取显示器数据
    result = APIResponse()
    count = display_db.countDisplayNum(params)
    result.count = count.data.get("data")

    response = display_db.getDisplayData(params)
    displayALL = response.data.get("data")
    if displayALL:
        displaylimt = displayALL.paginate(page=int(page), per_page=int(limit)).items
        for display in displaylimt:
            appendinfo = {
                "id": display.id,
                "num": display.num,
                "type": display.type,
                "owner": display.owner,
                "usepc": display.usepc,
                "status": display.status,
                "buytime": display.buytime,
                "droptime": display.droptime,
                "comments": display.comments,
            }
            result.data.append(appendinfo)
        result.code, result.msg = 0, "OK"
        return jsonify(result.__dict__)
    else:
        result.code, result.msg = 1, "未获取到数据"
        return jsonify(result.__dict__)


@display.route('/adddisply', methods=["GET", "POST"], endpoint="adddisply")
@authentication
def adddisply():
    if request.method == "GET":
        status_list = setting.status_list
        return render_template("/display/addDisplay.html", status_list=status_list)
    elif request.method == "POST":
        params = ImmutableMultiDict.to_dict(request.form)

        result = display_db.addDisplay(params=params)
        return jsonify(result.__dict__)


@display.route('/updateDisplay', methods=["GET", "POST"], endpoint="updateDisplay")
@authentication
def updateDisplay():
    if request.method == "GET":
        info = request.args
        id = info.get("id")
        response = display_db.selectDisplayById(id)
        content = {
            "id": response.id,
            "num": response.num,
            "type": response.type,
            "owner": response.owner,
            "usepc": response.usepc,
            "status": response.status,
            "isdel": response.isdel,
            "buytime": response.buytime,
            "comments": response.comments
        }
        status_list = setting.status_list
        return render_template("/display/updateDisplay.html", content=content, status_list=status_list)
    elif request.method == "POST":
        params = ImmutableMultiDict.to_dict(request.form)
        result = display_db.updateDisplay(params)
        return jsonify(result.__dict__)


@display.route('/deleteDisplay', methods=["POST"], endpoint="deleteDisplay")
@authentication
def deleteDisplay():
    params = request.form
    id = params.get("id")
    if id:
        result = display_db.deleteDataById(id=id)
        return jsonify(result.__dict__)


@display.route('/mutidelete', methods=['POST'], endpoint="mutidelete")
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
            response = display_db.deleteDataById(id=id)
            if response.code != 0:
                return jsonify(response.__dict__)
        result.code, result.msg = 0, "删除成功!"
        return jsonify(result.__dict__)
    else:
        result.code, result.msg = 1, "请选择删除的ID!"
        return jsonify(result.__dict__)


@display.route('/recycledisplay', methods=["GET"], endpoint="recycledisplay")
@authentication
def recycledisplay():
    status_list = setting.status_list
    return render_template("/display/displayRecycle.html", status_list=status_list)


@display.route('/getDisplayRecycle', methods=["GET", "POST"], endpoint="getDisplayRecycle")
@authentication
def getDisplayRecycle():
    params = request.args
    page = params.get("page")
    limit = params.get("limit")
    # 获取显示器数据
    result = APIResponse()
    count = display_db.countDisplayRecycleNum(params)
    result.count = count.data.get("data")

    response = display_db.getDisplayRecycleData(params)
    displayALL = response.data.get("data")
    if displayALL:
        displaylimt = displayALL.paginate(page=int(page), per_page=int(limit)).items
        for display in displaylimt:
            appendinfo = {
                "id": display.id,
                "num": display.num,
                "type": display.type,
                "owner": display.owner,
                "usepc": display.usepc,
                "status": display.status,
                "buytime": display.buytime,
                "droptime": display.droptime,
                "comments": display.comments,
            }
            result.data.append(appendinfo)
        result.code, result.msg = 0, "OK"
        return jsonify(result.__dict__)
    else:
        result.code, result.msg = 1, "未获取到数据"
        return jsonify(result.__dict__)


@display.route('/recover', methods=['POST'], endpoint="recover")
@authentication
def recover():
    params = request.form
    id = params.get("id")
    if id:
        result = display_db.recoverDisplayDataByID(id)
        return jsonify(result.__dict__)


@display.route('/realdelete', methods=['POST'], endpoint="realdelete")
def realdelete():
    params = request.form
    id = params.get("id")
    if id:
        result = display_db.realDeleteDisplayByID(id)
        return jsonify(result.__dict__)


@display.route('/batch_recovery_delete', methods=['POST'], endpoint="batch_recovery_delete")
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
            response = display_db.realDeleteDisplayByID(id=id)
            if response.code != 0:
                return jsonify(response.__dict__)
        result.code, result.msg = 0, "删除成功!"
        return jsonify(result.__dict__)
    else:
        result.code, result.msg = 1, "请选择删除的ID!"
        return jsonify(result.__dict__)
