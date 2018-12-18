/**
 * 管理初始化
 */
var ServerMessage = {
    id: "ServerMessageTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
ServerMessage.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '编号', field: 'id', visible: false, align: 'center', valign: 'middle'},
            {title: '服务器地址', field: 'serverHost', visible: true, align: 'center', valign: 'middle'},
            {title: '服务器端口', field: 'serverPort', visible: true, align: 'center', valign: 'middle'},
            {title: '服务器账号', field: 'serverUser', visible: true, align: 'center', valign: 'middle'},
            {title: '服务器密码', field: 'serverPassword', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
ServerMessage.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        ServerMessage.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加
 */
ServerMessage.openAddServerMessage = function () {
    var index = layer.open({
        type: 2,
        title: '添加',
        area: ['520px', '430px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/serverMessage/serverMessage_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看详情
 */
ServerMessage.openServerMessageDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '详情',
            area: ['520px', '430px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/serverMessage/serverMessage_update/' + ServerMessage.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除
 */
ServerMessage.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/serverMessage/delete", function (data) {
            Feng.success("删除成功!");
            ServerMessage.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("serverMessageId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询列表
 */
ServerMessage.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    ServerMessage.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = ServerMessage.initColumn();
    var table = new BSTable(ServerMessage.id, "/serverMessage/list", defaultColunms);
    table.setPaginationType("client");
    ServerMessage.table = table.init();
});
