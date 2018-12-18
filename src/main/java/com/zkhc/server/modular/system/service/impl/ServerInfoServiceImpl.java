package com.zkhc.server.modular.system.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.zkhc.server.modular.system.dao.ServerInfoMapper;
import com.zkhc.server.modular.system.model.ServerInfo;
import com.zkhc.server.modular.system.service.IServerInfoService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author stylefeng
 * @since 2018-12-11
 */
@Service
public class ServerInfoServiceImpl extends ServiceImpl<ServerInfoMapper, ServerInfo> implements IServerInfoService {

    @Override
    public List<Map<String, Object>> list(String condition) {
        return this.baseMapper.list(condition);
    }
}
