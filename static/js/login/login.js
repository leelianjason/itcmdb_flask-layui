layui.use(["jquery", "form", "element"], function () {
    var $ = layui.jquery;
    var form = layui.form;
    var element = layui.element;

    form.on("submit(loginBtn)", function (data) {
        let params = {
            "loginName": data.field.loginName,
            "passWord": data.field.passWord
        };
        $.ajax({
            type: "POST",
            url: "/system/login",
            data: params,
            success: function (res) {
                if (res.code === 0) {
                    layer.alert(res.msg, {icon: 6, time: 2000}, function () {
                        let index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index); //再执行关闭
                        window.location.href = '/system/index';
                    });
                    layer.alert(res.msg, {icon: 6});
                    
                    window.location.href = '/system/index';
                    return false;
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