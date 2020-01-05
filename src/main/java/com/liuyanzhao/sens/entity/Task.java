package com.liuyanzhao.sens.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.liuyanzhao.sens.common.base.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * @author 言曌
 * @date 2020-01-05 22:12
 */
@Data
@TableName("sens_task")
public class Task extends BaseEntity {

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 任务名称
     */
    private String name;

    /**
     * 开始时间
     */
    private Date startTime;

    /**
     * 结束时间
     */
    private Date endTime;

    /**
     * 状态：0逾期  1未完成 2已完成
     */
    private Integer status;


//    /**
//     *  任务类型
//     */
//    private Integer type;
//
//    /**
//     * cron表达式
//     */
//    private String cron;
}
