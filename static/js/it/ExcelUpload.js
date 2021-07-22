layui.use(['upload', 'element', 'layer'], function () {
    var $ = layui.jquery
        , upload = layui.upload
        , element = layui.element
        , layer = layui.layer;

//选完文件后不自动上传
    upload.render({
        elem: '#changeFileBtn'
        , url: '/servers/upload_excel' //改成您自己的上传接口
        , auto: false
        , accept: 'file'
        , exts: 'xlsx|xls'
        //,multiple: true
        , bindAction: '#uploadFileBtn'
        , done: function (res) {
            layer.msg('上传成功');
            console.log(res)
        }
    });
});