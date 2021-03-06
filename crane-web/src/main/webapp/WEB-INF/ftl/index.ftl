<!DOCTYPE html >
<html >
<head>
	<meta name="description" content="overview &amp; stats"/>
	<title>Taurus</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<#include "segment/html_header.ftl">
    <#include "segment/html_header2.ftl">
    <#include "segment/monitor-center_header.ftl">
    <link rel="stylesheet" href="${rc.contextPath}/css/loading.css">
    <script type="text/javascript" src="${rc.contextPath}/static/js/monitor_center.js"></script>
    <script src="${rc.contextPath}/js/jquery.datetimepicker.js"></script>
    <link rel="stylesheet" href="${rc.contextPath}/css/jquery.datetimepicker.css"/>
    
</head>

<body>
<#include "segment/index_header.ftl">
<#include "segment/left.ftl">

<div class="main-content  " style="opacity: 1;">
<div class="breadcrumbs" id="breadcrumbs">
    <script type="text/javascript">
        try {
            ace.settings.check('breadcrumbs', 'fixed')
        } catch (e) {
        }
    </script>
    <ul class="breadcrumb">
        <li class="active">
            <i class="icon-home home-icon"></i>
            <a href="${rc.contextPath}/index">HOME</a>
        </li>
    </ul>
    <div style="float:right;padding-right: 20px">
        <label>开始：</label><input type="text" id="startTime"/>
        <label>结束：</label><input type="text" id="endTime"/>
        <a class="btn btn-primary btn-small" href='javascript:void(0)' onClick="reflash_view()"><i class="icon-eye-open">查看</i></a>
    </div>
</div>
<div class="page-content">
<div class="row">
<div class="time_inal ">
    
    <div class="col-sm-5">
        <a class="atip" data-toggle="tooltip" data-placement="top"
           data-original-title="查看一天内的数据">[天] </a>
        &nbsp;&nbsp;|&nbsp;&nbsp;
        <a class="atip"
           href="${rc.contextPath}/index?step=-720&op=day&date=${bf1mD!}"
           data-toggle="tooltip" data-placement="top"
           data-original-title="时间区间[${bf1mDtip!}]">[-1m] </a>
        &nbsp;&nbsp; |&nbsp;&nbsp;
        <a class="atip"
           href="${rc.contextPath}/index?step=-168&op=day&date=${bf1wD!}"
           data-toggle="tooltip" data-placement="top"
           data-original-title="时间区间[${bf1wDtip!}]">[-1w] </a>
        &nbsp;&nbsp; |&nbsp;&nbsp;
        <a class="atip"
           href="${rc.contextPath}/index?step=-24&op=day&date=${bf1dD!}"
           data-toggle="tooltip" data-placement="top"
           data-original-title="时间区间[${bf1dDtip!}]">[-1d] </a>

        &nbsp;&nbsp; |&nbsp;&nbsp;
        <a class="atip"  
           href="${rc.contextPath}/index?step=24&op=day&date=${af1dD!}"
           data-toggle="tooltip" data-placement="top"
           data-original-title="时间区间[${af1dDtip!}]">[+1d] </a>
        &nbsp;&nbsp; |&nbsp;&nbsp;
        <a class="atip"  
           href="${rc.contextPath}/index?step=168&op=day&date=${af1wD!}"
           data-toggle="tooltip" data-placement="top"
           data-original-title="时间区间[${af1wDtip!}]">[+1w] </a>
        &nbsp;&nbsp; |&nbsp;&nbsp;
        <a class="atip"  
           href="${rc.contextPath}/index?step=720&op=day&date=${af1mD!}"
           data-toggle="tooltip" data-placement="top"
           data-original-title="时间区间[${af1mDtip!}]">[+1m] </a>
    </div>

    <div class="col-sm-2">
        <a class="atip" data-toggle="tooltip" data-placement="top"
           data-original-title="当你点击了[-1h]|[-1d]|[-1w]|[-1m]后，在想切换到当前页面时，请点击[当天]，刷新页面无效噢～">[注意] </a>
        &nbsp;&nbsp;|&nbsp;&nbsp;


        <a class="atip"
           href="${rc.contextPath}/index?step=720&op=day&date=${todayD!}"
           data-toggle="tooltip" data-placement="top"
           data-original-title=" 时间区间[${todayDtip!}]">[当天] </a>
    </div>
    <div class="col-sm-5 historyreport">

        <a class="atip" data-toggle="tooltip" data-placement="top"
           data-original-title="查看到今天所有的数据">[历史数据] </a>
        &nbsp;&nbsp;|&nbsp;&nbsp;
        <a class="atip"
           href="${rc.contextPath}/index?step=-720&op=history&date=${bf1mD!}"
           data-toggle="tooltip" data-placement="top"
           data-original-title="时间区间[${bf1mHtip!}]">[-1m] </a>
        &nbsp;&nbsp; |&nbsp;&nbsp;
        <a class="atip"
           href="${rc.contextPath}/index?step=-168&op=history&date=${bf1wD!}"
           data-toggle="tooltip" data-placement="top"
           data-original-title="时间区间[${bf1wHtip!}]">[-1w] </a>
        &nbsp;&nbsp; |&nbsp;&nbsp;
        <a class="atip"
           href="${rc.contextPath}/index?step=-24&op=history&date=${bf1dD!}"
           data-toggle="tooltip" data-placement="top"
           data-original-title="时间区间[${bf1dHtip!}]">[-1d] </a>
        &nbsp;&nbsp; |&nbsp;&nbsp;


        <a class="atip"  
           href="${rc.contextPath}/index?step=24&op=history&date=${af1dD!}"
           data-toggle="tooltip" data-placement="top"
           data-original-title="时间区间[${af1dHtip!}]">[+1d] </a>
        &nbsp;&nbsp; |&nbsp;&nbsp;
        <a class="atip" 
           href="${rc.contextPath}/index?step=168&op=history&date=${af1wD!}"
           data-toggle="tooltip" data-placement="top"
           data-original-title="时间区间[${af1wHtip!}]">[+1w] </a>
        &nbsp;&nbsp; |&nbsp;&nbsp;
        <a class="atip"  
           href="${rc.contextPath}/index?step=720&op=history&date=${af1mD!}"
           data-toggle="tooltip" data-placement="top"
           data-original-title="时间区间[${af1mHtip!}]">[+1m] </a>
    </div>
</div>

<div id="userpanel">
<div class="col-sm-12">
    <div class="col-sm-6">
        <div class="widget-box">
            <div class="widget-header header-color-green">
                <h5 class="widget-title">
                    <i class="icon-bell-alt"></i>
                    我的任务成功率
                </h5>

                <div class="widget-toolbar">
                    <a href="#" data-action="collapse">
                        <i class="icon-chevron-up"></i>
                    </a>
                </div>
            </div>

            <div class="widget-body" style="height: 320px">
                <div class="widget-main" id="user-widget-main">

                    <div id="mytasks">
                        <div class="loadIcon">
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                    </div>

                    <div class="hr hr8 hr-double"></div>

                    <div class="clearfix">
                        <div class="col-sm-4">
														<span class="grey">
															<i class="icon-lightbulb green"></i>
															&nbsp; 成功
														</span>
                            <h4 class="smaller pull-right" id="succtask"></h4>
                        </div>

                        <div class="col-sm-4">
														<span class="grey">
															<i class="icon-lightbulb red"></i>
															&nbsp; 失败
														</span>
                            <h4 class="smaller pull-right " id="failtask"></h4>
                        </div>
                        <div class="col-sm-4">
														<span class="grey">
															<i class="icon-lightbulb red"></i>
															&nbsp; 杀死
														</span>
                            <h4 class="smaller pull-right " id="killtask"></h4>
                        </div>
                        <div class="col-sm-4">
														<span class="grey">
															<i class="icon-lightbulb btn-yellow"></i>
															&nbsp; 超时
														</span>
                            <h4 class="smaller pull-right " id="timeouttask"></h4>
                        </div>
                        <div class="col-sm-4">
														<span class="grey">
															<i class="icon-lightbulb "></i>
															&nbsp; 拥堵
                                                            <h4 class="smaller pull-right " id="congesttask"></h4>
														</span>

                        </div>


                        <!-- /section:custom/extra.grid -->
                    </div>
                </div>
                <!-- /.widget-main -->
            </div>
            <!-- /.widget-body -->
        </div>
        <!-- /.widget-box -->

    </div>
    <div class="col-sm-6">
        <div class="widget-box">
            <div class="widget-header header-color-red">
                <h5 class="widget-title">
                    <i class="icon-bullseye"></i>
                    我的组的任务成功率
                </h5>

                <div class="widget-toolbar">
                    <a href="#" data-action="collapse">
                        <i class="icon-chevron-up"></i>
                    </a>
                </div>
            </div>

            <div class="widget-body">
                <div class="widget-main" id="group-widget-main">

                    <div id="grouptasks">
                        <div class="loadIcon">
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                    </div>

                    <div class="hr hr8 hr-double"></div>

                    <div class="clearfix">
                        <div class="col-sm-4">
														<span class="grey">
															<i class="icon-lightbulb green"></i>
															&nbsp; 成功
														</span>
                            <h4 class="smaller pull-right" id="groupsucctask"></h4>
                        </div>

                        <div class="col-sm-4">
														<span class="grey">
															<i class="icon-lightbulb red"></i>
															&nbsp; 失败
														</span>
                            <h4 class="smaller pull-right " id="groupfailtask"></h4>
                        </div>
                        <div class="col-sm-4">
														<span class="grey">
															<i class="icon-lightbulb red"></i>
															&nbsp; 杀死
														</span>
                            <h4 class="smaller pull-right " id="groupkilltask"></h4>
                        </div>
                        <div class="col-sm-4">
														<span class="grey">
															<i class="icon-lightbulb btn-yellow"></i>
															&nbsp; 超时
														</span>
                            <h4 class="smaller pull-right " id="grouptimouttask"></h4>
                        </div>
                        <div class="col-sm-4">
														<span class="grey">
															<i class="icon-lightbulb"></i>
															&nbsp; 拥堵
														</span>
                            <h4 class="smaller pull-right " id="groupcongesttask"></h4>
                        </div>

                        <!-- /section:custom/extra.grid -->
                    </div>
                </div>
                <!-- /.widget-main -->
            </div>
            <!-- /.widget-body -->
        </div>
        <!-- /.widget-box -->

    </div>
</div>
<div class="col-sm-12">
    <div class="col-sm-6">
        <div class="widget-box">
            <div class="widget-header header-color-blue2">
                <h5 class="widget-title">
                    <i class=" icon-list-ol"></i>
                    我的任务执行详情
                </h5>

                <div class="widget-toolbar">
                    <a href="#" data-action="collapse">
                        <i class="icon-chevron-up"></i>
                    </a>
                </div>
            </div>

            <div class="widget-body" style="height: 692px">

                <div class="widget-main align-center"  id="mytasklist">
                    <div class="loadIcon">
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                    </div>
                </div>
                <!-- /.widget-main -->
            </div>
            <!-- /.widget-body -->
        </div>
        <!-- /.widget-box -->

    </div>
    <div class="col-sm-6">
        <div class="widget-box">
            <div class="widget-header header-color-orange">
                <h5 class="widget-title">
                    <i class=" icon-list-ul"></i>
                    我所在组的任务执行详情
                </h5>

                <div class="widget-toolbar">

                    <a href="#" data-action="collapse">
                        <i class="icon-chevron-up"></i>
                    </a>
                </div>
            </div>

            <div class="widget-body" style="height: 692px">

                <div class="widget-main align-center"  id="grouptasklist">
                    <div class="loadIcon">
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                    </div>
                </div>
                <!-- /.widget-main -->
            </div>
            <!-- /.widget-body -->
        </div>
        <!-- /.widget-box -->

    </div>
</div>
</div>

</div>
</div>
<a href="#" class="scrollup" style="display: inline;">
    <img src="${rc.contextPath}/img/betop.png" width="66" height="67">
</a>

<div class="feedTool hide">

    <a target="_blank" style="color: white;" href="http://wpa.qq.com/msgrd?v=3&uin=767762405&site=qq&menu=yes"><img
            border="0" src="${rc.contextPath}/img/qq.png" width="80" height="80" color="white" alt="点我报错" title="点我报错"/></a>
    <a target="_blank" style="float:right; padding-right:16px;color: white;" href="javascript:close_tool()"><img
            border="0" src="${rc.contextPath}/img/x_alt.png" width="20" height="20" color="white" alt="关闭挂件" title="关闭挂件"/></a>

    <p style="text-align: center; padding-right:32px;color: firebrick">点我报错</p>
</div>
</div>
<script type="text/javascript">
    $('li[id="index"]').addClass("active open");
    $('li[id="monitor_center"]').addClass("active");
    $('#menu-toggler').on(ace.click_event, function () {
        $('#sidebar').toggleClass('display');
        $(this).toggleClass('display');
        return false;
    });

    // 基于准备好的dom，初始化echarts图表
    $(".atip").tooltip();
    options = {
        delay: { show: 500, hide: 100 },
        trigger: 'click'
    };
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('.scrollup').fadeIn();
        } else {
            $('.scrollup').fadeOut();
        }
    });

    $('.scrollup').click(function () {
        $("html, body").scrollTop(0);
        return false;
    });

    function GetDateStr(dd, AddDayCount) {
        dd.setDate(dd.getDate() + AddDayCount);//获取AddDayCount天后的日期
        var y = dd.getFullYear();
        var m = dd.getMonth() + 1;//获取当前月份的日期
        var d = dd.getDate();
        return y + "-" + m + "-" + d;
    }
    var now_s = "${now_s!}";
    var now = new Date(Date.parse(now_s.replace(/-/g, "/")));
    var id = "${step!}";
    var op = "${op_str!}";
    var isAdmin = ${isAdmin?c};
    //console.log(isAdmin);
    var username = "${currentUser!}";
   // if (isAdmin && username != "kirin.li") {
      //  var user = document.getElementById("userpanel");
       // user.style.display = "none";
   // } else {
        //var admin = document.getElementById("admin");
        //admin.style.display="none";
    //}
    $('#startTime').datetimepicker({
        formatTime:'H:i',
        format:'Y-m-d',
        formatDate:'Y-m-d',
        defaultTime:'10:00',
        timepicker:false,
        timepickerScrollbar:false
    });

    $('#endTime').datetimepicker({
        format:'Y-m-d',
        formatDate:'Y-m-d',
        defaultTime:'10:00',
        timepicker:false,
        timepickerScrollbar:false
    });

    
</script>
</body>
</html>