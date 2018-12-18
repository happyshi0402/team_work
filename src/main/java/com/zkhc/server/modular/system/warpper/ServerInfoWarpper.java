package com.zkhc.server.modular.system.warpper;

import cn.stylefeng.roses.core.base.warpper.BaseControllerWrapper;
import cn.stylefeng.roses.kernel.model.page.PageResult;
import com.baomidou.mybatisplus.plugins.Page;
import com.zkhc.server.core.common.constant.factory.ConstantFactory;

import java.util.List;
import java.util.Map;

public class ServerInfoWarpper extends BaseControllerWrapper {
    public ServerInfoWarpper(Map<String, Object> single) {
        super(single);
    }

    public ServerInfoWarpper(List<Map<String, Object>> multi) {
        super(multi);
    }

    public ServerInfoWarpper(Page<Map<String, Object>> page) {
        super(page);
    }

    public ServerInfoWarpper(PageResult<Map<String, Object>> pageResult) {
        super(pageResult);
    }

    @Override
    protected void wrapTheMap(Map<String, Object> map) {
        map.put("protocolName", ConstantFactory.me().getProtocolName((Integer) map.get("protocol")));
        map.put("aliStatusName", ConstantFactory.me().getAliStatus((Integer) map.get("aliStatus")));
        map.put("fireStatusName", ConstantFactory.me().getFireStatus((Integer) map.get("fireStatus")));
        map.put("typeName", ConstantFactory.me().getType((Integer) map.get("type")));
        map.put("host", ConstantFactory.me().getHost((Integer) map.get("hostId")));
    }
}
