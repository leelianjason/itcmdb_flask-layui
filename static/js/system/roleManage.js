layui.use(["table", "jquery", "layer"], function () {
    var table = layui.table;
    var $ = layui.jquery;
    var layer = layui.layer;
    var form = layer.form;

    function reload() {
        var keyWords = $("#keyWords").val();
        table.render({
            elem: "#roleTable"
            , url: "/system/getRole?keyWords=" + keyWords
            , page: true
            , cols: [[
                {field: "roleId", title: "角色ID", width: "5%"}
                , {field: "roleName", title: "角色名称", width: "35%"}
                , {field: "roleDes", title: "角色描述", width: "35%"}
                , {width: "25%", align: 'center', title: '操作', toolbar: '#tool'}
            ]]
        });
    }

    reload();
    // 搜索
    $("#SearchBtn").click(function () {
        reload();
    });

    $('#add').click(function () {
        layer.open({
            type: 2,
            shade: false,
            title: "添加角色",
            area: ["400px", "300px"],
            content: "/system/addRole",
            end: function () {
                reload();
            }
        })

    })


    //监听行工具事件
    table.on('tool(roleTable)', function (obj) {
        let layEvent = obj.event;
        let roleId = obj.data.roleId;
        console.log(obj)
        if (layEvent === 'edit') {
            layer.open({
                type: 2,
                title: "编辑",
                shade: false,
                area: ["450px", "650px"],
                content: "/system/updateRole?roleId=" + roleId,
                end: function () {
                    reload();
                }
            })
        } else if (layEvent === 'del') {
            $.ajax({
                type: "POST",
                url: "/system/deleteRole",
                data: {"roleId": roleId},
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
        }
    });
});