package com.liuyanzhao.sens.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.liuyanzhao.sens.entity.Task;
import com.liuyanzhao.sens.mapper.TaskMapper;
import com.liuyanzhao.sens.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * <pre>
 *     任务业务逻辑实现类
 * </pre>
 *
 * @author : saysky
 * @date : 2018/1/19
 */
@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskMapper taskMapper;

    @Override
    public BaseMapper<Task> getRepository() {
        return taskMapper;
    }

    @Override
    public QueryWrapper<Task> getQueryWrapper(Task task) {
        //对指定字段查询
        QueryWrapper<Task> queryWrapper = new QueryWrapper<>();
        if (task != null) {
            if (StrUtil.isNotBlank(task.getName())) {
                queryWrapper.like("name", task.getName());
            }
            if (task.getStatus() != null && task.getStatus() != -1) {
                queryWrapper.eq("status", task.getStatus());
            }
            if (task.getUserId() != null) {
                queryWrapper.eq("user_id", task.getUserId());
            }
        }
        return queryWrapper;
    }


    @Override
    public Task insertOrUpdate(Task entity) {
        if (entity.getId() == null) {
            insert(entity);
        } else {
            update(entity);
        }
        return entity;
    }

}
