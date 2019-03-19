package com.zkhc.server.modular.team.model;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 项目
 * </p>
 *
 * @author stylefeng
 * @since 2019-03-05
 */
@TableName("team_project_info")
public class TeamProjectInfo extends Model<TeamProjectInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 项目编号
     */
    private String id;
    /**
     * 团队
     */
    @TableField("team_id")
    private Integer teamId;
    /**
     * 项目名称
     */
    private String name;
    /**
     * 项目描述
     */
    private String description;
    /**
     * 图标
     */
    private String icon;
    /**
     * 创建时间
     */
    @TableField("create_time")
    private Date createTime;
    /**
     * 更新时间
     */
    @TableField("update_time")
    private Date updateTime;
    /**
     * 项目状态（1.正常 2.锁定）
     */
    private Integer status;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getTeamId() {
        return teamId;
    }

    public void setTeamId(Integer teamId) {
        this.teamId = teamId;
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

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "TeamProjectInfo{" +
        ", id=" + id +
        ", teamId=" + teamId +
        ", name=" + name +
        ", description=" + description +
        ", icon=" + icon +
        ", createTime=" + createTime +
        ", updateTime=" + updateTime +
        ", status=" + status +
        "}";
    }
}
