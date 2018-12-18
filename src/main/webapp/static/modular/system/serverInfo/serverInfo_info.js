/**
 * 初始化服务器管理详情对话框
 */
var ServerInfoInfoDlg = {
    serverInfoInfoData : {},
    validateFields: {
        portName: {
            validators: {
                notEmpty: {
                    message: '端口名不能为空'
                }
            }
        },
        host: {
            validators: {
                notEmpty: {
                    message: 'ip不能为空'
                }
            }
        },
        port: {
            validators: {
                notEmpty: {
                    message: '端口不能为空'
                }
            }
        },
        aliPort: {
            validators: {
                notEmpty: {
                    message: '阿里代理端口不能为空'
                }
            }
        },
        ngrokPort: {
            validators: {
                notEmpty: {
                    message: 'ngrok对应端口不能为空'
                }
            }
        },
        domainName: {
            validators: {
                notEmpty: {
                    message: '域名不能为空'
                }
            }
        }
    }
};

/**
 * 清除数据
 */
ServerInfoInfoDlg.clearData = function() {
    this.serverInfoInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ServerInfoInfoDlg.set = function(key, val) {
    this.serverInfoInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ServerInfoInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
ServerInfoInfoDlg.close = function() {
    parent.layer.close(window.parent.ServerInfo.layerIndex);
}

/**
 * 收集数据
 */
ServerInfoInfoDlg.collectData = function() {
    this
    .set('id')
    .set('portName')
    .set('hostId')
    .set('port')
    .set('protocol')
    .set('aliPort')
    .set('ngrokPort')
    .set('remark')
    .set('aliStatus')
    .set('fireStatus')
    .set('domainName')
    .set('fireZone')
    .set('type')
    .set('createTime')
    .set('updateTime');
}

/**
 * 验证数据是否为空
 */
ServerInfoInfoDlg.validate = function () {
    $('#portManage').data("bootstrapValidator").resetForm();
    $('#portManage').bootstrapValidator('validate');
    return $("#portManage").data('bootstrapValidator').isValid();
}

/**
 * 提交添加
 */
ServerInfoInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    if (!this.validate()) {
        return;
    }

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/serverInfo/add", function(data){
        Feng.success("添加成功!");
        window.parent.ServerInfo.table.refresh();
        ServerInfoInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.serverInfoInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
ServerInfoInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    if (!this.validate()) {
        return;
    }

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/serverInfo/update", function(data){
        Feng.success("修改成功!");
        window.parent.ServerInfo.table.refresh();
        ServerInfoInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.serverInfoInfoData);
    ajax.start();
}

ServerInfoInfoDlg.loadCheck=function(){
    var protocol=$("#oldProtocol").val();
    var type=$("#oldType").val();
    $("#protocol").find("option[value = '"+protocol+"']").attr("selected","selected");
    $("#type").find("option[value = '"+type+"']").attr("selected","selected");
}

/**
 * 加载服务器信息
 */
ServerInfoInfoDlg.loadServer=function(){
    $.ajax({
        type: "GET",
        url: "/serverMessage/serverList",
        dataType: "json",
        success: function (data) {
            $.each(data, function (i) {
                $("#hostId")
                    .append("<option value="
                        + data[i].id  +">"
                        + data[i].serverHost+"(端口:"+data[i].serverPort+")"+"</option>");
                $("#hostId").find("option[value = '"+$("#oldHostId").val()+"']").attr("selected","selected");
            });
        }
    });

}

$(function() {
    ServerInfoInfoDlg.loadCheck();
    Feng.initValidator("portManage", ServerInfoInfoDlg.validateFields);
    ServerInfoInfoDlg.loadServer();
});
