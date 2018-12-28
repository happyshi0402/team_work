/**
 * 队列消息管理初始化
 */
var WebhookInfo = {
    id: "WebhookInfoTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
WebhookInfo.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '编号', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '消息类别', field: 'typeName', visible: true, align: 'center', valign: 'middle'},
            {title: '消息内容', field: 'content', visible: true, align: 'center', valign: 'middle'},
            {title: '', field: 'addTime', visible: true, align: 'center', valign: 'middle'},
            {title: '状态：1.未发出  2.已发出 3.失败 ', field: 'status', visible: true, align: 'center', valign: 'middle'},
            {title: '查看次数', field: 'count', visible: true, align: 'center', valign: 'middle'},
            {title: '备注', field: 'remark', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
WebhookInfo.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        WebhookInfo.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加队列消息
 */
WebhookInfo.openAddWebhookInfo = function () {
    var index = layer.open({
        type: 2,
        title: '添加队列消息',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/webhookInfo/webhookInfo_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看队列消息详情
 */
WebhookInfo.openWebhookInfoDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '队列消息详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/webhookInfo/webhookInfo_update/' + WebhookInfo.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除队列消息
 */
WebhookInfo.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/webhookInfo/delete", function (data) {
            Feng.success("删除成功!");
            WebhookInfo.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("webhookInfoId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询队列消息列表
 */
WebhookInfo.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    WebhookInfo.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = WebhookInfo.initColumn();
    var table = new BSTable(WebhookInfo.id, "/webhookInfo/list", defaultColunms);
    table.setPaginationType("client");
    WebhookInfo.table = table.init();
});
