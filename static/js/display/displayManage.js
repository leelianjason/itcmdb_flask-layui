layui.use(["table", "jquery", "layer"], function () {
    var table = layui.table;
    var $ = layui.jquery;
    var layer = layui.layer;
    var form = layer.form;

    function reload() {
        var keyWords = $("#keyWords").val();
        var status = $("#status").val();
        table.render({
            height: "full"
            , elem: "#displayTable"
            , url: "/display/getdisplay?keyWords=" + keyWords + "&status=" + status
            , limit: 14
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
    //监听工具栏添加按钮
    $("#addDisplayBtn").click(function () {
        layer.open({
            type: 2,
            title: "添加显示器",
            shade: false,
            area: ["600px", "700px"],
            content: "/display/adddisply",
            end: function () {
                reload();
            }
        })
    });

    //监听行工具事件
    table.on('tool(displayTable)', function (obj) {
        let layEvent = obj.event;
        let id = obj.data.id;
        console.log(obj)
        if (layEvent === 'edit') {
            layer.open({
                type: 2,
                title: "编辑",
                shade: false,
                area: ["600px", "700px"],
                content: "/display/updateDisplay?id=" + id,
                end: function () {
                    reload();
                }
            })
        } else if (layEvent === 'del') {
            layer.confirm('是否删除？', {
                btn: ['删除', '取消'] //按钮
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "/display/deleteDisplay",
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
    table.on('toolbar(displayTable)', function (obj) {
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
                    , title: '是否批量删除？'
                }, function () {
                    $.ajax({
                        type: "POST",
                        url: "/display/mutidelete",
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