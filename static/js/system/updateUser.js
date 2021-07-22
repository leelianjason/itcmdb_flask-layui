layui.use(["form", "jquery", "element"], function () {
    var form = layui.form;
    var $ = layui.jquery;
    var element = layui.element;

    form.on("submit(save)", function (data) {
        let params = {
            "userId": data.field.userId,
            "loginName": data.field.loginName,
            "nickName": data.field.nickName,
            "passWord": data.field.passWord,
            "roleId": data.field.role,
        };
        $.ajax({
            type: "POST",
            url: "/system/updateUser",
            data: params,
            success: function (res) {
                if (res.code === 0) {
                    layer.alert(res.msg, {icon: 6}, function () {
                        let index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index); //再执行关闭
                    });
                } else {
                    layer.alert(res.msg, {icon: 5});
                }
            },
            error: function () {
                layer.alert('操作失败，网络故障!', {icon: 5});
            }
        })
    })

});