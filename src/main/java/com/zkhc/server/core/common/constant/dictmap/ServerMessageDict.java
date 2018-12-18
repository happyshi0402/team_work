package com.zkhc.server.core.common.constant.dictmap;

import com.zkhc.server.core.common.constant.dictmap.base.AbstractDictMap;

public class ServerMessageDict extends AbstractDictMap {
    @Override
    public void init() {
        put("id", "主键id");
        put("serverMessageId", "主键id");
        put("serverHost", "服务器地址");
        put("serverPort", "服务器端口");
        put("serverUser", "服务器账号");
        put("serverPassword", "服务器密码");
    }

    @Override
    protected void initBeWrapped() {

    }
}
