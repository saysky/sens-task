<#compress >
    <#include "module/_macro.ftl">
    <@head>${options.blog_title} | 任务管理</@head>
    <div class="wrapper">
        <!-- 顶部栏模块 -->
        <#include "module/_header.ftl">
        <!-- 菜单栏模块 -->
        <#include "module/_sidebar.ftl">
        <div class="content-wrapper">
            <style type="text/css" rel="stylesheet">


                #btnNewTask {
                    margin-left: 4px;
                    padding: 3px 6px;
                    position: relative;
                    top: -4px;
                    border: 1px solid #ccc;
                    border-radius: 2px;
                    background: #fff;
                    text-shadow: none;
                    font-weight: 600;
                    font-size: 12px;
                    line-height: normal;
                    color: #3c8dbc;
                    cursor: pointer;
                    transition: all .2s ease-in-out
                }

                #btnNewTask:hover {
                    background: #3c8dbc;
                    color: #fff
                }
                .box-body {
                    background: #ffffff;
                }
            </style>
            <section class="content-header">
                <h1 style="display: inline-block;">任务管理</h1>
                <a data-pjax="false" id="btnNewTask" href="/admin/task/new">
                    添加任务
                </a>
                <ol class="breadcrumb">
                    <li>
                        <a data-pjax="true" href="/admin">
                            <i class="fa fa-dashboard"></i> <@spring.message code='admin.index.bread.index' /></a>
                    </li>
                    <li><a data-pjax="true" href="#">任务管理</a></li>
                    <li class="active">所有任务</li>
                </ol>
            </section>
            <section class="content container-fluid">
                    <div class="col-xs-12">
                        <div class="col-md-4 col-xs-12" style="margin-bottom: 10px;padding-left: 0;">
                            <a class="btn btn-primary" href="/admin/task/new">
                                <i class="fa fa-plus"></i> 新增
                            </a>
                            <button type="button" class="btn btn-danger" onclick="batchDelete()">
                                <i class="fa fa-remove"></i> 批量删除
                            </button>
                        </div>
                        <div class="col-md-8 col-xs-12"
                             style="margin-bottom: 10px; text-align:right;padding-left: 0; padding-right: 0;">
                            <form class="form-inline" action="/admin/task">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="keywords" name="keywords"
                                           value="${keywords!}" placeholder="请输入关键字">
                                </div>
                                <div class="form-group">
                                    <select class="form-control" name="status">
                                        <option value="-1" disabled>进度</option>
                                        <option value="-1" <#if status == -1>selected</#if>>不限</option>
                                        <option value="1" <#if status == 0>selected</#if>>未完成</option>
                                        <option value="2" <#if status == 1>selected</#if>>已完成</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="form-control" name="sort">
                                        <option value="planTime" disabled>排序方式</option>
                                        <option value="createTime" <#if sort == 'createTime'>selected</#if>>创建时间</option>
                                        <option value="planTime" <#if sort == 'planTime'>selected</#if>>计划完成时间</option>
                                        <option value="finishTime" <#if sort == 'finishTime'>selected</#if>>实际完成时间</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="form-control" name="order">
                                        <option value="desc" disabled>升序/降序</option>
                                        <option value="desc" <#if order == 'desc'>selected</#if>>降序</option>
                                        <option value="asc" <#if order == 'asc'>selected</#if>>升序</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> 搜索</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="box box-primary">
                            <div class="box-body table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th class="col-md-1"><input type="checkbox" id="allSelect" onclick="doCheck()"></th>
                                        <th class="col-md-2">任务名称</th>
                                        <th class="col-md-1">进度</th>
                                        <th class="col-md-2">计划完成时间</th>
                                        <th class="col-md-2">实际完成时间</th>
                                        <th class="col-md-2">创建时间</th>
                                        <th class="col-md-2">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if tasks?size gt 0>
                                        <#list tasks as task>
                                            <tr id="task-${task.id}">
                                                <td><input type="checkbox" name="ids" value="${task.id?c}"></td>
                                                <td>${task.name!}</td>
                                                <td>
                                                    <#switch task.status>
                                                        <#case 0>
                                                            <span class="text-danger">未完成</span>
                                                            <#break >
                                                        <#case 1>
                                                            <span class="text-warning">已完成</span>
                                                            <#break >
                                                    </#switch>
                                                </td>
                                                <td>${(task.planTime?string("yyyy-MM-dd"))!}</td>
                                                <td>${(task.finishTime?string("yyyy-MM-dd"))!}</td>
                                                <td>${(task.createTime?string("yyyy-MM-dd"))!}</td>
                                                <td>
                                                    <a href="/admin/task/edit?id=${task.id?c}"
                                                       class="btn btn-info btn-xs "><@spring.message code='common.btn.edit' /></a>
                                                    <a href="javascript:void(0)" onclick="removeIt(${task.id})"
                                                       class="btn btn-danger btn-xs "><@spring.message code='common.btn.delete' /></a>
                                                </td>
                                            </tr>
                                        </#list>
                                    <#else>
                                        <tr>
                                            <th colspan="7"
                                                style="text-align: center"><@spring.message code='common.text.no-data' /></th>
                                        </tr>
                                    </#if>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box-footer clearfix">
                                <#assign hasPrevious = (pageInfo.current > 1)>
                                <#assign hasNext = (pageInfo.current < pageInfo.pages)>
                                <div class="no-margin pull-left">
                                    <@spring.message code='admin.pageinfo.text.no' />${pageInfo.current}
                                    /${pageInfo.pages}<@spring.message code='admin.pageinfo.text.page' />
                                </div>
                                <ul class="pagination no-margin pull-right">
                                    <li><a data-pjax="true" class="btn btn-sm <#if !hasPrevious>disabled</#if>"
                                           href="/admin/task?keywords=${keywords!}&status=${status}&sort=${sort}&order=${order}"><@spring.message code='admin.pageinfo.btn.first' /></a>
                                    </li>
                                    <li><a data-pjax="true" class="btn btn-sm <#if !hasPrevious>disabled</#if>"
                                           href="/admin/task?page=${pageInfo.current-1}&keywords=${keywords!}&status=${status}&sort=${sort}&order=${order}"><@spring.message code='admin.pageinfo.btn.pre' /></a>
                                    </li>
                                    <li><a data-pjax="true" class="btn btn-sm <#if !hasNext>disabled</#if>"
                                           href="/admin/task?page=${pageInfo.current+1}&keywords=${keywords!}&status=${status}&sort=${sort}&order=${order}"><@spring.message code='admin.pageinfo.btn.next' /></a>
                                    </li>
                                    <li><a data-pjax="true" class="btn btn-sm <#if !hasNext>disabled</#if>"
                                           href="/admin/task?page=${pageInfo.pages}&keywords=${keywords!}&status=${status}&sort=${sort}&order=${order}"><@spring.message code='admin.pageinfo.btn.last' /></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <script>

                function removeIt(id) {
                    layer.confirm('<@spring.message code="common.text.define-delete" />', function (index) {
                        $.ajax({
                            type: 'POST',
                            url: '/admin/task/delete',
                            async: false,
                            data: {
                                'id': id
                            },
                            success: function (data) {
                                if (data.code == 0) {
                                    showMsg(data.msg, "error", 2000);
                                } else {
                                    showMsg(data.msg, "success", 2000);
                                    $('#task-' + id).remove();
                                }

                            }
                        });
                        layer.close(index);
                    });
                }
                function batchDelete() {
                    var arr = [];
                    $('input[name="ids"]:checked').each(function () {
                        arr.push($(this).val());
                    });
                    if (arr.length <= 0) {
                        showMsg('<@spring.message code="common.text.please-select-the-data-to-be-deleted" />', "error", 2000);
                    } else {
                        layer.confirm('<@spring.message code="common.text.define-delete" />', function (index) {
                            $.ajax({
                                url: "/admin/task/batchDelete?ids=" + arr,
                                type: "DELETE",
                                success: function (data) {
                                    if (data.code == 0) {
                                        showMsg(data.msg, "error", 2000);
                                    } else {
                                        showMsgAndReload(data.msg, "success", 2000);
                                    }
                                }
                            });
                            layer.close(index);
                        });
                    }
                }

            </script>
        </div>
        <#include "module/_footer.ftl">
    </div>
    <@footer></@footer>
</#compress>
