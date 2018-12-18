/**
 * 初始化详情对话框
 */
var ServerMessageInfoDlg = {
    serverMessageInfoData : {},
    validateFields: {
        serverHost: {
            validators: {
                notEmpty: {
                    message: '服务器地址不能为空'
                }
            }
        },
        serverPort: {
            validators: {
                notEmpty: {
                    message: '服务器端口不能为空'
                }
            }
        },
        serverUser: {
            validators: {
                notEmpty: {
                    message: '服务器账号不能为空'
                }
            }
        },
        serverPassword: {
            validators: {
                notEmpty: {
                    message: '密码不能为空'
                },
                regexp:{
                    regexp:/^(\w){6,20}$/,
                    message:'密码由6-20个字母、数字、下划线组成'
                }/*,
                identical: {
                    field: 'reServerPassword',
                    message: '两次密码不一致'
                }*/
            }
        }/*,
        reServerPassword: {
            validators: {
                notEmpty: {
                    message: '密码不能为空'
                },
                regexp:{
                    regexp:/^(\w){6,20}$/,
                    message:'密码由6-20个字母、数字、下划线组成'
                },
                identical: {
                    field: 'serverPassword',
                    message: '两次密码不一致'
                }
            }
        }*/
    }
};

/**
 * 清除数据
 */
ServerMessageInfoDlg.clearData = function() {
    this.serverMessageInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ServerMessageInfoDlg.set = function(key, val) {
    this.serverMessageInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ServerMessageInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
ServerMessageInfoDlg.close = function() {
    parent.layer.close(window.parent.ServerMessage.layerIndex);
}

/**
 * 收集数据
 */
ServerMessageInfoDlg.collectData = function() {
    this
    .set('id')
    .set('serverHost')
    .set('serverPort')
    .set('serverUser')
    .set('serverPassword');
}

/**
 * 验证数据是否为空
 */
ServerMessageInfoDlg.validate = function () {
    $('#addServer').data("bootstrapValidator").resetForm();
    $('#addServer').bootstrapValidator('validate');
    return $("#addServer").data('bootstrapValidator').isValid();
}

/**
 * 提交添加
 */
ServerMessageInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    if (!this.validate()) {
        return;
    }
    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/serverMessage/add", function(data){
        Feng.success("添加成功!");
        window.parent.ServerMessage.table.refresh();
        ServerMessageInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.serverMessageInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
ServerMessageInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    if (!this.validate()) {
        return;
    }
    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/serverMessage/update", function(data){
        Feng.success("修改成功!");
        window.parent.ServerMessage.table.refresh();
        ServerMessageInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.serverMessageInfoData);
    ajax.start();
}

$(function() {
    Feng.initValidator("addServer", ServerMessageInfoDlg.validateFields);
});
