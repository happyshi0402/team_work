package com.zkhc.server.modular.webhook.controller;

import cn.stylefeng.roses.core.base.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import com.zkhc.server.core.log.LogObjectHolder;
import org.springframework.web.bind.annotation.RequestParam;
import com.zkhc.server.modular.system.model.WebhookInfo;
import com.zkhc.server.modular.webhook.service.IWebhookInfoService;

/**
 * 队列消息控制器
 *
 * @author fengshuonan
 * @Date 2018-12-27 14:16:06
 */
@Controller
@RequestMapping("/webhookInfo")
public class WebhookInfoController extends BaseController {

    private String PREFIX = "/webhook/webhookInfo/";

    @Autowired
    private IWebhookInfoService webhookInfoService;

    /**
     * 跳转到队列消息首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "webhookInfo.html";
    }

    /**
     * 跳转到添加队列消息
     */
    @RequestMapping("/webhookInfo_add")
    public String webhookInfoAdd() {
        return PREFIX + "webhookInfo_add.html";
    }

    /**
     * 跳转到修改队列消息
     */
    @RequestMapping("/webhookInfo_update/{webhookInfoId}")
    public String webhookInfoUpdate(@PathVariable Integer webhookInfoId, Model model) {
        WebhookInfo webhookInfo = webhookInfoService.selectById(webhookInfoId);
        model.addAttribute("item",webhookInfo);
        LogObjectHolder.me().set(webhookInfo);
        return PREFIX + "webhookInfo_edit.html";
    }

    /**
     * 获取队列消息列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return webhookInfoService.selectList(null);
    }

    /**
     * 新增队列消息
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(WebhookInfo webhookInfo) {
        webhookInfoService.insert(webhookInfo);
        return SUCCESS_TIP;
    }

    /**
     * 删除队列消息
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer webhookInfoId) {
        webhookInfoService.deleteById(webhookInfoId);
        return SUCCESS_TIP;
    }

    /**
     * 修改队列消息
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(WebhookInfo webhookInfo) {
        webhookInfoService.updateById(webhookInfo);
        return SUCCESS_TIP;
    }

    /**
     * 队列消息详情
     */
    @RequestMapping(value = "/detail/data/{webhookInfoId}")
    @ResponseBody
    public Object detail_data(@PathVariable("webhookInfoId") Integer webhookInfoId) {
        return webhookInfoService.selectById(webhookInfoId);
    }

    /**
     * 队列消息详情
     */
    @RequestMapping(value = "/detail/{webhookInfoId}")
    public Object detail_page(@PathVariable("webhookInfoId") Integer webhookInfoId, Model model) {
        model.addAttribute("webhookInfoId",webhookInfoId);
        return PREFIX + "webhookInfo_detail.html";
    }
}
