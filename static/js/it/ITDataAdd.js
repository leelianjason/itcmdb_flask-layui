layui.use(['form', 'layedit', 'laydate', 'element'], function () {
    var $ = layui.jquery;
    var element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
    var form = layui.form;
    var layedit = layui.layedit;
    var laydate = layui.laydate;
    var layer = layui.layer;


    // 新增数据
    //日期
    laydate.render({
        elem: '#buytime'
        , format: 'yyyy年MM月dd日'
    });

    //监听提交操作
    form.on('submit(subAddListBtn)', function (data) {
        $.ajax({
            url: "/servers/insert",
            method: "post",
            data: data.field,
            dataType: 'JSON',
            success: function (res) {
                if (res.code == '200') {
                    layer.msg("提交成功", {icon: 1, time: 2000}, function () {
                        location.reload();
                    }); //提交成功后刷新页面
                } else
                    alert(res.msg);
            },
            error: function (data) {
            }
        });
        return false;
    });

});
