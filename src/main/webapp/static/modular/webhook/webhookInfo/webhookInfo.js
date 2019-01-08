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
            {title: '编号', field: 'id', sortable: true, align: 'center', valign: 'middle'},
            {title: '消息类别', field: 'typeName', sortable: true, align: 'center', valign: 'middle'},
            {title: '消息内容', field: 'content', visible: true, align: 'center',  events: "action_event",
                formatter: function (value, row, index) {
                    var link = "<a tabindex=\"0\" role=\"button\" class='info_con show_detail'>"+value+"</a>";
                    return link;
                },
                valign: 'middle'},
            {title: '消息提取', field: 'content', visible: true, align: 'center',  events: "action_event",
                formatter: function (value, row, index) {
                    var link = "<a tabindex=\"0\" role=\"button\" class='info_con show_detail'>"+value+"</a>";
                    if(row.typeName == "gitlab"){
                        return value.event_name + " : " + value.user_name;
                    }
                    return link;
            },
            valign: 'middle'},
            {title: '添加时间', field: 'addTime', sortable: true, align: 'center', valign: 'middle'},
            {title: '状态：1.未发出  2.已发出 3.失败 ', field: 'status', sortable: true, align: 'center', valign: 'middle'},
            {title: '查看次数', field: 'count', sortable: true, align: 'center', valign: 'middle'},
            {title: '备注', field: 'remark', sortable: true, align: 'center', valign: 'middle'},
            {title: '操作', field: 'action', visible: true, align: 'center', valign: 'middle',
                formatter: function (value, row, index) {
                    var link = "<a target='_blank' href='/webhookInfo/detail/" + row.id  + "'>详情</a>";
                    var link = "<sapn class='detail' '>详情</sapn>";
                    link = "<a href='/webhookInfo/detail/" + row.id  + "'>详情</a>";
                    return link;
                },
                events: "action_event"}
    ];
};

action_event = {
    "click .show_detail": function (e, value, row) {
        var content = row.content;
        var typeName = row.typeName;
        var remark = row.remark;
        $("#info_detail").modal("show");
        $("#info_detail_title").text(typeName + " : " + remark);
        var result = JSON.stringify(JSON.parse(content), null, 4);
        $("#info_detail_con").text(result);
        //WebhookInfo.openWebhookInfoDetail(row);
    },
    "click .detail": function (e, value, row) {
        WebhookInfo.openWebhookInfoDetail(row);
    },
}
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
WebhookInfo.openWebhookInfoDetail = function (row) {
    //if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '队列消息详情',
            area: ['800px', '710px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/webhookInfo/detail/' + row.id
        });
        this.layerIndex = index;
    //}
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
    table.options["sortName"] = "addTime";
    table.options["sortOrder"] = "desc";
    WebhookInfo.table = table.init();
});
