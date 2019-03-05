package com.zkhc.server.modular.system.model;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 团队
 * </p>
 *
 * @author stylefeng
 * @since 2019-03-04
 */
@TableName("team_info")
public class TeamInfo extends Model<TeamInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 团队编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 团队名称
     */
    private String name;
    /**
     * 团队介绍
     */
    private String description;
    /**
     * 创建者编号
     */
    @TableField("admin_user_id")
    private Integer adminUserId;
    /**
     * 创建时间
     */
    @TableField("create_time")
    private Date createTime;
    /**
     * 修改时间
     */
    @TableField("update_time")
    private Date updateTime;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getAdminUserId() {
        return adminUserId;
    }

    public void setAdminUserId(Integer adminUserId) {
        this.adminUserId = adminUserId;
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

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "TeamInfo{" +
        ", id=" + id +
        ", name=" + name +
        ", description=" + description +
        ", adminUserId=" + adminUserId +
        ", createTime=" + createTime +
        ", updateTime=" + updateTime +
        "}";
    }
}
