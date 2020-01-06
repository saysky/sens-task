package com.liuyanzhao.sens.web.controller.admin;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.liuyanzhao.sens.config.annotation.SystemLog;
import com.liuyanzhao.sens.entity.Task;
import com.liuyanzhao.sens.entity.User;
import com.liuyanzhao.sens.model.dto.JsonResult;
import com.liuyanzhao.sens.model.dto.QueryCondition;
import com.liuyanzhao.sens.model.enums.LogTypeEnum;
import com.liuyanzhao.sens.model.param.TaskParam;
import com.liuyanzhao.sens.service.TaskService;
import com.liuyanzhao.sens.utils.LocaleMessageUtil;
import com.liuyanzhao.sens.utils.PageUtil;
import com.liuyanzhao.sens.web.controller.common.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * <pre>
 *     任务管理控制器
 * </pre>
 *
 * @author : saysky
 * @date : 2017/12/24
 */
@Slf4j
@Controller
@RequestMapping(value = "/admin/task")
public class TaskController extends BaseController {

    @Autowired
    private TaskService taskService;

    public static final String DATE_PATTERN = "yyyy-MM-dd";

    /**
     * 查询所有分类并渲染task页面
     *
     * @return 模板路径admin/admin_task
     */
    @GetMapping
    public String tasks(
            @RequestParam(value = "status", defaultValue = "-1") Integer status,
            @RequestParam(value = "keywords", required = false) String keywords,
            @RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
            @RequestParam(value = "size", defaultValue = "10") Integer pageSize,
            @RequestParam(value = "sort", defaultValue = "createTime") String sort,
            @RequestParam(value = "order", defaultValue = "desc") String order, Model model) {
        User user = getLoginUser();
        //任务列表
        Page page = PageUtil.initMpPage(pageNumber, pageSize, sort, order);
        Task condition = new Task();
        condition.setName(keywords);
        condition.setUserId(user.getId());
        condition.setStatus(status);

        Page<Task> tasks = taskService.findAll(page, new QueryCondition(condition));

        model.addAttribute("tasks", tasks.getRecords());
        model.addAttribute("pageInfo", PageUtil.convertPageVo(page));
        model.addAttribute("status", status);
        model.addAttribute("keywords", keywords);
        model.addAttribute("sort", sort);
        model.addAttribute("order", order);
        return "admin/admin_task";
    }


    /**
     * 删除任务
     *
     * @param taskId 任务Id
     * @return JsonResult
     */
    @PostMapping(value = "/delete")
    @ResponseBody
    public JsonResult removeTask(@RequestParam("id") Long taskId) {
        User user = getLoginUser();
        Task task = taskService.get(taskId);
        if (task == null) {
            return JsonResult.error("任务不存在");
        }
        if (!Objects.equals(task.getUserId(), user.getId())) {
            return JsonResult.error("没有权限");
        }
        taskService.delete(taskId);
        return JsonResult.success("删除成功");
    }

    /**
     * 添加任务页面
     *
     * @return 模板路径admin/admin_edit
     */
    @GetMapping("/new")
    public String addTask(Model model) {
        return "admin/admin_task_add";
    }

    /**
     * 编辑任务页面
     *
     * @return 模板路径admin/admin_edit
     */
    @GetMapping("/edit")
    public String edit(@RequestParam("id") Long taskId, Model model) {
        Task task = taskService.get(taskId);
        if (task != null) {
            model.addAttribute("task", task);
            return "admin/admin_task_edit";
        }
        return this.renderNotFound();
    }

    /**
     * 批量删除
     *
     * @param ids 任务ID列表
     * @return
     */
    @DeleteMapping(value = "/batchDelete")
    @ResponseBody
    @SystemLog(description = "批量删除任务", type = LogTypeEnum.OPERATION)
    public JsonResult batchDelete(@RequestParam("ids") List<Long> ids) {
        if (ids == null || ids.size() == 0 || ids.size() >= 100) {
            return JsonResult.error("参数不合法!");
        }
        User user = getLoginUser();
        List<Task> taskList = taskService.findByBatchIds(ids);
        for (Task task : taskList) {
            if (!Objects.equals(task.getUserId(), user.getId())) {
                return JsonResult.error("没有权限");
            }
        }
        taskService.batchDelete(ids);
        return JsonResult.success("删除成功");
    }

    /**
     * 新增/修改任务
     *
     * @param taskParam task
     * @return 重定向到/admin/task
     */
    @PostMapping(value = "/save")
    @ResponseBody
    @SystemLog(description = "保存任务", type = LogTypeEnum.OPERATION)
    public JsonResult saveTask(@RequestBody TaskParam taskParam) {
        User user = getLoginUser();
        Integer status = taskParam.getStatus();
        if (status == null || status != 1 && status != 0) {
            return JsonResult.error("状态不合法");
        }

        Date planDate = DateUtil.parse(taskParam.getPlanTime(), DATE_PATTERN);
        Date finishDate = DateUtil.parse(taskParam.getPlanTime(), DATE_PATTERN);
        Task task = Task.builder()
                .status(status)
                .userId(user.getId())
                .name(taskParam.getName())
                .planTime(planDate)
                .finishTime(finishDate)
                .name(taskParam.getName())
                .build();
        task.setUserId(taskParam.getUserId());
        taskService.insertOrUpdate(task);

        return JsonResult.success("保存成功");
    }


}
