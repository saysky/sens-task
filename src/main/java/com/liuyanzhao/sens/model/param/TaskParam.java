package com.liuyanzhao.sens.model.param;

import lombok.Data;


/**
 * @author 言曌
 * @date 2020-01-06 15:45
 */

@Data
public class TaskParam {

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
    private String planTime;

    /**
     * 实际完成时间
     */
    private String finishTime;

    /**
     * 状态：0未完成 1已完成
     */
    private Integer status;
}
