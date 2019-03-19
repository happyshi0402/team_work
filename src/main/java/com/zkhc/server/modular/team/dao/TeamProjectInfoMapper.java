package com.zkhc.server.modular.team.dao;

import com.zkhc.server.modular.team.model.TeamProjectInfo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 项目 Mapper 接口
 * </p>
 *
 * @author stylefeng
 * @since 2019-03-05
 */
public interface TeamProjectInfoMapper extends BaseMapper<TeamProjectInfo> {
    /**
     * 查询某个team下的所有项目
     * @param teamId
     * @return
     */
    List<Map<String, Object>> selectProjectByTeam(@Param("teamId") Integer teamId);
}
