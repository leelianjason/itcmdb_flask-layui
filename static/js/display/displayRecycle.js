layui.use(["table", "jquery", "layer"], function () {
    var table = layui.table;
    var $ = layui.jquery;
    var layer = layui.layer;

    function reload() {
        var keyWords = $("#keyWords").val();
        var status = $("#status").val();
        table.render({
            height: "full"
            , elem: "#displayRecycleTable"
            , url: "/display/getDisplayRecycle?keyWords=" + keyWords + "&status=" + status
            , cellMinWidth: 80
            , toolbar: '#topbar'
            , defaultToolbar: ['filter', 'exports', 'print']
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: "id", title: "ID", width: "4%"}
                , {field: "num", title: "编号", width: "18%"}
                , {field: "type", title: "型号", width: "8%"}
                , {field: "owner", title: "归属", width: "8%"}
                , {field: "usepc", title: "机器", width: "18%"}
                , {field: "status", title: "状态", width: "8%"}
                , {field: "buytime", title: "购买时间", width: "8%"}
                , {field: "droptime", title: "销毁时间", width: "8%"}
                , {field: "comments", title: "备注", width: "8%"}
                , {width: "10%", align: 'center', title: '操作', toolbar: '#toolbar'}
            ]],
            page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']//自定义分页布局
                , limits: [10, 20, 50, 100]
                , first: "首页" //不显示首页
                , last: "尾页" //不显示尾页
                , prev: "上一页"
                , next: "下一页"
            }
        });
    }

    reload();
    // 搜索
    $("#SearchBtn").click(function () {
        reload();
    });


    //监听行工具事件
    table.on('tool(displayRecycleTable)', function (obj) {
        let layEvent = obj.event;
        let id = obj.data.id;
        console.log(obj)
        if (layEvent === 'recycle') {
            layer.confirm('确定将数据从数据库恢复？', {
                btn: ['恢复', '取消'] //按钮
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "/display/recover",
                    data: {"id": id},
                    success: function (res) {
                        if (res.code === 0) {
                            layer.alert(res.msg, {icon: 6}, function () {
                                let index = layer.open(); //获取窗口索引
                                layer.close(index);
                                reload();
                            });
                        } else {
                            layer.alert(res.msg, {icon: 5});
                        }
                    },
                    error: function () {
                        layer.alert('操作失败，网络故障!', {icon: 5});
                    }
                })
            }, function () {
                layer.msg('取消恢复', {
                    time: 1000, //1s后自动关闭
                });
            });

        } else if (layEvent === 'realdel') {
            layer.confirm('确定将数据彻底从数据库删除？', {
                btn: ['删除', '取消'] //按钮
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "/display/realdelete",
                    data: {"id": id},
                    success: function (res) {
                        if (res.code === 0) {
                            layer.alert(res.msg, {icon: 6}, function () {
                                let index = layer.open(); //获取窗口索引
                                layer.close(index);
                                reload();
                            });
                        } else {
                            layer.alert(res.msg, {icon: 5});
                        }
                    },
                    error: function () {
                        layer.alert('操作失败，网络故障!', {icon: 5});
                    }
                })
            }, function () {
                layer.msg('取消删除', {
                    time: 1000, //1s后自动关闭
                });
            });
        }
    });
    //批量删除
    table.on('toolbar(displayRecycleTable)', function (obj) {
        var checkStatus = table.checkStatus(obj.config.id);
        var idlist = [];
        switch (obj.event) {
            case 'batchDel':
                var data = checkStatus.data;
                data.forEach(function (data) {
                    idlist.push(data.id);
                })
                console.log(idlist);
                var params = {
                    "idlist": JSON.stringify(idlist)
                };

                layer.confirm(params.idlist, {
                    btn: ['删除', '取消'] //按钮
                    , title: '确定将数据彻底从数据库删除？'
                }, function () {
                    $.ajax({
                        type: "POST",
                        url: "/display/batch_recovery_delete",
                        data: params,
                        success: function (res) {
                            if (res.code === 0) {
                                layer.alert(res.msg, {icon: 6}, function () {
                                    let index = layer.open(); //获取窗口索引
                                    layer.close(index);
                                    reload();
                                });
                            } else {
                                layer.alert(res.msg, {icon: 5});
                            }
                        },
                        error: function () {
                            layer.alert('操作失败，网络故障!', {icon: 5});
                        }
                    })
                }, function () {
                    layer.msg('取消删除', {
                        time: 1000, //1s后自动关闭
                    });
                });
                break;
        }
        ;
    });

});