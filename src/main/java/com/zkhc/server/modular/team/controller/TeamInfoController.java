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
import com.zkhc.server.modular.team.model.TeamInfo;
import com.zkhc.server.modular.team.service.ITeamInfoService;

/**
 * 团队控制器
 *
 * @author fengshuonan
 * @Date 2019-03-04 16:59:48
 */
@Controller
@RequestMapping("/teamInfo")
public class TeamInfoController extends BaseController {

    private String PREFIX = "/team/teamInfo/";

    @Autowired
    private ITeamInfoService teamInfoService;

    /**
     * 跳转到团队首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "teamInfo.html";
    }

    /**
     * 跳转到添加团队
     */
    @RequestMapping("/teamInfo_add")
    public String teamInfoAdd() {
        return PREFIX + "teamInfo_add.html";
    }

    /**
     * 跳转到修改团队
     */
    @RequestMapping("/teamInfo_update/{teamInfoId}")
    public String teamInfoUpdate(@PathVariable Integer teamInfoId, Model model) {
        TeamInfo teamInfo = teamInfoService.selectById(teamInfoId);
        model.addAttribute("item",teamInfo);
        LogObjectHolder.me().set(teamInfo);
        return PREFIX + "teamInfo_edit.html";
    }

    /**
     * 获取团队列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return teamInfoService.selectList(null);
    }

    /**
     * 新增团队
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(TeamInfo teamInfo) {
        teamInfoService.insert(teamInfo);
        return SUCCESS_TIP;
    }

    /**
     * 删除团队
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer teamInfoId) {
        teamInfoService.deleteById(teamInfoId);
        return SUCCESS_TIP;
    }

    /**
     * 修改团队
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(TeamInfo teamInfo) {
        teamInfoService.updateById(teamInfo);
        return SUCCESS_TIP;
    }

    /**
     * 团队详情
     */
    @RequestMapping(value = "/detail/{teamInfoId}")
    @ResponseBody
    public Object detail(@PathVariable("teamInfoId") Integer teamInfoId) {
        return teamInfoService.selectById(teamInfoId);
    }
}
