/**
 * 服务器管理管理初始化
 */
var ServerInfo = {
    id: "ServerInfoTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
ServerInfo.initColumn = function () {
    return [
        {field: 'selectItem', checkbox: true},
            {title: '主键id', field: 'id', visible: false, align: 'center', valign: 'middle'},
            {title: '端口名', field: 'portName', visible: true, align: 'center', valign: 'middle',width:'7%'},
            {title: '服务器地址', field: 'host', visible: true, align: 'center', valign: 'middle',width:'7%'},
            {title: '端口', field: 'port', visible: true, align: 'center', valign: 'middle'},
            {title: '协议', field: 'protocolName', visible: true, align: 'center', valign: 'middle'},
            {title: '阿里端口', field: 'aliPort', visible: true, align: 'center', valign: 'middle'},
            {title: 'ngrok端口', field: 'ngrokPort', visible: true, align: 'center', valign: 'middle',width:'7%'},
            {title: '状态', field: 'aliStatusName', visible: true, align: 'center', valign: 'middle'},
            {title: '访问状态', field: 'fireStatusName', visible: true, align: 'center', valign: 'middle'},
            {title: '域名', field: 'domainName', visible: true, align: 'center', valign: 'middle',width:'18%',},
            {title: '区域 ', field: 'fireZone', visible: true, align: 'center', valign: 'middle'},
            {title: '类型', field: 'typeName', visible: true, align: 'center', valign: 'middle'},
            {title: '备注', field: 'remark', visible: true, align: 'center', valign: 'middle'},
            {title: '创建时间', field: 'createTime', visible: false, align: 'center', valign: 'middle'},
            {title: '更新时间', field: 'updateTime', visible: false, align: 'center', valign: 'middle'},
        {title: '操作', field: 'action', visible: true, align: 'center', valign: 'middle',width:'22%',
            formatter: function (value, row, index) {
                    return "<span>" +
                        "<div class=\"btn btn-default btn-sm edit\">修改</div>\n" +
                        "<div class=\"btn btn-default btn-sm delete\">删除</div>\n" +
                        "<div class=\"btn btn-default btn-sm con\">连通测试</div>\n" +
                        "<div class=\"btn btn-default btn-sm open\">开启代理</div>\n" +
                        "<div class=\"btn btn-default btn-sm down\">关闭代理</div>" +
                        "</span>"
            },events: "action_event"
        }
    ];
};


action_event = {
    "click .edit": function (e, value, row) {
        ServerInfo.openServerInfoDetail(row);
    },

    "click .delete": function (e, value, row) {
        ServerInfo.delete(row);
    },
    "click .con": function (e, value, row) {
        if(row.protocolName=="http"){
            ServerInfo.httpConnectTest(row);
        }
    },
    "click .open": function (e, value, row) {
        ServerInfo.open(row);
    },
    "click .down": function (e, value, row) {
        ServerInfo.down(row);
    },
};

/**
 * 检查是否选中
 */
ServerInfo.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        ServerInfo.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加服务器管理
 */
ServerInfo.openAddServerInfo = function () {
    var index = layer.open({
        type: 2,
        title: '添加服务器管理',
        area: ['600px', '700px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/serverInfo/serverInfo_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看服务器管理详情
 */
ServerInfo.openServerInfoDetail = function (row) {
    //if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '服务器管理详情',
            area: ['600px', '700px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/serverInfo/serverInfo_update/' + row.id
        });
        this.layerIndex = index;
   // }
};

/**
 * 批量删除
 */
ServerInfo.deleteSelect = function () {
    var d_list = ServerInfo.table.btInstance.bootstrapTable('getSelections');
    for(var i in d_list) {
        var row = d_list[i];
        ServerInfo.delete(row);
    }

};

/**
 * 删除服务器管理
 */
ServerInfo.delete = function (row) {
    //if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/serverInfo/delete", function (data) {
            Feng.success("删除成功!");
            ServerInfo.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("serverInfoId",row.id);
        ajax.start();
   // }
};

ServerInfo.connectTest=function(){
    if (this.check()) {
        Feng.info("测试");
    }
}
/**
 * http连接测试
 * @param row
 */
ServerInfo.httpConnectTest=function(row){
    var ajax = new $ax(Feng.ctxPath + "/httpConnect/httpConnectTest", function (data) {
        console.info(data.description);
        console.info(data.status);
        toastr.info(data.description,data.status);
    }, function (data) {
        Feng.error("失败!");
    });
    ajax.set("urlStr","http://"+row.portName+"."+row.domainName+"");
    ajax.start();
}

/**
 * 批量开启
 */
ServerInfo.openSelect = function () {
    var d_list = ServerInfo.table.btInstance.bootstrapTable('getSelections');
    for(var i in d_list) {
        var row = d_list[i];
        ServerInfo.open(row);
    }

};

/**
 * 批量关闭
 */
ServerInfo.downSelect = function () {
    var d_list = ServerInfo.table.btInstance.bootstrapTable('getSelections');
    for(var i in d_list) {
        var row = d_list[i];
        ServerInfo.down(row);
    }

};

/**
 * 开启代理
 */
ServerInfo.open=function(row){
    Feng.confirm("是否开启代理？",function(){
        /*var ajax = new $ax(Feng.ctxPath + "/opinion/delete", function (data) {
            Feng.success("删除成功!");
            Opinion.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("id",row.id);
        ajax.start();*/
        Feng.info("开启成功!");
    });
}
/**
 * 关闭代理
 */
ServerInfo.down=function(row){
    Feng.confirm("是否关闭代理？",function(){
        /*var ajax = new $ax(Feng.ctxPath + "/opinion/delete", function (data) {
            Feng.success("删除成功!");
            Opinion.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("id",row.id);
        ajax.start();*/
        Feng.info("关闭成功!");
    });
}
/**
 * 查询服务器管理列表
 */
ServerInfo.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    ServerInfo.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = ServerInfo.initColumn();
    var table = new BSTable(ServerInfo.id, "/serverInfo/list", defaultColunms);
    table.setPaginationType("client");
    ServerInfo.table = table.init();
});
