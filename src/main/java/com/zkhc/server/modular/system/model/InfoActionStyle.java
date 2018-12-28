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
 * 消息处理格式
 * </p>
 *
 * @author wsf
 * @since 2018-12-28
 */
@TableName("zkhc_info_action_style")
public class InfoActionStyle extends Model<InfoActionStyle> {

    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 消息类别
     */
    @TableField("type_name")
    private String typeName;
    /**
     * 数据区分
     */
    @TableField("unique_attr")
    private String uniqueAttr;
    /**
     * 信息标题
     */
    @TableField("show_title")
    private String showTitle;
    /**
     * 显示内容格式
     */
    @TableField("show_con")
    private String showCon;
    /**
     * 内容参数格式
     */
    @TableField("show_plist")
    private String showPlist;
    /**
     * 备注
     */
    private String remark;
    /**
     * 添加时间
     */
    @TableField("add_time")
    private Date addTime;
    /**
     * 更新时间
     */
    @TableField("update_time")
    private Integer updateTime;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getUniqueAttr() {
        return uniqueAttr;
    }

    public void setUniqueAttr(String uniqueAttr) {
        this.uniqueAttr = uniqueAttr;
    }

    public String getShowTitle() {
        return showTitle;
    }

    public void setShowTitle(String showTitle) {
        this.showTitle = showTitle;
    }

    public String getShowCon() {
        return showCon;
    }

    public void setShowCon(String showCon) {
        this.showCon = showCon;
    }

    public String getShowPlist() {
        return showPlist;
    }

    public void setShowPlist(String showPlist) {
        this.showPlist = showPlist;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Integer getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Integer updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "InfoActionStyle{" +
        ", id=" + id +
        ", typeName=" + typeName +
        ", uniqueAttr=" + uniqueAttr +
        ", showTitle=" + showTitle +
        ", showCon=" + showCon +
        ", showPlist=" + showPlist +
        ", remark=" + remark +
        ", addTime=" + addTime +
        ", updateTime=" + updateTime +
        "}";
    }
}
