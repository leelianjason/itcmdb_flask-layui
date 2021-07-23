layui.use(['form', 'layedit', 'laydate', 'element'], function () {
    var $ = layui.jquery;
    var form = layui.form;
    var laydate = layui.laydate;
    var layer = layui.layer;


    // 新增数据
    //日期
    laydate.render({
        elem: '#buytime'
        , format: 'yyyy/MM/dd'
    });

    //监听提交操作
    form.on('submit(subAddListBtn)', function (data) {
        $.ajax({
            url: "/itdata/insert",
            method: "post",
            data: data.field,
            dataType: 'JSON',
            success: function (res) {
                if (res.code === 0) {
                    layer.msg(res.msg, {icon: 6, time: 2000}, function () {
                        // location.reload();
                    });
                } else {
                    layer.msg(res.msg, {icon: 5, time: 2000}, function () {
                        // location.reload();
                    });
                }
            },
            error: function (data) {
            }
        });
        //禁止刷新否则弹窗会消失
        return false;
    });

});
