<#--<#include '../cms_common/login.ftl'>-->

<link href="/cms/css/bootstrap.css" rel="stylesheet"/>
<link href="/cms/css/wallStreet.css" rel="stylesheet"/>

<style rel="stylesheet">
    html,body{
        font-family: Helvetica,Microsoft YaHei,Hiragino Sans GB,WenQuanYi Micro Hei,sans-serif;
    }
    .navbar-right li:last-child {
        padding-left:15px ;
    }
    .navbar-right li:last-child a{
        display: inline-block;
        padding: 14px 0 0 0;
    }
</style>

<!-- 导航 -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid" style="margin-top: 0.5%">
        <div class="collapse navbar-collapse row" id="bs-example-navbar-collapse-1">
            <div class="navbar-center col-lg-6" style="border-right: 2px solid #e3d9d9">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#" style="font-weight: bold;">投顾系统</a>
                </div>
            </div>
            <ul class="nav navbar-nav navbar-right col-lg-6">
                <li><a href="/cms/calendarPage" id="toIndex">首页</a></li>
                <li><a href="/cms/focusNewsPage" id="">实时快讯</a></li>
                <li><a href="/cms/calendarPage" id="">财经日历</a></li>
                <li><a href="/cms/newsPage" id="">央行新闻</a></li>
                <li><a href="/cms/reportPage#" id="">央行报告</a></li>
                <li><a href="#" id="focusPlan">焦点规划</a></li>
                <li><a href="#" id="aboutUs">关于我们</a></li>
                <#if  Session["currentUser"]  ??>
                    <li>
                        <a href="#"  >${Session["currentUser"]}&nbsp;/</a>
                        <a href="#"  id = "logout">&nbsp;退出</a>
                    </li>

                <#else>
                    <li>
                        <a href="#"  data-toggle="modal" data-target="#loginModal" data-backdrop="static">登录&nbsp;/</a>
                        <a href="#"   data-toggle="modal"  data-target="#registerModal" data-backdrop="static">&nbsp;注册</a>
                    </li>
                </#if>


            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->

</nav>

<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:500px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">用户登录</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="loginForm">
                    <div class="box-body">
                        <div class="form-group"></div>
                        <div class="form-group">
                            <label for="userName" class="col-sm-2 control-label">用户名:</label>

                            <div class="col-sm-10">
                                <input type="email" class="form-control" name="userName" placeholder="用户名">
                            </div>
                        </div>
                        <div class="form-group"></div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">密码:</label>

                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="password" placeholder="密码">
                            </div>
                        </div>
                        <div class="form-group"></div>

                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" id="loginBtn" class="btn btn-primary">登录</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:600px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">用户注册</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="registerForm">
                    <div class="box-body">
                        <div class="form-group"></div>
                        <div class="form-group">
                            <label for="userName" class="col-sm-2 control-label">用户名:</label>

                            <div class="col-sm-10">
                                <input type="email" class="form-control" name="userName" placeholder="用户名">
                            </div>
                        </div>
                        <div class="form-group"></div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">密码:</label>

                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="password" placeholder="密码">
                            </div>
                        </div>
                        <div class="form-group"></div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">确认密码:</label>

                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="repassword" placeholder="重复密码">
                            </div>
                        </div>

                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" id="registerBtn" class="btn btn-primary">注册</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/cms/js/lib/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/cms/js/lib/bootstrap.js"></script>
<script type="text/javascript" src="/cms/js/lib/util.js"></script>
<script src="/bower_components/bootstrap-table/src/bootstrap-table.js"></script>
<script src="/bower_components/bootstrap-table/src/locale/bootstrap-table-zh-CN.js"></script>
<script>
    $(function(){
        $("#registerBtn").on('click',function(){
            $.ajax({
                url : "saveUser",
                type : "post",
                data : $("#registerForm").serialize(),
                dataType : "json",
                success : function(data){
                    $("#registerModal").modal('hide');

                    alert("注册成功");

                },
                error : function(){
                    $("#registerModal").modal('hide');
                    alert("注册失败")

                }
            });
        });

        $("#loginBtn").on('click',function () {
            $.ajax({
                url : "doLogin",
                type : "post",
                data : $("#loginForm").serialize(),
                dataType : "json",
                success : function(data){
                    debugger;
                    $("#loginModal").modal('hide');

                    if(data == "200"){
                        location.reload();
                    }else{
                        alert("登录失败");
                    }
                },
                error : function(){
                    $("#loginModal").modal('hide');
                    alert("登录失败")

                }
            });
        });

        $("#logout").on('click',function () {
            $.ajax({
                url : "logout",
                type : "post",
                dataType : "json",
                success : function(data){
                        location.reload();
                },
                error : function(){
                    alert("登出失败")
                }
            });
        });

        $("#loginModal").on("hidden.bs.modal", function() {
            $('#loginForm')[0].reset();
        });

        $("#registerModal").on("hidden.bs.modal", function() {
            $('#registerForm')[0].reset();
        });

    });
</script>