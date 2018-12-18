package com.zkhc.server.modular.system.service.impl;

import com.zkhc.server.modular.system.model.ServerMessage;
import com.zkhc.server.modular.system.dao.ServerMessageMapper;
import com.zkhc.server.modular.system.service.IServerMessageService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 服务器信息 服务实现类
 * </p>
 *
 * @author stylefeng
 * @since 2018-12-17
 */
@Service
public class ServerMessageServiceImpl extends ServiceImpl<ServerMessageMapper, ServerMessage> implements IServerMessageService {

    @Override
    public List<Map<String, Object>> list(String condition) {
        return this.baseMapper.list(condition);
    }
}
