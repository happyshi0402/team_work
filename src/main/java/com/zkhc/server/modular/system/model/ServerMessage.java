package com.zkhc.server.modular.system.model;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 服务器信息
 * </p>
 *
 * @author stylefeng
 * @since 2018-12-17
 */
@TableName("zkhc_server_message")
public class ServerMessage extends Model<ServerMessage> {

    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 服务器地址
     */
    @TableField("server_host")
    private String serverHost;
    /**
     * 服务器端口
     */
    @TableField("server_port")
    private Integer serverPort;
    /**
     * 服务器账号
     */
    @TableField("server_user")
    private String serverUser;
    /**
     * 服务器密码
     */
    @TableField("server_password")
    private String serverPassword;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getServerHost() {
        return serverHost;
    }

    public void setServerHost(String serverHost) {
        this.serverHost = serverHost;
    }

    public Integer getServerPort() {
        return serverPort;
    }

    public void setServerPort(Integer serverPort) {
        this.serverPort = serverPort;
    }

    public String getServerUser() {
        return serverUser;
    }

    public void setServerUser(String serverUser) {
        this.serverUser = serverUser;
    }

    public String getServerPassword() {
        return serverPassword;
    }

    public void setServerPassword(String serverPassword) {
        this.serverPassword = serverPassword;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "ServerMessage{" +
        ", id=" + id +
        ", serverHost=" + serverHost +
        ", serverPort=" + serverPort +
        ", serverUser=" + serverUser +
        ", serverPassword=" + serverPassword +
        "}";
    }
}
