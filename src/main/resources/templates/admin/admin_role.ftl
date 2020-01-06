<#compress >
    <#include "module/_macro.ftl">
    <@head>${options.blog_title} | <@spring.message code='admin.roles.title' /></@head>
<div class="wrapper">
    <!-- 顶部栏模块 -->
    <#include "module/_header.ftl">
    <!-- 菜单栏模块 -->
    <#include "module/_sidebar.ftl">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <@spring.message code='admin.roles.title' />
                <small></small>
            </h1>
            <ol class="breadcrumb">
                <li>
                    <a data-pjax="true" href="/admin">
                        <i class="fa fa-dashboard"></i> <@spring.message code='admin.index.bread.index' /></a>
                </li>
                <li><a data-pjax="true" href="#"><@spring.message code='admin.roles.bread.roles' /></a></li>
                <li class="active"><@spring.message code='admin.roles.title' /></li>
            </ol>
        </section>
        <section class="content container-fluid">
            <div class="row">
                <div class="col-md-4">
                    <div class="box box-primary">
                        <#if updateRole??>
                            <div class="box-header with-border">
                                <h3 class="box-title"><@spring.message code='admin.roles.text.edit-role' /> <#if updateRole??>
                                    [${updateRole.role}]</#if>
                                </h3>
                            </div>
                            <form action="/admin/role/save" method="post" role="form" id="roleUpdateForm">
                                <input type="hidden" name="id" value="${updateRole.id?c}">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="role"><@spring.message code='admin.roles.form.role-name' /></label>
                                        <input type="text" class="form-control" id="role" name="role"
                                               value="${updateRole.role?if_exists}">
                                    </div>
                                    <div class="form-group">
                                        <label for="description"><@spring.message code='admin.roles.form.role-desc' /></label>
                                        <input type="text" class="form-control" id="description" name="description"
                                               value="${updateRole.description?if_exists}">
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <button type="submit"
                                            class="btn btn-primary btn-sm "><@spring.message code='common.btn.define-edit' /></button>
                                    <a data-pjax="true" href="/admin/role"
                                       class="btn btn-info btn-sm "><@spring.message code='common.btn.back-to-add' /></a>
                                </div>
                            </form>
                        <#else >
                            <div class="box-header with-border">
                                <h3 class="box-title"><@spring.message code='admin.roles.text.add-role' /></h3>
                            </div>
                            <form action="/admin/role/save" method="post" role="form" id="roleAddForm">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="role"><@spring.message code='admin.roles.form.role-name' /></label>
                                        <input type="text" class="form-control" id="role" name="role">
                                    </div>
                                    <div class="form-group">
                                        <label for="description"><@spring.message code='admin.roles.form.role-desc' /></label>
                                        <input type="text" class="form-control" id="description" name="description">
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <button type="submit"
                                            class="btn btn-primary btn-sm "><@spring.message code='common.btn.define-add' /></button>
                                </div>
                            </form>
                        </#if>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><@spring.message code='admin.roles.text.all-roles' /></h3>
                        </div>
                        <div class="box-body table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th><@spring.message code='common.th.role-code' /></th>
                                    <th><@spring.message code='common.th.desc' /></th>
                                    <th><@spring.message code='common.th.permissions-count' /></th>
                                    <th><@spring.message code='common.th.control' /></th>
                                </tr>
                                </thead>
                                <tbody>
                                    <#list roles as role>
                                    <tr>
                                        <td>${role.role?if_exists}</td>
                                        <td>${role.description?if_exists}</td>
                                        <td>
                                            <span  class="label"
                                                   style="background-color: #d6cdcd;" title="<#list role.permissions as permission>${permission.name?if_exists} &nbsp;</#list> ">${role.permissions?size}</span></td>
                                        <td>
                                            <#if updateRole?? && updateRole.id?c==role.id?c>
                                                <a href="#" class="btn btn-primary btn-xs "
                                                   disabled><@spring.message code='common.btn.editing' /></a>
                                            <#else >
                                                <a data-pjax="true"
                                                   href="/admin/role/edit?id=${role.id?c}"
                                                   class="btn btn-primary btn-xs "><@spring.message code='common.btn.modify' /></a>
                                            </#if>
                                            <button class="btn btn-danger btn-xs delete-role"
                                                    onclick="removeIt(${role.id?c})"><@spring.message code='common.btn.delete' /></button>
                                        </td>
                                    </tr>
                                    </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>

            function removeIt(id) {
                layer.confirm('<@spring.message code="common.text.define-delete" />', function (index) {
                    $.ajax({
                        type: 'GET',
                        url: '/admin/role/delete?id='+id,
                        async: false,
                        success: function (data) {
                            if (data.code == 0) {
                                showMsg(data.msg, "error", 2000);
                            } else {
                                window.location.reload();
                            }

                        }
                    });
                    layer.close(index);
                });
            }

        </script>
    </div>
    <#include "module/_footer.ftl">
</div>
    <@footer></@footer>
</#compress>
