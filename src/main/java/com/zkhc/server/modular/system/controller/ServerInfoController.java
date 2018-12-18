package com.zkhc.server.modular.system.controller;

import cn.stylefeng.roses.core.base.controller.BaseController;
import com.zkhc.server.core.common.annotion.BussinessLog;
import com.zkhc.server.core.common.constant.dictmap.ServerInfoDict;
import com.zkhc.server.core.log.LogObjectHolder;
import com.zkhc.server.core.util.UUIDUtil;
import com.zkhc.server.modular.system.model.ServerInfo;
import com.zkhc.server.modular.system.service.IServerInfoService;
import com.zkhc.server.modular.system.warpper.ServerInfoWarpper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 服务器管理控制器
 *
 * @author fengshuonan
 * @Date 2018-12-11 08:58:40
 */
@Controller
@RequestMapping("/serverInfo")
public class ServerInfoController extends BaseController {

    private String PREFIX = "/system/serverInfo/";

    @Autowired
    private IServerInfoService serverInfoService;

    /**
     * 跳转到服务器管理首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "serverInfo.html";
    }

    /**
     * 跳转到添加服务器管理
     */
    @RequestMapping("/serverInfo_add")
    public String serverInfoAdd() {
        return PREFIX + "serverInfo_add.html";
    }

    /**
     * 跳转到修改服务器管理
     */
    @RequestMapping("/serverInfo_update/{serverInfoId}")
    public String serverInfoUpdate(@PathVariable String serverInfoId, Model model) {
        ServerInfo serverInfo = serverInfoService.selectById(serverInfoId);
        model.addAttribute("item",serverInfo);
        LogObjectHolder.me().set(serverInfo);
        return PREFIX + "serverInfo_edit.html";
    }

    /**
     * 获取服务器管理列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        List<Map<String, Object>> list = serverInfoService.list(condition);
        return super.warpObject(new ServerInfoWarpper(list));
    }

    /**
     * 新增服务器管理
     */
    @RequestMapping(value = "/add")
    @BussinessLog(value = "新增服务端口", key = "portName", dict = ServerInfoDict.class)
    @ResponseBody
    public Object add(ServerInfo serverInfo) {
        serverInfo.setId(UUIDUtil.getUUID());
        serverInfo.setCreateTime(new Date());
        serverInfo.setUpdateTime(new Date());
        serverInfoService.insert(serverInfo);
        return SUCCESS_TIP;
    }

    /**
     * 删除服务器管理
     */
    @RequestMapping(value = "/delete")
    @BussinessLog(value = "删除服务端口", key = "serverInfoId", dict = ServerInfoDict.class)
    @ResponseBody
    public Object delete(@RequestParam String serverInfoId) {
        serverInfoService.deleteById(serverInfoId);
        return SUCCESS_TIP;
    }

    /**
     * 修改服务器管理
     */
    @RequestMapping(value = "/update")
    @BussinessLog(value = "修改服务端口", key = "portName", dict = ServerInfoDict.class)
    @ResponseBody
    public Object update(ServerInfo serverInfo) {
        serverInfoService.updateById(serverInfo);
        return SUCCESS_TIP;
    }

    /**
     * 服务器管理详情
     */
    @RequestMapping(value = "/detail/{serverInfoId}")
    @ResponseBody
    public Object detail(@PathVariable("serverInfoId") String serverInfoId) {
        return serverInfoService.selectById(serverInfoId);
    }
}
