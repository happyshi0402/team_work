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
        {title: '端口名', field: 'portName', sortable: true, align: 'center', valign: 'middle', width: '7%'},
        {title: '服务器地址', field: 'host', sortable: true, align: 'center', valign: 'middle', width: '7%'},
        {title: '端口', field: 'port', sortable: true, align: 'center', valign: 'middle'},
        {title: '协议', field: 'protocolName', sortable: true, align: 'center', valign: 'middle'},
        {
            title: '访问端口', field: 'aliPort', sortable: true,
            formatter: function (value, row, index) {
                if (row.protocolName == "http") {
                    return "";
                } else {
                    var href = row.protocolName + "://" + value;
                    return value;
                }
            },
            align: 'center', valign: 'middle'
        },
        {title: 'ngrok端口', field: 'ngrokPort', visible: false, align: 'center', valign: 'middle', width: '7%'},
        {title: '状态', field: 'aliStatusName', sortable: true, align: 'center', valign: 'middle'},
        {title: '访问状态', field: 'fireStatusName', visible: false, align: 'center', valign: 'middle'},
        {
            title: '域名', field: 'domainName', sortable: true, align: 'center',
            formatter: function (value, row, index) {
                if (row.protocolName == "http") {
                    var href = row.protocolName + "://" + row.portName + "." + value;
                    return "<a target='_blank' href=\"" + href + "\">" + href + "</a>";
                } else {
                    var href = row.protocolName + "://" + value;
                    return href;
                }
            },
            valign: 'middle', width: '18%',
        },
        {title: '区域 ', field: 'fireZone', visible: false, align: 'center', valign: 'middle'},
        {title: '类型', field: 'typeName', sortable: true, align: 'center', valign: 'middle'},
        {title: '备注', field: 'remark', sortable: true, align: 'center', valign: 'middle'},
        {title: '创建时间', field: 'createTime', sortable: true, align: 'center', width: '12%', valign: 'middle'},
        {title: '更新时间', field: 'updateTime', visible: false, align: 'center', width: '12%', valign: 'middle'},
        {
            title: '操作', field: 'action', align: 'center', valign: 'middle', width: '8%',
            formatter: function (value, row, index) {
                console.log(row);
                var status = "<div class=\" down fa fa-toggle-on fa-2x text-info\"></div>\n";
                if (row.aliStatus == 2) {
                    status = "<div class=\"open fa fa-toggle-off fa-2x text-muted\"></div>\n";
                }
                var test_c = "text-muted";
                if (row.protocolName == "http") {
                    test_c = "con text-info";
                }
                return "<span>" +
                    "<div class=\"edit fa fa-pencil-square-o fa-2x text-info\" aria-placeholder='修改'></div>\n" +
                    "<div class=\"fa fa-bolt fa-2x "+test_c+"\" aria-placeholder='连通测试'></div>\n" +
                    status +
                    "</span>"
            }, events: "action_event"
        }
    ];
};


action_event = {
    "click .edit": function (e, value, row) {
        ServerInfo.openServerInfoDetail(row);
    },
    "click .con": function (e, value, row) {
        Feng.info("start test " + row.port + "!")
        if (row.protocolName == "http") {
            ServerInfo.httpConnectTest(row);
        } else {
            Feng.info("请采用特殊方式" + row.typeName + "测试");
        }
    },
    "click .open": function (e, value, row) {
        ServerInfo.action(row, "start");
    },
    "click .down": function (e, value, row) {
        ServerInfo.action(row, "close");
    },
};

/**
 * 检查是否选中
 */
ServerInfo.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if (selected.length == 0) {
        Feng.info("请先选中表格中的某一记录！");
        return false;
    } else {
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
    for (var i in d_list) {
        var row = d_list[i];
        ServerInfo.delete(row);
    }

};

/**
 * 删除服务器管理
 */
ServerInfo.delete = function (row) {
    Feng.confirm("确定要删除" + row.port + "？", function () {
        if (this.check()) {
            var ajax = new $ax(Feng.ctxPath + "/serverInfo/delete", function (data) {
                Feng.success("删除成功!");
                ServerInfo.table.refresh();
            }, function (data) {
                Feng.error("删除失败!" + data.responseJSON.message + "!");
            }, true);
            ajax.set("serverInfoId", row.id);
            ajax.start();
        }
    });
};

ServerInfo.connectTest = function () {
    if (this.check()) {
        Feng.info("测试");
    }
}
/**
 * http连接测试
 * @param row
 */
ServerInfo.httpConnectTest = function (row) {
    var ajax = new $ax(Feng.ctxPath + "/httpConnect/httpConnectTest", function (data) {
        console.info(data.description);
        console.info(data.status);
        toastr.info(row.port+ " " + row.portName +" : "+ data.description.substr(0, 100), data.status);
    }, function (data) {
        Feng.error(row.port+"联通测试失败!");
    }, true);
    ajax.set("urlStr", "http://" + row.portName + "." + row.domainName + "");
    ajax.start();
}

/**
 * 批量开启
 */
ServerInfo.openSelect = function () {
    var d_list = ServerInfo.table.btInstance.bootstrapTable('getSelections');
    for (var i in d_list) {
        var row = d_list[i];
        ServerInfo.action(row, "start");
    }

};

/**
 * 批量关闭
 */
ServerInfo.downSelect = function () {
    var d_list = ServerInfo.table.btInstance.bootstrapTable('getSelections');
    for (var i in d_list) {
        var row = d_list[i];
        ServerInfo.action(row, "close");
    }

};

/**
 * 代理操作，开启和关闭
 */
ServerInfo.action = function (row, action) {
    Feng.confirm("确定执行此操作：" + action + "？", function () {
        var ajax = new $ax(Feng.ctxPath + "/serverInfo/action", function (data) {
            console.log("操作代理返回的数据：", data);
            Feng.success("操作成功!");
            ServerInfo.table.refresh();
        }, function (data) {
            Feng.error("操作失败!" + data.responseJSON.message + "!");
        }, true);
        row = _.omit(row, "createTime", "updateTime");
        row.action = action;
        ajax.set(row);
        ajax.start();
    });
};
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
    table.options["sortName"] = "createTime";
    table.options["sortOrder"] = "desc";
    ServerInfo.table = table.init();

});
