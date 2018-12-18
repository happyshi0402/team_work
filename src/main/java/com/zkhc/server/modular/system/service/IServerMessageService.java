package com.zkhc.server.modular.system.service;

import com.zkhc.server.modular.system.model.ServerMessage;
import com.baomidou.mybatisplus.service.IService;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 服务器信息 服务类
 * </p>
 *
 * @author stylefeng
 * @since 2018-12-17
 */
public interface IServerMessageService extends IService<ServerMessage> {
    /**
     * 获取列表
     */
    List<Map<String, Object>> list(@Param("condition") String condition);
}
