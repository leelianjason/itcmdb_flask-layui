layui.use(["table", "jquery", "layer"], function () {
    var table = layui.table;
    var $ = layui.jquery;
    var layer = layui.layer;
    var form = layer.form;

    function reload() {
        var keyWords = $("#keyWords").val();
        table.render({
            elem: "#userTable"
            , url: "/system/getUser?keyWords=" + keyWords
            , page: true
            , cols: [[
                {field: "userId", title: "ID", width: "5%"}
                , {field: "loginName", title: "账号", width: "25%"}
                , {field: "nickName", title: "昵称", width: "25%"}
                , {field: "roleName", title: "角色", width: "25%"}
                , {width: "20%", align: 'center', title: '操作', toolbar: '#tool'}
            ]]
        });
    }

    reload();
    // 搜索
    $("#SearchBtn").click(function () {
        reload();
    });
    //监听工具栏添加按钮
    $("#addUserBtn").click(function () {
        layer.open({
            type: 2,
            title: "添加用户",
            shade: false,
            area: ["600px", "400px"],
            content: "/system/addUser",
            end: function () {
                reload();
            }
        })
    });

    //监听行工具事件
    table.on('tool(userTable)', function (obj) {
        let layEvent = obj.event;
        let userId = obj.data.userId;
        console.log(obj)
        if (layEvent === 'edit') {
            layer.open({
                type: 2,
                title: "编辑",
                shade: false,
                area: ["600px", "400px"],
                content: "/system/updateUser?userId=" + userId,
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
                    url: "/system/deleteUser",
                    data: {"userId": userId},
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
});