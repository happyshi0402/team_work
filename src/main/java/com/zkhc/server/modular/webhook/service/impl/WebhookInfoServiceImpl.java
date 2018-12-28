package com.zkhc.server.modular.webhook.service.impl;

import com.zkhc.server.modular.system.model.WebhookInfo;
import com.zkhc.server.modular.system.dao.WebhookInfoMapper;
import com.zkhc.server.modular.webhook.service.IWebhookInfoService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 消息信息 服务实现类
 * </p>
 *
 * @author wsf
 * @since 2018-12-27
 */
@Service
public class WebhookInfoServiceImpl extends ServiceImpl<WebhookInfoMapper, WebhookInfo> implements IWebhookInfoService {

}
