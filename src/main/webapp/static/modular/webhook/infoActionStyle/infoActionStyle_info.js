/**
 * 初始化消息处理格式详情对话框
 */
var InfoActionStyleInfoDlg = {
    infoActionStyleInfoData : {}
};

/**
 * 清除数据
 */
InfoActionStyleInfoDlg.clearData = function() {
    this.infoActionStyleInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
InfoActionStyleInfoDlg.set = function(key, val) {
    this.infoActionStyleInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
InfoActionStyleInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
InfoActionStyleInfoDlg.close = function() {
    parent.layer.close(window.parent.InfoActionStyle.layerIndex);
}

/**
 * 收集数据
 */
InfoActionStyleInfoDlg.collectData = function() {
    this
    .set('id')
    .set('typeName')
    .set('uniqueAttr')
    .set('showTitle')
    .set('showCon')
    .set('showPlist')
    .set('remark')
    .set('addTime')
    .set('updateTime');
}

/**
 * 提交添加
 */
InfoActionStyleInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/infoActionStyle/add", function(data){
        Feng.success("添加成功!");
        window.parent.InfoActionStyle.table.refresh();
        InfoActionStyleInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.infoActionStyleInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
InfoActionStyleInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/infoActionStyle/update", function(data){
        Feng.success("修改成功!");
        window.parent.InfoActionStyle.table.refresh();
        InfoActionStyleInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.infoActionStyleInfoData);
    ajax.start();
}

$(function() {

});
