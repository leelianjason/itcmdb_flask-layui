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
            elem: '#itDataTable',
            url: "/itdata/getall_by_page?keyWords=" + keyWords + "&status=" + status + "&project=" + project + "&type=" + type,
            limit: 14,
            cellMinWidth: 80,
            toolbar: '#topbar',
            defaultToolbar: ['filter', 'exports', 'print'],
            cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', width: 60, title: 'id', sort: true}
                , {field: 'num', width: 250, title: '编号'}
                , {field: 'user', width: 100, title: '使用人'}
                , {field: 'project', width: 100, filter: true, title: '项目'}
                , {field: 'group', width: 100, filter: true, title: '部门'}
                , {field: 'status', width: 100, title: '状态'}
                , {field: 'type', width: 100, title: '类型'}
                , {field: 'cpu', width: 150, title: 'CPU型号'}
                , {field: 'mb', width: 150, title: '主板型号'}
                , {field: 'gpu', width: 150, title: '显卡型号'}
                , {field: 'mem', width: 150, title: '内存容量'}
                , {field: 'maindisk', width: 150, title: '主硬盘容量'}
                , {field: 'slavedisk', width: 150, title: '数据盘容量'}
                , {field: 'maindisplay', width: 200, title: '主显示器编号'}
                , {field: 'slavedisplay', width: 200, title: '副显示器编号'}
                , {field: 'level', width: 100, title: '等级'}
                , {field: 'owner', width: 100, title: '归属'}
                , {field: 'buytime', width: 120, title: '购买时间'}
                , {field: 'droptime', width: 120, title: '销毁时间'}
                , {field: 'comments', width: 100, title: '备注'}
                , {fixed: 'right', width: 150, title: '操作', toolbar: '#toolbar'}
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

    //批量删除
    table.on('toolbar(itDataTable)', function (obj) {
        var checkStatus = table.checkStatus(obj.config.id);
        var idlist = [];
        switch (obj.event) {
            case 'batchDel':
                var data = checkStatus.data;
                data.forEach(function (data) {
                    idlist.push(data.id);
                })
                console.log(idlist);
                var params = {
                    "idlist": JSON.stringify(idlist)
                };

                layer.confirm(params.idlist, {
                    btn: ['删除', '取消'] //按钮
                    , title: '是否批量删除？'
                }, function () {
                    $.ajax({
                        type: "POST",
                        url: "/itdata/mutidelete",
                        data: params,
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
                }, function () {
                    layer.msg('取消删除', {
                        time: 1000, //1s后自动关闭
                    });
                });
                break;
        }
        ;
    });
    //删除与编辑
    table.on('tool(itDataTable)', function (obj) {
        let layEvent = obj.event;
        let id = obj.data.id;
        console.log(obj)
        if (layEvent === 'edit') {
            layer.open({
                type: 2,
                title: "编辑",
                shade: false,
                area: ["600px", "700px"],
                content: "/itdata/update_by_id?id=" + id,
                end: function () {
                    reload();
                }
            })
        } else if (layEvent === 'del') {
            layer.confirm('是否删除？', {
                btn: ['删除', '取消'] //按钮
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "/itdata/delete_by_id",
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
            }, function () {
                layer.msg('取消删除', {
                    time: 1000, //1s后自动关闭
                });
            });


        }
    });
    // //触发事件
    // var active = {
    //     addDataBtn: function () {
    //         //addDataBtn 点击时切换到指定Tab项
    //         element.tabChange('tabList', '22'); //切换到：添加頁面
    //     }
    // };
    //
    // $('.site-demo-active').on('click', function () {
    //     var othis = $(this), type = othis.data('type');
    //     active[type] ? active[type].call(this, othis) : '';
    // });
    //
    // //Hash地址的定位
    // var layid = location.hash.replace(/^#tabList=/, '');
    // element.tabChange('tabList', layid);
    //
    // element.on('tab(tabList)', function (elem) {
    //     location.hash = 'tabList=' + $(this).attr('lay-id');
    // });

});