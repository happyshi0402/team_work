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
 * 消息信息
 * </p>
 *
 * @author wsf
 * @since 2018-12-27
 */
@TableName("zkhc_webhook_info")
public class WebhookInfo extends Model<WebhookInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 消息类别
     */
    @TableField("type_name")
    private String typeName;
    /**
     * 消息内容
     */
    private String content;
    @TableField("add_time")
    private Date addTime;
    /**
     * 状态：1.未发出  2.已发出 3.失败 
     */
    private Integer status;
    /**
     * 查看次数
     */
    private Integer count;
    /**
     * 备注
     */
    private String remark;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "WebhookInfo{" +
        ", id=" + id +
        ", typeName=" + typeName +
        ", content=" + content +
        ", addTime=" + addTime +
        ", status=" + status +
        ", count=" + count +
        ", remark=" + remark +
        "}";
    }
}
