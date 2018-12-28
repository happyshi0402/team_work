/**
 * 消息处理格式管理初始化
 */
var InfoActionStyle = {
    id: "InfoActionStyleTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
InfoActionStyle.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '编号', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '消息类别', field: 'typeName', visible: true, align: 'center', valign: 'middle'},
            {title: '数据区分', field: 'uniqueAttr', visible: true, align: 'center', valign: 'middle'},
            {title: '信息标题', field: 'showTitle', visible: true, align: 'center', valign: 'middle'},
            {title: '显示内容格式', field: 'showCon', visible: true, align: 'center', valign: 'middle'},
            {title: '内容参数格式', field: 'showPlist', visible: true, align: 'center', valign: 'middle'},
            {title: '备注', field: 'remark', visible: true, align: 'center', valign: 'middle'},
            {title: '添加时间', field: 'addTime', visible: true, align: 'center', valign: 'middle'},
            {title: '更新时间', field: 'updateTime', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
InfoActionStyle.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        InfoActionStyle.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加消息处理格式
 */
InfoActionStyle.openAddInfoActionStyle = function () {
    var index = layer.open({
        type: 2,
        title: '添加消息处理格式',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/infoActionStyle/infoActionStyle_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看消息处理格式详情
 */
InfoActionStyle.openInfoActionStyleDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '消息处理格式详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/infoActionStyle/infoActionStyle_update/' + InfoActionStyle.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除消息处理格式
 */
InfoActionStyle.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/infoActionStyle/delete", function (data) {
            Feng.success("删除成功!");
            InfoActionStyle.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("infoActionStyleId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询消息处理格式列表
 */
InfoActionStyle.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    InfoActionStyle.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = InfoActionStyle.initColumn();
    var table = new BSTable(InfoActionStyle.id, "/infoActionStyle/list", defaultColunms);
    table.setPaginationType("client");
    InfoActionStyle.table = table.init();
});
