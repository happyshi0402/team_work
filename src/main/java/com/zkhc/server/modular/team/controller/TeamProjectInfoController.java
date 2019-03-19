package com.zkhc.server.modular.team.controller;

import cn.stylefeng.roses.core.base.controller.BaseController;
import com.zkhc.server.core.util.UUIDUtil;
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

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 项目管理控制器
 *
 * @author fengshuonan
 * @Date 2019-03-05 09:06:59
 */
@Controller
@RequestMapping("/teamProjectInfo")
public class TeamProjectInfoController extends BaseController {

    private String PREFIX = "/team/teamProjectInfo/";

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
    @RequestMapping("/teamProjectInfo_add/{teamId}")
    public String teamProjectInfoAdd(@PathVariable("teamId") Integer teamId,Model model) {
        model.addAttribute("teamId",teamId);
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
     * 获取某团队下所有项目
     */
    @RequestMapping(value = "/teamProject/{teamId}")
    public Object teamProject(@PathVariable("teamId") Integer teamId,Model model) {
        List<Map<String, Object>> list= teamProjectInfoService.selectProjectByTeam(teamId);
        model.addAttribute("item",list);
        model.addAttribute("len",list.size());
        model.addAttribute("teamId",teamId);
        return PREFIX + "teamProjectInfo.html";
    }

    /**
     * 新增项目管理
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(TeamProjectInfo teamProjectInfo) {
        teamProjectInfo.setId(UUIDUtil.getUUID());
        teamProjectInfo.setCreateTime(new Date());
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

    /**
     * 获取项目图标
     */
    @RequestMapping(value = "/getProjectImg")
    @ResponseBody
    public Object getProjectImg() {
        String path=System.getProperty("user.dir");
        File file=new File(path+"\\src\\main\\webapp\\static\\img\\project");
        List<String> list=new ArrayList<String>();
        if(file.isDirectory()){
            File [] lists = file.listFiles();
            for (File item : lists) {
                String ph=item.toString();
                String temp[] = ph.split("\\\\");
                list.add(temp[temp.length - 1]);
            }
        }
        return list;
    }
}
