layui.use(["jquery", "layer", "element"], function () {
    var $ = layui.jquery;
    var layer = layui.layer;
    var element = layui.element;


    //动态加载导航栏
    $.ajax({
        type: "GET",
        contentType: "application/json;charset=utf-8",
        url: "/system/menu",
        dataType: "json",
        success: function (data) {
            let menu = $("#menu");
            let resourceList = data.data.list;
            //遍历一级目录，并动态生成一级目录
            for (let i = 0; i < resourceList.length; i++) {
                menu.append('<li class="layui-nav-item"><a class="" data-url="">' + resourceList[i].name + '</a><dl class="layui-nav-child" id="menu' + resourceList[i].id + '"></dl></li>');
                let childrenMenu = $("#menu" + resourceList[i].id);
                //遍历子目录，并动态生成子目录
                for (let m = 0; m < resourceList[i].children.length; m++) {
                    childrenMenu.append('<dd title="' + resourceList[i].children[m].name + '"><a id="' + resourceList[i].children[m].id + '" target="body" data-url="' + resourceList[i].children[m].url + '">' + resourceList[i].children[m].name + '</a></dd>');
                }
            }
            //重新渲染导航栏，否则无法完全加载动态生成的目录
            element.render("nav", "menu");
        },
        error: function () {
            layer.alert("导航栏加载失败！", {icon: 5});
        }
    });


    function getScrollHeight() {
        return Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
    }


    //导航栏关联tab，有tab则跳转，无则新建一个tab
    element.on("nav(menu)", function (elem) {
        let title = elem.text();
        let url = elem.context.dataset.url;
        let id = elem.context.id;
        let height = getScrollHeight() - 187;

        if (id > 0) {
            let lay_arr = new Array();
            var hash_id = 0;
            $("#tab li").each(function () {
                lay_arr.push($(this).attr('lay-id'));
                for (let i in lay_arr) {
                    if (lay_arr[i] === id) {
                        hash_id = 1;
                    }
                }
            });
            if (hash_id === 1) {
                element.tabChange('tabList', id);
            } else {
                element.tabAdd("tabList", {
                    title: title,
                    content: '<div class="layui-tab-item layui-show"><iframe data-frameid="' + id + '" scrolling="auto" frameborder="0" src="' + url + '" style="width:100%;height:' + height + 'px;display:block"></iframe></div>',
                    id: id
                });
                element.tabChange('tabList', id);
            }
        }
    });


});