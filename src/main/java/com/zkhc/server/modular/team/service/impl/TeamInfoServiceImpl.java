package com.zkhc.server.modular.team.service.impl;

import com.zkhc.server.modular.team.model.TeamInfo;
import com.zkhc.server.modular.team.dao.TeamInfoMapper;
import com.zkhc.server.modular.team.service.ITeamInfoService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 团队 服务实现类
 * </p>
 *
 * @author stylefeng
 * @since 2019-03-04
 */
@Service
public class TeamInfoServiceImpl extends ServiceImpl<TeamInfoMapper, TeamInfo> implements ITeamInfoService {

}
