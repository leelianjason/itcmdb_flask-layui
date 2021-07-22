layui.use(["form", "jquery", "element", "laydate"], function () {
    var form = layui.form;
    var $ = layui.jquery;
    var laydate = layui.laydate;
    var element = layui.element;

    laydate.render({
        elem: '#buytime'
        , format: 'yyyy年MM月dd日'
    });
    laydate.render({
        elem: '#droptime'
        , format: 'yyyy年MM月dd日'
    });
    form.on("submit(subUpdateBtn)", function (data) {
        $.ajax({
            url: "/servers/update_by_id",
            method: "post",
            data: data.field,
            dataType: 'JSON',
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