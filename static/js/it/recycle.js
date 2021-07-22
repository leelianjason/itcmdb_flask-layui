layui.use(["table", "jquery", "layer"], function () {
    var table = layui.table;
    var $ = layui.jquery;
    var layer = layui.layer;
    var form = layer.form;

    //渲染数据表格
    function reload() {
        var keyWords = $("#keyWords").val();
        var status = $("#status").val();
        var project = $("#project").val();
        var type = $("#type").val();
        table.render({
            height: "full",
            elem: '#recycleTable',
            url: "/servers/get_recycle?keyWords=" + keyWords + "&status=" + status + "&project=" + project + "&type=" + type,
            page: true,
            cellMinWidth: 80,
            toolbar: '#itDatatoolbar',
            defaultToolbar: ['filter', 'exports', 'print'],
            cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', width: 60, title: 'id', sort: true}
                , {field: 'num', width: 200, title: '编号'}
                , {field: 'project', width: 100, filter: true, title: '项目'}
                , {field: 'user', filter: true, title: '使用人'}
                , {field: 'status', filter: true, title: '状态'}
                , {field: 'type', filter: true, title: '类型'}
                , {field: 'buytime', title: '购买时间'}
                , {field: 'droptime', title: '销毁时间'}
                , {field: 'cpu', title: 'CPU型号'}
                , {field: 'mb', title: '主板型号'}
                , {field: 'gpu', title: '显卡型号'}
                , {field: 'mem', title: '内存容量'}
                , {field: 'maindisk', title: '主硬盘容量'}
                , {field: 'slavedisk', title: '数据盘容量'}
                , {field: 'maindisplay', title: '主显示器编号'}
                , {field: 'slavedisplay', title: '副显示器编号'}
                , {field: 'comments', title: '备注'}
                , {fixed: 'right', title: '操作', toolbar: '#itDatabar', width: 150}
            ]],
            page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']//自定义分页布局
                , limits: [10, 20, 50, 100]
                , first: "首页" //不显示首页
                , last: "尾页" //不显示尾页
                , prev: "上一页"
                , next: "下一页"
            }
        });
    }

    reload();

    // 搜索
    $("#SearchBtn").click(function () {
        reload();
    });


    table.on('toolbar(itDataTable)', function (obj) {
        var checkStatus = table.checkStatus(obj.config.id);
        switch (obj.event) {
            case 'getCheckData':
                var data = checkStatus.data;
                layer.alert(JSON.stringify(data));
                break;
            case 'getCheckLength':
                var data = checkStatus.data;
                layer.msg('选中了：' + data.length + ' 个');
                break;
            case 'isAll':
                layer.msg(checkStatus.isAll ? '全选' : '未全选');
                break;
        }
        ;
    });

    //监听行工具事件
    table.on('tool(recycleTable)', function (obj) {
        let layEvent = obj.event;
        let id = obj.data.id;
        console.log(obj)
        if (layEvent === 'recycle') {
            $.ajax({
                type: "POST",
                url: "/servers/recover",
                data: {"id": id},
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
        } else if (layEvent === 'realdel') {
            $.ajax({
                type: "POST",
                url: "/servers/realdelete",
                data: {"id": id},
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