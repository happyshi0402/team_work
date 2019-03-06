package com.zkhc.server.modular.team.controller;

import cn.stylefeng.roses.core.base.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import com.zkhc.server.core.log.LogObjectHolder;
import org.springframework.web.bind.annotation.RequestParam;
import com.zkhc.server.modular.team.model.TeamProjectInfo;
import com.zkhc.server.modular.team.service.ITeamProjectInfoService;

/**
 * 项目管理控制器
 *
 * @author fengshuonan
 * @Date 2019-03-05 09:06:59
 */
@Controller
@RequestMapping("/teamProjectInfo")
public class TeamProjectInfoController extends BaseController {

    private String PREFIX = "/system/teamProjectInfo/";

    @Autowired
    private ITeamProjectInfoService teamProjectInfoService;

    /**
     * 跳转到项目管理首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "teamProjectInfo.html";
    }

    /**
     * 跳转到添加项目管理
     */
    @RequestMapping("/teamProjectInfo_add")
    public String teamProjectInfoAdd() {
        return PREFIX + "teamProjectInfo_add.html";
    }

    /**
     * 跳转到修改项目管理
     */
    @RequestMapping("/teamProjectInfo_update/{teamProjectInfoId}")
    public String teamProjectInfoUpdate(@PathVariable Integer teamProjectInfoId, Model model) {
        TeamProjectInfo teamProjectInfo = teamProjectInfoService.selectById(teamProjectInfoId);
        model.addAttribute("item",teamProjectInfo);
        LogObjectHolder.me().set(teamProjectInfo);
        return PREFIX + "teamProjectInfo_edit.html";
    }

    /**
     * 获取项目管理列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return teamProjectInfoService.selectList(null);
    }

    /**
     * 新增项目管理
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(TeamProjectInfo teamProjectInfo) {
        teamProjectInfoService.insert(teamProjectInfo);
        return SUCCESS_TIP;
    }

    /**
     * 删除项目管理
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer teamProjectInfoId) {
        teamProjectInfoService.deleteById(teamProjectInfoId);
        return SUCCESS_TIP;
    }

    /**
     * 修改项目管理
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(TeamProjectInfo teamProjectInfo) {
        teamProjectInfoService.updateById(teamProjectInfo);
        return SUCCESS_TIP;
    }

    /**
     * 项目管理详情
     */
    @RequestMapping(value = "/detail/{teamProjectInfoId}")
    @ResponseBody
    public Object detail(@PathVariable("teamProjectInfoId") Integer teamProjectInfoId) {
        return teamProjectInfoService.selectById(teamProjectInfoId);
    }
}
