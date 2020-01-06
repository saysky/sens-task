<aside class="main-sidebar">
    <section class="sidebar">
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<@shiro.principal  property="userAvatar"/>" class="img-circle"
                     style="width: 45px;height: 45px;" alt="User Image">
            </div>
            <div class="pull-left info">
                <p><@shiro.principal  property="userDisplayName"/></p>
                <a href="/admin/user/profile"><i
                        class="fa fa-circle text-success"></i><@spring.message code='admin.menu.profile' /></a>
            </div>
        </div>
        <form action="/search" method="get" target="_blank" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="keyword" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                  <button type="submit" name="keyword" id="search-btn" target="_blank"  class="btn btn-flat">
                    <i class="fa fa-search"></i>
                  </button>
                </span>
            </div>
        </form>

        <ul class="sidebar-menu" data-widget="tree">
            <#--<li class="header">HEADER</li>-->
            <#--<li>-->
                <#--<a data-pjax="true" href="/admin">-->
                    <#--<i class="fa fa-dashboard"></i>-->
                    <#--<span><@spring.message code='admin.menu.dashboard' /></span>-->
                <#--</a>-->
            <#--</li>-->
            <#--<li class="treeview">-->
                <#--<a data-pjax="true" href="#">-->
                    <#--<i class="fa  fa-book"></i>-->
                    <#--<span><@spring.message code='admin.menu.posts' /></span>-->
                    <#--<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>-->
                <#--</a>-->
                <#--<ul class="treeview-menu">-->
                        <#--<li>-->
                            <#--<a data-pjax="true" href="/admin/post">-->
                                <#--<i class="fa fa-circle-o"></i><@spring.message code='admin.menu.all-posts' />-->
                            <#--</a>-->
                        <#--</li>-->
                        <#--<li>-->
                            <#--<a data-pjax="false" href="/admin/post/new">-->
                                <#--<i class="fa fa-circle-o"></i>-->
                                <#--<@spring.message code='admin.menu.new-post' />-->
                            <#--</a>-->
                        <#--</li>-->
                        <#--<li>-->
                            <#--<a data-pjax="true" href="/admin/category">-->
                                <#--<i class="fa fa-circle-o"></i>-->
                                <#--<@spring.message code='admin.menu.categories' />-->
                            <#--</a>-->
                        <#--</li>-->
                        <#--<li>-->
                            <#--<a data-pjax="true" href="/admin/tag">-->
                                <#--<i class="fa fa-circle-o"></i><@spring.message code='admin.menu.tags' />-->
                            <#--</a>-->
                        <#--</li>-->
                <#--</ul>-->
            <#--</li>-->

            <#--<li class="treeview">-->
                <#--<a data-pjax="true" href="#">-->
                    <#--<i class="fa fa-desktop"></i>-->
                    <#--<span><@spring.message code='admin.menu.pages' /></span>-->
                    <#--<span class="pull-right-container">-->
                        <#--<i class="fa fa-angle-left pull-right"></i>-->
                    <#--</span>-->
                <#--</a>-->
                <#--<ul class="treeview-menu">-->
                    <#--<li><a data-pjax="true" href="/admin/page"><i-->
                            <#--class="fa fa-circle-o"></i><@spring.message code='admin.menu.all-pages' /></a></li>-->
                    <#--<li><a data-pjax="false" href="/admin/page/new"><i-->
                            <#--class="fa fa-circle-o"></i><@spring.message code='admin.menu.new-page' /></a></li>-->
                <#--</ul>-->
            <#--</li>-->
            <#--<li>-->
                <#--<a data-pjax="true" href="/admin/attachment">-->
                    <#--<i class="fa fa-picture-o"></i>-->
                    <#--<span><@spring.message code='admin.menu.attachments' /></span>-->
                <#--</a>-->
            <#--</li>-->
            <#--<li>-->
                <#--<a data-pjax="true" href="/admin/comment">-->
                    <#--<i class="fa fa-comment"></i>-->
                    <#--<span><@spring.message code='admin.menu.comments' /></span>-->
                    <#--<span class="pull-right-container">-->
                    <#--<#if newComments?size gt 0>-->
                        <#--<span class="label label-primary pull-right">${newComments?size}</span>-->
                    <#--</#if>-->
                    <#--</span>-->
                <#--</a>-->
            <#--</li>-->
            <#--<li class="treeview">-->
                <#--<a data-pjax="true" href="#">-->
                    <#--<i class="fa fa-paint-brush"></i>-->
                    <#--<span><@spring.message code='admin.menu.appearance' /></span>-->
                    <#--<span class="pull-right-container">-->
                        <#--<i class="fa fa-angle-left pull-right"></i>-->
                    <#--</span>-->
                <#--</a>-->
                <#--<ul class="treeview-menu">-->
                    <#--<li><a data-pjax="true" href="/admin/theme"><i-->
                            <#--class="fa fa-circle-o"></i><@spring.message code='admin.menu.themes' /></a></li>-->
                    <#--<li><a data-pjax="true" href="/admin/menu"><i-->
                            <#--class="fa fa-circle-o"></i><@spring.message code='admin.menu.menus' /></a></li>-->
                    <#--<li><a data-pjax="true" href="/admin/slide"><i-->
                            <#--class="fa fa-circle-o"></i><@spring.message code='admin.menu.slides' /></a></li>-->
                    <#--<li><a data-pjax="true" href="/admin/widget"><i-->
                            <#--class="fa fa-circle-o"></i><@spring.message code='admin.menu.widgets' /></a></li>-->
                    <#--<li><a data-pjax="false" href="/admin/theme/editor"><i-->
                            <#--class="fa fa-circle-o"></i><@spring.message code='admin.menu.edit-theme' /></a></li>-->
                <#--</ul>-->
            <#--</li>-->
            <#--<li class="treeview">-->
                <#--<a data-pjax="true" href="#">-->
                    <#--<i class="fa fa-user-o"></i>-->
                    <#--<span><@spring.message code='admin.menu.user' /></span>-->
                    <#--<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>-->
                <#--</a>-->
                <#--<ul class="treeview-menu">-->
                    <#--<li><a data-pjax="true" href="/admin/user"><i-->
                            <#--class="fa fa-circle-o"></i><@spring.message code='admin.menu.user.list' /></a></li>-->
                    <#--<li><a data-pjax="true" href="/admin/user/profile"><i-->
                            <#--class="fa fa-circle-o"></i><@spring.message code='admin.menu.profile' /></a></li>-->
                <#--</ul>-->
            <#--</li>-->
            <#--<li class="treeview">-->
                <#--<a data-pjax="true" href="#">-->
                    <#--<i class="fa fa-cog"></i>-->
                    <#--<span><@spring.message code='admin.menu.settings' /></span>-->
                    <#--<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>-->
                <#--</a>-->
                <#--<ul class="treeview-menu">-->
                    <#--<li><a data-pjax="true" href="/admin/option"><i-->
                            <#--class="fa fa-circle-o"></i><@spring.message code='admin.menu.blog-settings' /></a></li>-->
                    <#--<li><a data-pjax="true" href="/admin/backup"><i-->
                            <#--class="fa fa-circle-o"></i><@spring.message code='admin.menu.blog-backup' /></a></li>-->
                    <#--<li><a data-pjax="true" href="/admin/role"><i-->
                            <#--class="fa fa-circle-o"></i><@spring.message code='admin.menu.role' /></a></li>-->
                <#--</ul>-->
            <#--</li>-->
        </ul>
    </section>
</aside>
