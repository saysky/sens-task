<#compress >
    <#include "module/_macro.ftl">
    <@head>${options.blog_title} | 添加任务</@head>
    <link rel="stylesheet"
          href="${options.blog_static_url?if_exists}/static/plugins/datepicker/datepicker3.css?version=1.5.0">
    <div class="wrapper">
        <!-- 顶部栏模块 -->
        <#include "module/_header.ftl">
        <!-- 菜单栏模块 -->
        <#include "module/_sidebar.ftl">
        <div class="content-wrapper">
            <style>
                .form-horizontal .control-label {
                    text-align: left;
                }
                .box-body {
                    background: #ffffff;
                }
            </style>
            <section class="content-header">
                <h1>
                    添加任务
                    <small></small>
                </h1>
                <ol class="breadcrumb">
                    <li>
                        <a data-pjax="true" href="/admin">
                            <i class="fa fa-dashboard"></i> <@spring.message code='admin.index.bread.index' /></a>
                    </li>
                    <li><a data-pjax="true" href="#">任务管理</a></li>
                    <li class="active">添加任务</li>
                </ol>
            </section>
            <!-- tab选项卡 -->
            <section class="content container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <form method="post" class="form-horizontal" id="addTaskForm">
                            <input type="hidden" name="status" value="1">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="name" class="col-lg-2 col-sm-4 control-label">任务名称</label>
                                    <div class="col-lg-4 col-sm-8">
                                        <input type="text" class="form-control" id="name" name="name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="planTime" class="col-lg-2 col-sm-4 control-label">计划完成时间</label>
                                    <div class="col-lg-4 col-sm-8">
                                        <input type="text" name="planTime" class="form-control pull-right"
                                               id="datepicker">
                                    </div>
                                </div>
                                <#--                                <div class="form-group">-->
                                <#--                                    <label class="col-lg-2 col-sm-4 control-label"><@spring.message code='admin.user.profile.form.status' /></label>-->
                                <#--                                    <div class="col-lg-4 col-sm-8 control-radio">-->
                                <#--                                        <div class="pretty p-default p-round">-->
                                <#--                                            <input type="radio" name="status" value="0" checked>-->
                                <#--                                            <div class="state p-primary">-->
                                <#--                                                <label>未完成</label>-->
                                <#--                                            </div>-->
                                <#--                                        </div>-->
                                <#--                                        <div class="pretty p-default p-round">-->
                                <#--                                            <input type="radio" name="status" value="1">-->
                                <#--                                            <div class="state p-primary">-->
                                <#--                                                <label><@spring.message code='common.radio.disable' /></label>-->
                                <#--                                            </div>-->
                                <#--                                        </div>-->
                                <#--                                    </div>-->
                                <#--                                </div>-->
                            </div>
                            <div class="box-footer">
                                <button type="button" class="btn btn-primary btn-sm"
                                        onclick="saveTask()"><@spring.message code='common.btn.save' /></button>
                                <a href="/admin/user"
                                   class="btn btn-info btn-sm"> <@spring.message code='common.btn.back' /></a>
                            </div>
                        </form>
                    </div>
            </section>
            <script src="${options.blog_static_url?if_exists}/static/plugins/datepicker/bootstrap-datepicker.js?version=1.5.0"></script>
            <script>

                $('#datepicker').datepicker({
                    autoclose: true,
                    format: "yyyy-mm-dd",
                    language: "zh-CN",
                    todayHighlight: true,
                    setViewDate: new Date()
                });

                function saveTask() {
                    var name = $('#name').val();
                    var planTime = $('#planTime').val();
                    if (name == "" || planTime == "" ) {
                        showMsg('<@spring.message code="common.js.info-no-complete" />', "info", 2000);
                        return;
                    }

                    $.ajax({
                        type: 'post',
                        url: '/admin/task/save',
                        contentType: "application/json;charset=utf-8",
                        data:  JSON.stringify($('#addTaskForm').serialize()),
                        success: function (data) {
                            console.log(data);
                            if (data.code == 1) {
                                $.toast({
                                    text: data.msg,
                                    heading: '<@spring.message code="common.text.tips" />',
                                    icon: 'success',
                                    showHideTransition: 'fade',
                                    allowToastClose: true,
                                    hideAfter: 1000,
                                    stack: 1,
                                    position: 'top-center',
                                    textAlign: 'left',
                                    loader: true,
                                    loaderBg: '#ffffff',
                                    afterHidden: function () {
                                        window.location.href = "/admin/task";
                                    }
                                });
                            } else {
                                showMsg(data.msg, "error", 2000);
                            }
                        }
                    });
                }
            </script>
        </div>
        <#include "module/_footer.ftl">
    </div>
    <@footer></@footer>
</#compress>
