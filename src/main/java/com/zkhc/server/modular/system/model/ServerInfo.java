package com.zkhc.server.modular.system.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author stylefeng
 * @since 2018-12-11
 */
@TableName("zkhc_server_info")
public class ServerInfo extends Model<ServerInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    @TableId(value ="id", type = IdType.INPUT)
    private String id;
    /**
     * 端口名
     */
    @TableField("port_name")
    private String portName;
    /**
     * 服务器地址
     */
    private Integer hostId;
    /**
     * 端口
     */
    private Integer port;
    /**
     * 协议(1:tcp  2:udp  3:http)
     */
    private Integer protocol;
    /**
     * 阿里代理端口
     */
    @TableField("ali_port")
    private Integer aliPort;
    /**
     * ngrok对应端口
     */
    @TableField("ngrok_port")
    private Integer ngrokPort;
    /**
     * 备注
     */
    private String remark;
    /**
     * 状态(0:正常   1:不正常)
     */
    @TableField("ali_status")
    private Integer aliStatus;
    /**
     * 访问状态(0:正常访问   1:不可访问)
     */
    @TableField("fire_status")
    private Integer fireStatus;
    /**
     * 域名
     */
    @TableField("domain_name")
    private String domainName;
    /**
     * 域名
     */
    @TableField("domain_port")
    private String domainPort;
    /**
     * 区域 
     */
    @TableField("fire_zone")
    private String fireZone;
    /**
     * 类型(1:mysql  2:redis  3:mongodb  4:rabbitmq)
     */
    private Integer type;
    /**
     * 创建时间
     */
    @TableField("create_time")
    private Date createTime;
    @TableField("update_time")
    private Date updateTime;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPortName() {
        return portName;
    }

    public void setPortName(String portName) {
        this.portName = portName;
    }

    public Integer getHostId() {
        return hostId;
    }

    public void setHostId(Integer hostId) {
        this.hostId = hostId;
    }

    public Integer getPort() {
        return port;
    }

    public void setPort(Integer port) {
        this.port = port;
    }

    public Integer getProtocol() {
        return protocol;
    }

    public void setProtocol(Integer protocol) {
        this.protocol = protocol;
    }

    public Integer getAliPort() {
        return aliPort;
    }

    public void setAliPort(Integer aliPort) {
        this.aliPort = aliPort;
    }

    public Integer getNgrokPort() {
        return ngrokPort;
    }

    public void setNgrokPort(Integer ngrokPort) {
        this.ngrokPort = ngrokPort;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getAliStatus() {
        return aliStatus;
    }

    public void setAliStatus(Integer aliStatus) {
        this.aliStatus = aliStatus;
    }

    public Integer getFireStatus() {
        return fireStatus;
    }

    public void setFireStatus(Integer fireStatus) {
        this.fireStatus = fireStatus;
    }

    public String getDomainName() {
        return domainName;
    }

    public void setDomainName(String domainName) {
        this.domainName = domainName;
    }

    public String getFireZone() {
        return fireZone;
    }

    public void setFireZone(String fireZone) {
        this.fireZone = fireZone;
    }

    public Integer getType() {
        return type;
    }

    public String getPortType() {
        if(protocol == 1){
            return "tcp";
        }else if(protocol == 2){
            return "udp";
        }else if(protocol == 3){
            return "http";
        }
        return "https";
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getDomainPort() {
        return domainPort;
    }

    public void setDomainPort(String domainPort) {
        this.domainPort = domainPort;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "ServerInfo{" +
        ", id=" + id +
        ", portName=" + portName +
        ", hostId=" + hostId +
        ", port=" + port +
        ", protocol=" + protocol +
        ", aliPort=" + aliPort +
        ", ngrokPort=" + ngrokPort +
        ", remark=" + remark +
        ", aliStatus=" + aliStatus +
        ", fireStatus=" + fireStatus +
        ", domainName=" + domainName +
        ", fireZone=" + fireZone +
        ", type=" + type +
        ", createTime=" + createTime +
        ", updateTime=" + updateTime +
        "}";
    }
}
