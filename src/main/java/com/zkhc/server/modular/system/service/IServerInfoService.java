package com.zkhc.server.modular.system.service;

import com.baomidou.mybatisplus.service.IService;
import com.zkhc.server.modular.system.model.ServerInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author stylefeng
 * @since 2018-12-11
 */
public interface IServerInfoService extends IService<ServerInfo> {
    /**
     * 获取列表
     */
    List<Map<String, Object>> list(@Param("condition") String condition);
}
