/**
 * 初始化团队详情对话框
 */
var TeamInfoInfoDlg = {
    teamInfoInfoData : {}
};

/**
 * 清除数据
 */
TeamInfoInfoDlg.clearData = function() {
    this.teamInfoInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
TeamInfoInfoDlg.set = function(key, val) {
    this.teamInfoInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
TeamInfoInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
TeamInfoInfoDlg.close = function() {
    parent.layer.close(window.parent.TeamInfo.layerIndex);
}

/**
 * 收集数据
 */
TeamInfoInfoDlg.collectData = function() {
    this
    .set('id')
    .set('name')
    .set('description')
    .set('adminUserId')
    .set('createTime')
    .set('updateTime');
}

/**
 * 提交添加
 */
TeamInfoInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/teamInfo/add", function(data){
        Feng.success("添加成功!");
        window.parent.TeamInfo.table.refresh();
        TeamInfoInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.teamInfoInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
TeamInfoInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/teamInfo/update", function(data){
        Feng.success("修改成功!");
        window.parent.TeamInfo.table.refresh();
        TeamInfoInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.teamInfoInfoData);
    ajax.start();
}

$(function() {

});
