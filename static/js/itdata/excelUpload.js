layui.use(['upload', 'element', 'layer'], function () {
    var $ = layui.jquery
        , upload = layui.upload
        , element = layui.element
        , layer = layui.layer;

//选完文件后不自动上传
    upload.render({
        elem: '#changeFileBtn'
        , url: '/itdata/upload_excel' //改成您自己的上传接口
        , auto: false
        , accept: 'file'
        , exts: 'xlsx|xls'
        , bindAction: '#uploadFileBtn'
        , done: function (res) {
            if (res.code === 0) {
                layer.msg(res.msg, {icon: 6, time: 2000}, function () {
                });
            } else {
                layer.msg(res.msg, {icon: 5, time: 2000}, function () {
                });
            }
        }
    });
});