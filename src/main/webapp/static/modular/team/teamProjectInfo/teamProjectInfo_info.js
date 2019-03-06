/**
 * 初始化项目管理详情对话框
 */
var TeamProjectInfoInfoDlg = {
    teamProjectInfoInfoData : {}
};

/**
 * 清除数据
 */
TeamProjectInfoInfoDlg.clearData = function() {
    this.teamProjectInfoInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
TeamProjectInfoInfoDlg.set = function(key, val) {
    this.teamProjectInfoInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
TeamProjectInfoInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
TeamProjectInfoInfoDlg.close = function() {
    parent.layer.close(window.parent.TeamProjectInfo.layerIndex);
}

/**
 * 收集数据
 */
TeamProjectInfoInfoDlg.collectData = function() {
    this
    .set('id')
    .set('teamId')
    .set('name')
    .set('description')
    .set('icon')
    .set('createTime')
    .set('updateTime')
    .set('status');
}

/**
 * 提交添加
 */
TeamProjectInfoInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/teamProjectInfo/add", function(data){
        Feng.success("添加成功!");
        window.parent.TeamProjectInfo.table.refresh();
        TeamProjectInfoInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.teamProjectInfoInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
TeamProjectInfoInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/teamProjectInfo/update", function(data){
        Feng.success("修改成功!");
        window.parent.TeamProjectInfo.table.refresh();
        TeamProjectInfoInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.teamProjectInfoInfoData);
    ajax.start();
}

/**
 * 加载团队
 */
TeamProjectInfoInfoDlg.loadTeam=function(){
    $.ajax({
        type: "GET",
        url: "/teamInfo/list",
        dataType: "json",
        success: function (data) {
            $.each(data, function (i) {
                $("#teamId")
                    .append("<option value="
                        + data[i].id + ">"
                        + data[i].name
                        + "</option>");
            });
        }
    });
}

$(function() {
    TeamProjectInfoInfoDlg.loadTeam();
});
