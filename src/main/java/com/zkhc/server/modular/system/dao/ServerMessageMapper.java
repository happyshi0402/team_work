package com.zkhc.server.modular.system.dao;

import com.zkhc.server.modular.system.model.ServerMessage;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 服务器信息 Mapper 接口
 * </p>
 *
 * @author stylefeng
 * @since 2018-12-17
 */
public interface ServerMessageMapper extends BaseMapper<ServerMessage> {
    /**
     * 获取列表
     */
    List<Map<String, Object>> list(@Param("condition") String condition);
}
