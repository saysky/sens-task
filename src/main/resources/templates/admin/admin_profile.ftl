<#compress >
    <#include "module/_macro.ftl">
    <@head>${options.blog_title} | <@spring.message code='admin.user.profile.title' /></@head>
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

                .third-part a {
                    margin-right: 5px;
                }

                .icon-third-sina, .icon-third-qq, .icon-third-github {
                    width: 32px;
                    height: 32px;
                }

                .icon-third-qq {
                    background-position: -112px -98px !important;
                }

                .icon-third-github {
                    background-position: -186px -98px !important;
                }

                icon-third-sina, .icon-third-qq, .icon-third-github {
                    background: url(/static/images/bg_icons.png) no-repeat;
                    display: inline-block;
                }
            </style>
            <section class="content-header">
                <h1>
                    <@spring.message code='admin.user.profile.title' />
                    <small></small>
                </h1>
                <ol class="breadcrumb">
                    <li>
                        <a data-pjax="true" href="/admin">
                            <i class="fa fa-dashboard"></i> <@spring.message code='admin.index.bread.index' /></a>
                    </li>
                    <li><a data-pjax="true" href="#"><@spring.message code='admin.user.profile.bread.user' /></a></li>
                    <li class="active"><@spring.message code='admin.user.profile.title' /></li>
                </ol>
            </section>
            <!-- tab选项卡 -->
            <section class="content container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#general"
                                       data-toggle="tab"><@spring.message code='admin.user.profile.tab.basic' /></a>
                                </li>
                                <li>
                                    <a href="#pass"
                                       data-toggle="tab"><@spring.message code='admin.user.profile.tab.password-change' /></a>
                                </li>
                                <li>
                                    <a href="#third"
                                       data-toggle="tab"><@spring.message code='admin.user.profile.tab.third-party' /></a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="general">
                                    <form method="post" class="form-horizontal" id="profileForm">
                                        <input type="hidden" id="userPass" name="userPass"
                                               value="${user.userPass?if_exists}">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label for="userName" class="col-lg-2 col-sm-4 control-label">
                                                    当前角色:
                                                </label>
                                                <div class="col-lg-4 col-sm-8" style="padding-top: 7px;">
                                                    <#list roles as role>
                                                        <label>${role.description?if_exists}</label>
                                                    </#list>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="userName"
                                                       class="col-lg-2 col-sm-4 control-label"><@spring.message code='admin.user.profile.form.username' />
                                                    <span data-toggle="tooltip" data-placement="top"
                                                          title="<@spring.message code='admin.user.profile.form.username.tips' />"
                                                          style="cursor: pointer">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i>
                                                </span>
                                                </label>
                                                <div class="col-lg-4 col-sm-8">
                                                    <input type="text" class="form-control" name="userName"
                                                           value="${user.userName?if_exists}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="userDisplayName"
                                                       class="col-lg-2 col-sm-4 control-label"><@spring.message code='admin.user.profile.form.display-name' />
                                                    <span data-toggle="tooltip" data-placement="top"
                                                          title="<@spring.message code='admin.user.profile.form.display-name.tips' />"
                                                          style="cursor: pointer">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i>
                                                </span>
                                                </label>
                                                <div class="col-lg-4 col-sm-8">
                                                    <input type="text" class="form-control" id="userDisplayName"
                                                           name="userDisplayName"
                                                           value="${user.userDisplayName?if_exists}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="userEmail"
                                                       class="col-lg-2 col-sm-4 control-label"><@spring.message code='admin.user.profile.form.email' /></label>
                                                <div class="col-lg-4 col-sm-8">
                                                    <input type="email" class="form-control" id="userEmail"
                                                           name="userEmail"
                                                           value="${user.userEmail?if_exists}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="userAvatar"
                                                       class="col-lg-2 col-sm-4 control-label"><@spring.message code='admin.user.profile.form.avatar' /></label>
                                                <div class="col-lg-4 col-sm-8">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="userAvatar"
                                                               name="userAvatar" value="${user.userAvatar?if_exists}">
                                                        <span class="input-group-btn">
                                                        <button class="btn btn-default " type="button"
                                                                onclick="openAttach('userAvatar')"><@spring.message code='common.btn.choose' /></button>
                                                    </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="userDesc"
                                                       class="col-lg-2 col-sm-4 control-label"><@spring.message code='admin.user.profile.form.desc' />
                                                </label>
                                                <div class="col-lg-4 col-sm-8">
                                                <textarea class="form-control" rows="3" id="userDesc" name="userDesc"
                                                          style="resize: none">${user.userDesc?if_exists}</textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="userEmail"
                                                       class="col-lg-2 col-sm-4 control-label"><@spring.message code='admin.user.profile.form.site' /></label>
                                                <div class="col-lg-4 col-sm-8">
                                                    <input type="url" class="form-control" id="userSite" name="userSite"
                                                           value="${user.userSite?if_exists}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="box-footer">
                                            <button type="button" class="btn btn-primary btn-sm "
                                                    onclick="saveUser('profileForm')"><@spring.message code='common.btn.save' /></button>
                                        </div>
                                    </form>
                                </div>
                                <div class="tab-pane" id="pass">
                                    <form method="post" class="form-horizontal" id="passForm">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label for="beforePass"
                                                       class="col-sm-2 control-label"><@spring.message code='admin.user.profile.form.old-password' /></label>
                                                <div class="col-sm-4">
                                                    <input type="password" class="form-control" id="beforePass"
                                                           name="beforePass">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="newPass"
                                                       class="col-sm-2 control-label"><@spring.message code='admin.user.profile.form.new-password' /></label>
                                                <div class="col-sm-4">
                                                    <input type="password" class="form-control" id="newPass"
                                                           name="newPass">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="reNewPass"
                                                       class="col-sm-2 control-label"><@spring.message code='admin.user.profile.form.confirm-password' /></label>
                                                <div class="col-sm-4">
                                                    <input type="password" class="form-control" id="reNewPass"
                                                           name="reNewPass">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="box-footer">
                                            <button type="button" class="btn btn-primary btn-sm "
                                                    onclick="changPass()"><@spring.message code='common.btn.modify' /></button>
                                        </div>
                                    </form>
                                </div>
                                <div class="tab-pane" id="third">
                                    <table class="table" id="bindList">
                                        <tbody>
                                        <tr>
                                            <th>服务</th>
                                            <th>绑定时间</th>
                                            <th>操作</th>
                                        </tr>
                                        <#list thirdAppBinds as bind>
                                            <tr id="bind-${bind.id}">
                                                <td>
                                                    ${(bind.appType)!}
                                                </td>
                                                <td>${(bind.createTime?string("yyyy-MM-dd HH:mm:ss"))!}</td>
                                                <td>
                                                    <a href="javascript:void(0);" class="text-maroon cancel-bind"
                                                       onclick="removeIt(${bind.id})">解除绑定</a>
                                                </td>
                                            </tr>
                                        </#list>
                                        </tbody>
                                    </table>
                                    <div class="third-part">
                                        <p>您可以绑定以下第三方帐号，绑定后可使用第三方账号快速登录：</p>
                                        <#if options.bind_qq_open?default('true') == 'true' >
                                            <a class="icon-third-qq"
                                               href="https://graph.qq.com/oauth2.0/authorize?response_type=code&amp;client_id=${options.bind_qq_app_id?if_exists}&amp;redirect_uri=${options.bind_qq_callback?if_exists}&amp;scope=get_user_info"
                                               target="_blank"></a>
                                        </#if>
                                        <#if options.bind_github_open?default('true') == 'true' >
                                            <a class="icon-third-github"
                                               href="https://github.com/login/oauth/authorize?client_id=${options.bind_github_app_id?if_exists}&amp;redirect_uri=${options.bind_github_callback?if_exists}&amp;state=abc"
                                               target="_blank"></a>
                                        </#if>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <@compress single_line=true>
                <script>
                    $(function () {
                        $('[data-toggle="tooltip"]').tooltip()
                    });

                    function openAttach(id) {
                        layer.open({
                            type: 2,
                            title: '<@spring.message code="common.js.all-attachment" />',
                            shadeClose: true,
                            shade: 0.5,
                            maxmin: true,
                            area: ['90%', '90%'],
                            content: '/admin/attachment/select?id=' + id,
                            scrollbar: false
                        });
                    }

                    function saveUser(option) {
                        var param = $('#' + option).serialize();
                        $.ajax({
                            type: 'post',
                            url: '/admin/user/profile/save',
                            data: param,
                            success: function (data) {
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
                                            window.location.href = "/admin/logOut";
                                        }
                                    });
                                } else {
                                    showMsg(data.msg, "error", 2000);
                                }
                            }
                        });
                    }

                    function changPass() {
                        var beforePass = $('#beforePass').val();
                        var newPass = $('#newPass').val();
                        var reNewPass = $('#reNewPass').val();
                        if (beforePass == "" || newPass == "" || reNewPass == "") {
                            showMsg("<@spring.message code='common.js.info-no-complete' />", "info", 2000);
                            return;
                        }
                        if (newPass != reNewPass) {
                            showMsg("<@spring.message code='admin.user.profile.form.password.no-same' />", "error", 2000);
                            return;
                        }
                        var param = $('#passForm').serialize();
                        $.ajax({
                            type: 'post',
                            url: '/admin/user/changePass',
                            data: param,
                            success: function (data) {
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
                                            window.location.reload();
                                        }
                                    });
                                } else {
                                    showMsg(data.msg, "error", 2000);
                                }
                            }
                        });
                    }

                    function removeIt(id) {
                        layer.confirm('<@spring.message code="common.text.define-delete" />', function (index) {
                            $.ajax({
                                type: 'POST',
                                url: '/admin/user/deleteBind',
                                async: false,
                                data: {
                                    'id': id
                                },
                                success: function (data) {
                                    console.log(data);
                                    if (data.code == 0) {
                                        showMsg(data.msg, "error", 2000);
                                    } else {
                                        $('#bind-' + id).remove();
                                        showMsg(data.msg, "success", 2000);
                                    }

                                }
                            });
                            layer.close(index);
                        });
                    }
                </script>
            </@compress>
        </div>
        <#include "module/_footer.ftl">
    </div>
    <@footer></@footer>
</#compress>
