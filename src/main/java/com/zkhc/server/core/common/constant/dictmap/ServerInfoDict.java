package com.zkhc.server.core.common.constant.dictmap;

import com.zkhc.server.core.common.constant.dictmap.base.AbstractDictMap;

public class ServerInfoDict extends AbstractDictMap {
    @Override
    public void init() {
        put("id", "主键id");
        put("serverInfoId", "主键id");
        put("portName", "端口名");
        put("port", "端口");
        put("protocol", "协议");
        put("aliPort", "阿里代理端口");
        put("ngrokPort", "ngrok对应端口");
        put("aliStatus", "状态");
        put("fireStatus", "访问状态");
        put("domainName", "域名");
        put("fireZone", "区域");
        put("type", "类型");
    }

    @Override
    protected void initBeWrapped() {

    }
}
