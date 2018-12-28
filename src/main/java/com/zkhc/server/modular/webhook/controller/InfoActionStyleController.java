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
import com.zkhc.server.modular.system.model.InfoActionStyle;
import com.zkhc.server.modular.webhook.service.IInfoActionStyleService;

/**
 * 消息处理格式控制器
 *
 * @author fengshuonan
 * @Date 2018-12-28 11:26:55
 */
@Controller
@RequestMapping("/infoActionStyle")
public class InfoActionStyleController extends BaseController {

    private String PREFIX = "/webhook/infoActionStyle/";

    @Autowired
    private IInfoActionStyleService infoActionStyleService;

    /**
     * 跳转到消息处理格式首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "infoActionStyle.html";
    }

    /**
     * 跳转到添加消息处理格式
     */
    @RequestMapping("/infoActionStyle_add")
    public String infoActionStyleAdd() {
        return PREFIX + "infoActionStyle_add.html";
    }

    /**
     * 跳转到修改消息处理格式
     */
    @RequestMapping("/infoActionStyle_update/{infoActionStyleId}")
    public String infoActionStyleUpdate(@PathVariable Integer infoActionStyleId, Model model) {
        InfoActionStyle infoActionStyle = infoActionStyleService.selectById(infoActionStyleId);
        model.addAttribute("item",infoActionStyle);
        LogObjectHolder.me().set(infoActionStyle);
        return PREFIX + "infoActionStyle_edit.html";
    }

    /**
     * 获取消息处理格式列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return infoActionStyleService.selectList(null);
    }

    /**
     * 新增消息处理格式
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(InfoActionStyle infoActionStyle) {
        infoActionStyleService.insert(infoActionStyle);
        return SUCCESS_TIP;
    }

    /**
     * 删除消息处理格式
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer infoActionStyleId) {
        infoActionStyleService.deleteById(infoActionStyleId);
        return SUCCESS_TIP;
    }

    /**
     * 修改消息处理格式
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(InfoActionStyle infoActionStyle) {
        infoActionStyleService.updateById(infoActionStyle);
        return SUCCESS_TIP;
    }

    /**
     * 消息处理格式详情
     */
    @RequestMapping(value = "/detail/{infoActionStyleId}")
    @ResponseBody
    public Object detail(@PathVariable("infoActionStyleId") Integer infoActionStyleId) {
        return infoActionStyleService.selectById(infoActionStyleId);
    }
}
