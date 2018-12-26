package com.zkhc.server.task;

import com.zkhc.server.core.common.annotion.BussinessLog;
import com.zkhc.server.modular.system.model.ServerInfo;
import com.zkhc.server.modular.system.model.ServerMessage;
import com.zkhc.server.modular.system.service.IServerInfoService;
import com.zkhc.server.modular.system.service.IServerMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
public class SystemTask {
    @Autowired
    private Environment env;

    @Autowired
    private IServerInfoService serverInfoService;
    /**
     *
     秒（0~59）
     分钟（0~59）
     3 小时（0~23）
     4 天（0~31）
     5 月（0~11）
     6 星期（1~7 1=SUN 或 SUN，MON，TUE，WED，THU，FRI，SAT）
     年份（1970－2099）
     医生收支项目	订单号	发放方式	昵称	解冻时间
     伯乐奖	空	平台	伯乐奖	10天后
     绑定设备	空	平台	伯乐奖	10天后
     咨询费用	订单号	患者付费	次/月/季	1天后
     */
//    @Scheduled(cron = "0 0 12 * * *")
//    @Scheduled(cron = "0 1 0 * * *")
//    @Scheduled(cron = "0/30 * * * * *")
    public void DeforstingBlanceTask() {
        List<ServerInfo> list = serverInfoService.selectList(null);
        for(ServerInfo serverInfo:list){
            if(serverInfo.getFireStatus() == 1){

            }
        }

    }
}
