package com.zkhc.server.modular.team.service.impl;

import com.zkhc.server.modular.team.model.TeamProjectInfo;
import com.zkhc.server.modular.team.dao.TeamProjectInfoMapper;
import com.zkhc.server.modular.team.service.ITeamProjectInfoService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 项目 服务实现类
 * </p>
 *
 * @author stylefeng
 * @since 2019-03-05
 */
@Service
public class TeamProjectInfoServiceImpl extends ServiceImpl<TeamProjectInfoMapper, TeamProjectInfo> implements ITeamProjectInfoService {

    @Override
    public List<Map<String, Object>> selectProjectByTeam(Integer teamId) {
        return this.baseMapper.selectProjectByTeam(teamId);
    }
}
