<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/plugins/bootstrap/css/bootstrap.min.css?version=1.5.0">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 attachDesc" style="padding-top: 15px;">
            <div class="box box-solid">
                <div class="box-body table-responsive">
                    <table class="table table-bordered table-hover text-center">
                        <thead>
                        <tr>
                            <th class="col-md-2">名称</th>
                            <th class="col-md-1">用户名</th>
                            <th class="col-md-1">IP</th>
                            <th class="col-md-3">请求类型和路径</th>
                            <th class="col-md-3">参数</th>
                            <th class="col-md-2">时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#if logs??>
                            <#list logs as log>
                                <tr>
                                    <td>${log.name?if_exists}</td>
                                    <td>${log.username?if_exists}</td>
                                    <td>${log.ip?if_exists}</td>
                                    <td>${log.requestType?if_exists} ${log.requestUrl?if_exists}</td>
                                    <td>${log.requestParam?if_exists}</td>
                                    <td>${log.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                </tr>
                            </#list>
                        <#else>
                            <tr>
                                <td><@spring.message code='common.text.no-data' /></td>
                            </tr>
                        </#if>
                        </tbody>
                    </table>
                </div>
                <div class="box-footer clearfix">
                    <div class="no-margin pull-left">
                        <@spring.message code='admin.pageinfo.text.no' />${pageInfo.current}/${pageInfo.pages}<@spring.message code='admin.pageinfo.text.page' />
                    </div>
                    <div class="no-margin pull-right">
                    <#assign hasPrevious = (pageInfo.current > 1)>
                    <#assign hasNext = (pageInfo.current < pageInfo.pages)>
                        <ul class="pagination" style="margin: 0;">
                            <li><a class="btn btn-sm <#if !hasPrevious>disabled</#if>" href="/admin/logs"><@spring.message code='admin.pageinfo.btn.first' /></a> </li>
                            <li><a class="btn btn-sm <#if !hasPrevious>disabled</#if>" href="/admin/logs?page=${pageInfo.current-1}"><@spring.message code='admin.pageinfo.btn.pre' /></a></li>
                            <li><a class="btn btn-sm <#if !hasNext>disabled</#if>" href="/admin/logs?page=${pageInfo.current+1}"><@spring.message code='admin.pageinfo.btn.next' /></a></li>
                            <li><a class="btn btn-sm <#if !hasNext>disabled</#if>" href="/admin/logs?page=${pageInfo.pages}"><@spring.message code='admin.pageinfo.btn.last' /></a> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${options.blog_static_url?if_exists}/static/plugins/jquery/jquery.min.js?version=1.5.0"></script>
<script src="${options.blog_static_url?if_exists}/static/plugins/bootstrap/js/bootstrap.min.js?version=1.5.0"></script>
</html>
