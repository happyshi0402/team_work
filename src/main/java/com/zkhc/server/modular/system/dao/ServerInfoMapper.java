package com.zkhc.server.modular.system.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.zkhc.server.modular.system.model.ServerInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author stylefeng
 * @since 2018-12-11
 */
public interface ServerInfoMapper extends BaseMapper<ServerInfo> {
    /**
     * 获取列表
     */
    List<Map<String, Object>> list(@Param("condition") String condition);
}
