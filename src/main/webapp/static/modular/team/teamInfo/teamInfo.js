/**
 * 团队管理初始化
 */
var TeamInfo = {
    id: "TeamInfoTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
TeamInfo.initColumn = function () {
    return [
        {field: 'selectItem', radio: true, visible:false},
        {title: '团队名称', field: 'name', visible: true,
            formatter: function (value, row, index) {
                return "<a class='btn btn-warning btn-sm team_name' target='_self' " +
                    "href='/teamProjectInfo/teamProject/"+row.id+"/'>"+value+"</a>";
            },
            align: 'center', valign: 'middle'},
        // {title: '团队介绍', field: 'description', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
TeamInfo.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        TeamInfo.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加团队
 */
TeamInfo.openAddTeamInfo = function () {
    var index = layer.open({
        type: 2,
        title: '添加团队',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/teamInfo/teamInfo_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看团队详情
 */
TeamInfo.openTeamInfoDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '团队详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/teamInfo/teamInfo_update/' + TeamInfo.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除团队
 */
TeamInfo.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/teamInfo/delete", function (data) {
            Feng.success("删除成功!");
            TeamInfo.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("teamInfoId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询团队列表
 */
TeamInfo.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    TeamInfo.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = TeamInfo.initColumn();
    var table = new BSTable(TeamInfo.id, "/teamInfo/list", defaultColunms);
    table.setPaginationType("client");
    TeamInfo.table = table.init();
});
