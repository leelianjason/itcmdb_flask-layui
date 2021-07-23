layui.use(["jquery", "form", "element"], function () {
    var $ = layui.jquery;
    var form = layui.form;
    var layer = layui.layer;

    form.on("submit(loginBtn)", function (data) {
        let params = {
            "loginName": data.field.loginName,
            "passWord": data.field.passWord
        };
        console.log(params)
        $.ajax({
            type: "POST",
            url: "/system/login",
            data: params,
            success: function (res) {
                if (res.code === 0) {
                    layer.msg(res.msg, {icon: 1, time: 1000, shade: 0.4}, function () {
                        window.location.href = '/system/index';
                    });
                } else {
                    layer.alert(res.msg, {icon: 5, time: 2000});
                }
            },
            error: function () {
                layer.alert('登录失败，网络故障!', {icon: 5});
            }
        })

    })
});