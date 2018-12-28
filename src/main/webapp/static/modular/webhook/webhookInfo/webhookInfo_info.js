/**
 * 初始化队列消息详情对话框
 */
var WebhookInfoInfoDlg = {
    webhookInfoInfoData : {}
};

/**
 * 清除数据
 */
WebhookInfoInfoDlg.clearData = function() {
    this.webhookInfoInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
WebhookInfoInfoDlg.set = function(key, val) {
    this.webhookInfoInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
WebhookInfoInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
WebhookInfoInfoDlg.close = function() {
    parent.layer.close(window.parent.WebhookInfo.layerIndex);
}

/**
 * 收集数据
 */
WebhookInfoInfoDlg.collectData = function() {
    this
    .set('id')
    .set('typeName')
    .set('content')
    .set('addTime')
    .set('status')
    .set('count')
    .set('remark');
}

/**
 * 提交添加
 */
WebhookInfoInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/webhookInfo/add", function(data){
        Feng.success("添加成功!");
        window.parent.WebhookInfo.table.refresh();
        WebhookInfoInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.webhookInfoInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
WebhookInfoInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/webhookInfo/update", function(data){
        Feng.success("修改成功!");
        window.parent.WebhookInfo.table.refresh();
        WebhookInfoInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.webhookInfoInfoData);
    ajax.start();
}

$(function() {

});
