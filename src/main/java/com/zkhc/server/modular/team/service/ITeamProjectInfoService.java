package com.zkhc.server.modular.team.service;

import com.zkhc.server.modular.team.model.TeamProjectInfo;
import com.baomidou.mybatisplus.service.IService;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 项目 服务类
 * </p>
 *
 * @author stylefeng
 * @since 2019-03-05
 */
public interface ITeamProjectInfoService extends IService<TeamProjectInfo> {
    /**
     * 查询某个team下的所有项目
     * @param teamId
     * @return
     */
    List<Map<String, Object>> selectProjectByTeam(@Param("teamId") Integer teamId);
}
