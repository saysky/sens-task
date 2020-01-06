<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/plugins/bootstrap/css/bootstrap.min.css?version=1.5.0">
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/plugins/toast/css/jquery.toast.min.css?version=1.5.0">
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/plugins/fileinput/fileinput.min.css?version=1.5.0">
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/css/AdminLTE.min.css?version=1.5.0">
</head>
<body>
<div class="container-fluid">
    <section class="content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#allAttach"
                       data-toggle="tab"><@spring.message code='admin.attachments.modal.select.tab.all-attach' /></a>
                </li>
                <li>
                    <a href="#uploadAttach"
                       data-toggle="tab"><@spring.message code='admin.attachments.modal.select.tab.upload' /></a>
                </li>
                <li class="pull-right">
                    <form>
                        <div class="form-group">
                            <input type="text" class="form-control input-group-lg" id="keywords" name="keywords"
                                   value="${(RequestParameters.keywords)!}" placeholder="搜索附件文件">
                        </div>
                    </form>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="allAttach">
                    <div class="row">
                        <div id="attachment-box">
                        <#list attachments as attachment>
                            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6 div-thumbnail">
                                <a href="#" class="thumbnail"
                                   data-clipboard-text="${attachment.attachPath}">
                                    <img src="${attachment.attachSmallPath}" class="img-responsive">
                                </a>
                            </div>
                        </#list>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <#assign hasNext = (pageInfo.current < pageInfo.pages)>
                        <#assign hasPrevious = (pageInfo.current > 1)>
                            <div class="no-margin pull-left">
                            <@spring.message code='admin.pageinfo.text.no' /> <span
                                    id="pageNum">${pageInfo.current}</span>
                                /${pageInfo.pages}<@spring.message code='admin.pageinfo.text.page' />
                            </div>
                            <ul class="pagination no-margin pull-right">
                                <li><a class="btn btn-sm <#if !hasPrevious>disabled</#if>"
                                       href="/admin/attachment/select"><@spring.message code='admin.pageinfo.btn.first' /></a>
                                </li>
                                <li><a class="btn btn-sm <#if !hasPrevious>disabled</#if>"
                                       href="/admin/attachment/select?page=${pageInfo.current-1}"><@spring.message code='admin.pageinfo.btn.pre' /></a>
                                </li>
                                <li><a class="btn btn-sm <#if !hasNext>disabled</#if>"
                                       href="/admin/attachment/select?page=${pageInfo.current+1}"><@spring.message code='admin.pageinfo.btn.next' /></a>
                                </li>
                                <li><a class="btn btn-sm <#if !hasNext>disabled</#if>"
                                       href="/admin/attachment/select?page=${pageInfo.pages-1}"><@spring.message code='admin.pageinfo.btn.last' /></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="uploadAttach">
                    <div class="row" id="uploadForm">
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="file-loading">
                                    <input id="uploadImg" class="file-loading" type="file" multiple name="file">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
</body>
<script src="${options.blog_static_url?if_exists}/static/plugins/jquery/jquery.min.js?version=1.5.0"></script>
<script src="${options.blog_static_url?if_exists}/static/plugins/bootstrap/js/bootstrap.min.js?version=1.5.0"></script>
<script src="${options.blog_static_url?if_exists}/static/plugins/fileinput/fileinput.min.js?version=1.5.0"></script>
<#if options.blog_locale?default('zh_CN')=='zh_CN'>
<script src="${options.blog_static_url?if_exists}/static/plugins/fileinput/zh.min.js?version=1.5.0"></script>
</#if>
<script src="${options.blog_static_url?if_exists}/static/plugins/clipboard/clipboard.min.js?version=1.5.0"></script>
<script src="${options.blog_static_url?if_exists}/static/plugins/toast/js/jquery.toast.min.js?version=1.5.0"></script>
<script src="${options.blog_static_url?if_exists}/static/js/app.js?version=1.5.0"></script>
<script>
    $('#uploadImg').fileinput({
        language: 'zh',
        uploadUrl: '/admin/attachment/upload',
        uploadAsync: true,
        allowedFileExtensions: ['jpg', 'gif', 'png', 'jpeg', 'svg'],
        maxFileCount: 10,
        enctype: 'multipart/form-data',
        showClose: false
    }).on("fileuploaded", function (event, data, previewId, index) {
        var data = data.jqXHR.responseJSON;
        if (data.success == "1") {
            $("#uploadForm").hide(400);
            $.toast({
                text: data.message,
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
        }
    });


    $(document).ready(function () {
        var clipboard = new Clipboard('.thumbnail');
    });
    $(document).on('click', '.thumbnail', function () {
        showMsg("<@spring.message code='admin.attachments.modal.js.copy-success' />", "success", 1000)
    });

    <#--var winH = $(window).height(); //页面可视区域高度-->
    <#--var i = 1;-->
    <#--var max = ${pageInfo.pages};-->
    <#--$(window).scroll(function () {-->
    <#--    var pageH = $(document.body).height();-->
    <#--    var scrollT = $(window).scrollTop(); //滚动条top-->
    <#--    var aa = (pageH - winH - scrollT) / winH;-->
    <#--    if (aa < 0.02 && i < max) {-->
    <#--        i++;-->
    <#--        $("#pageNum").html(i);-->
    <#--        var keywords = $('#keywords').val();-->
    <#--        $.ajax({-->
    <#--            type: 'GET',-->
    <#--            url: '/admin/attachment/page?page=' + i + '&keywords=' + keywords,-->
    <#--            success: function (data) {-->
    <#--                if (data.code == 1) {-->
    <#--                    var str = '';-->
    <#--                    $.each(data.result, function (index, value) {-->
    <#--                        str += '<div class="col-lg-2 col-md-3 col-sm-6 col-xs-6 div-thumbnail">' +-->
    <#--                                '     <a href="#" class="thumbnail"  data-clipboard-text="' + value.attachPath + '">\n' +-->
    <#--                                '         <img src="' + value.attachSmallPath + '" class="img-responsive"\n' +-->
    <#--                                '          title="' + value.attachName + '">\n' +-->
    <#--                                '     </a>\n' +-->
    <#--                                '</div>';-->
    <#--                    });-->
    <#--                    $("#attachment-box").append(str);-->
    <#--                } else {-->
    <#--                    showMsg(data.msg, "error", 1000);-->
    <#--                }-->
    <#--            }-->
    <#--        })-->
    <#--    }-->
    <#--});-->
</script>
</html>
