layui.use(["element", "jquery", "layer", "laydate", "form"], function () {
    var $ = layui.jquery;
    var layer = layui.layer;
    var form = layui.form;
    var laydate = layui.laydate;

    //日期
    laydate.render({
        elem: '#buytime'
        , format: 'yyyy/MM/dd'
    });
    laydate.render({
        elem: '#droptime'
        , format: 'yyyy/MM/dd'
    });

    form.on("submit(save)", function (data) {
        let params = {
            "id": data.field.id,
            "num": data.field.num,
            "type": data.field.type,
            "owner": data.field.owner,
            "usepc": data.field.usepc,
            "status": data.field.status,
            "buytime": data.field.buytime,
            "droptime": data.field.droptime,
            "comments": data.field.comments,
        };
        $.ajax({
            type: "POST",
            url: "/display/updateDisplay",
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