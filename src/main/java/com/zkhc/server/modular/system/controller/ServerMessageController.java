package com.zkhc.server.modular.system.controller;

import cn.stylefeng.roses.core.base.controller.BaseController;
import com.zkhc.server.core.common.annotion.BussinessLog;
import com.zkhc.server.core.common.constant.Const;
import com.zkhc.server.core.common.constant.dictmap.ServerMessageDict;
import com.zkhc.server.core.log.LogObjectHolder;
import com.zkhc.server.core.util.AESUtil;
import com.zkhc.server.modular.system.model.ServerMessage;
import com.zkhc.server.modular.system.service.IServerMessageService;
import com.zkhc.server.modular.system.warpper.LogWarpper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 控制器
 *
 * @author fengshuonan
 * @Date 2018-12-17 10:29:36
 */
@Controller
@RequestMapping("/serverMessage")
public class ServerMessageController extends BaseController {

    private String PREFIX = "/system/serverMessage/";

    @Autowired
    private IServerMessageService serverMessageService;

    /**
     * 跳转到首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "serverMessage.html";
    }

    /**
     * 跳转到添加
     */
    @RequestMapping("/serverMessage_add")
    public String serverMessageAdd() {
        return PREFIX + "serverMessage_add.html";
    }

    /**
     * 跳转到修改
     */
    @RequestMapping("/serverMessage_update/{serverMessageId}")
    public String serverMessageUpdate(@PathVariable Integer serverMessageId, Model model) {
        ServerMessage serverMessage = serverMessageService.selectById(serverMessageId);
        serverMessage.setServerPassword(AESUtil.decrypt(serverMessage.getServerPassword(), Const.CONTENT));
        model.addAttribute("item",serverMessage);
        LogObjectHolder.me().set(serverMessage);
        return PREFIX + "serverMessage_edit.html";
    }

    /**
     * 获取列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        List<Map<String, Object>> list = serverMessageService.list(condition);
        for(Map item:list){
            item.put("serverPassword",AESUtil.decrypt(item.get("serverPassword").toString(),Const.CONTENT));
        }
        return super.warpObject(new LogWarpper(list));
    }

    /**
     * 获取服务列表
     */
    @RequestMapping(value = "/serverList")
    @ResponseBody
    public Object allServer() {
        return serverMessageService.list(null);
    }

    /**
     * 新增
     */
    @RequestMapping(value = "/add")
    @BussinessLog(value = "新增服务器", key = "serverHost", dict = ServerMessageDict.class)
    @ResponseBody
    public Object add(ServerMessage serverMessage) {
        serverMessage.setServerPassword(AESUtil.encrypt(serverMessage.getServerPassword(), Const.CONTENT));
        serverMessageService.insert(serverMessage);
        return SUCCESS_TIP;
    }

    /**
     * 删除
     */
    @RequestMapping(value = "/delete")
    @BussinessLog(value = "删除服务器", key = "serverMessageId", dict = ServerMessageDict.class)
    @ResponseBody
    public Object delete(@RequestParam Integer serverMessageId) {
        serverMessageService.deleteById(serverMessageId);
        return SUCCESS_TIP;
    }

    /**
     * 修改
     */
    @RequestMapping(value = "/update")
    @BussinessLog(value = "修改服务器", key = "serverHost", dict = ServerMessageDict.class)
    @ResponseBody
    public Object update(ServerMessage serverMessage) {
        serverMessage.setServerPassword(AESUtil.encrypt(serverMessage.getServerPassword(), Const.CONTENT));
        serverMessageService.updateById(serverMessage);
        return SUCCESS_TIP;
    }

    /**
     * 详情
     */
    @RequestMapping(value = "/detail/{serverMessageId}")
    @ResponseBody
    public Object detail(@PathVariable("serverMessageId") Integer serverMessageId) {
        return serverMessageService.selectById(serverMessageId);
    }
}
