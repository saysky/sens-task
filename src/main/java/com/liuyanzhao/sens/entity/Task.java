package com.liuyanzhao.sens.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.liuyanzhao.sens.common.base.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author 言曌
 * @date 2020-01-05 22:12
 */
@Data
@TableName("sens_task")
@Builder
@NoArgsConstructor
@AllArgsConstructor
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
     * 计划完成时间
     */
    private Date planTime;


    /**
     * 实际完成时间
     */
    private Date finishTime;

    /**
     * 状态：0未完成 1已完成
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
