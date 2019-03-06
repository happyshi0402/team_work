/**
 * 项目管理管理初始化
 */
var TeamProjectInfo = {
    id: "TeamProjectInfoTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
TeamProjectInfo.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '项目编号', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '团队', field: 'teamId', visible: true, align: 'center', valign: 'middle'},
            {title: '项目名称', field: 'name', visible: true, align: 'center', valign: 'middle'},
            {title: '项目描述', field: 'description', visible: true, align: 'center', valign: 'middle'},
            {title: '图标', field: 'icon', visible: true, align: 'center', valign: 'middle'},
            {title: '创建时间', field: 'createTime', visible: true, align: 'center', valign: 'middle'},
            {title: '更新时间', field: 'updateTime', visible: true, align: 'center', valign: 'middle'},
            {title: '项目状态（1.正常 2.锁定）', field: 'status', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
TeamProjectInfo.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        TeamProjectInfo.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加项目管理
 */
TeamProjectInfo.openAddTeamProjectInfo = function () {
    var index = layer.open({
        type: 2,
        title: '添加项目管理',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/teamProjectInfo/teamProjectInfo_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看项目管理详情
 */
TeamProjectInfo.openTeamProjectInfoDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '项目管理详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/teamProjectInfo/teamProjectInfo_update/' + TeamProjectInfo.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除项目管理
 */
TeamProjectInfo.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/teamProjectInfo/delete", function (data) {
            Feng.success("删除成功!");
            TeamProjectInfo.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("teamProjectInfoId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询项目管理列表
 */
TeamProjectInfo.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    TeamProjectInfo.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = TeamProjectInfo.initColumn();
    var table = new BSTable(TeamProjectInfo.id, "/teamProjectInfo/list", defaultColunms);
    table.setPaginationType("client");
    TeamProjectInfo.table = table.init();
});
